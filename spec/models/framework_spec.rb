require 'rails_helper'

RSpec.describe Framework, type: :model do

  before(:each) do
    @rails = Framework.create(name: "Rails", description: "Convention wins!")
    @ruby = Language.create(name: "Ruby", description: "love the self") # but have occasional breakups
    @devise = Library.create(name: "devise", description: "user auth taken care of", framework: @rails, language: @ruby)
  end

  describe "Properties/Relationships" do
    
    it 'has a name and description' do
      expect(Framework.new).to respond_to(:name)
      expect(Framework.new).to respond_to(:description)
    end

    it 'has_many libraries' do
      lib = Library.create(name: "Omniauth", framework: @rails)
      expect(@rails.libraries).to include(lib)
    end
    
    it 'has_many languages through libraries' do
      lib = Library.create(name: "Omniauth", framework: @rails, language: @ruby)
      expect(@rails.languages).to include(@ruby)
    end

  end  
  # More tests here

  describe "Functions" do
    
    it 'can calculate average_rating' do
      Review.create(rating: 5, library: @devise)
      Review.create(rating: 0, library: @devise)
      expect(@rails.average_rating).to eq(2.5)
    end
    
  end
  
  describe "Scopes" do

    before(:each) do
      @python = Language.create(name: "python")
      @django = Framework.create(name: "django")
      @flask = Framework.create(name: "flask")
      @django_rest = @python.libraries.create(name: "django-rest", framework: @django)
      @django_jet = @python.libraries.create(name: "django-jet", framework: @django)
      @flask_assets = @python.libraries.create(name: "flask-assets", framework: @flask)

      @flask_assets.reviews.create(rating: 3)
      @django_rest.reviews.create(rating: 3)

      3.times do
        @devise.reviews.create(rating: 4)
      end
      
    end

    it 'can get the most popular' do
      expect(Framework.most_popular.first).to eq(@rails)
    end
    
    it 'can get all frameworks for a given language' do
      expect(Framework.by_language(@python).to_ary).to eq([@django, @flask])
    end
    
    it 'can get the most popular for a given language' do
      @django_jet.reviews.create(rating: 5)
      expect(Framework.by_language(@python).most_popular.first).to eq(@django)

      2.times { @flask_assets.reviews.create(rating: 2) }
      expect(Framework.by_language(@python).most_popular.first).to eq(@flask)
    end
    
  end
  

end
