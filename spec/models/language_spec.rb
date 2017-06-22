require 'rails_helper'

RSpec.describe Language, type: :model do
  before(:each) do
    @rails = Framework.create(name: "Rails", description: "Convention wins!")
    @ruby = Language.create(name: "Ruby", description: "love the self") # but have occasional breakups
    @devise = Library.create(name: "devise", description: "user auth taken care of", framework: @rails, language: @ruby)
  end

  describe "Properties/Relationships" do
    
    it 'has a name and description' do
      expect(Language.new).to respond_to(:name)
      expect(Language.new).to respond_to(:description)
    end

    it 'has_many libraries' do
      lib = Library.create(name: "Omniauth", language: @ruby)
      expect(@ruby.libraries).to include(lib)
      expect(@ruby.libraries.count).to eq(2)
    end
    
    it 'has_many frameworks through libraries' do
      lib = Library.create(name: "Omniauth", language: @ruby, framework: @rails)
      expect(@ruby.frameworks).to include(@rails)
    end
    
  end

  describe "Functions" do

    it '#average_rating -> average rating accross all libraries' do
      Review.create(rating: 5, library: @devise)
      Review.create(rating: 1, library: @devise)
      expect(@ruby.average_rating).to eq(3)
    end
  end

  describe "Scopes" do
    before(:each) do
      @css = Language.create(name: "css")
      @bootstrap_sass = Library.create(name: "Bootstrap-sass", language: @css, framework: @rails)

      15.times { Review.create(rating: 1, library: @devise)}
      Review.create(rating: 5, library: @bootstrap_sass)
    end
    
    it 'can get the most popular' do
      expect(Language.most_popular.first).to eq(@ruby)
    end
    
    it 'can get get all the languages for a given framework' do
      expect(Language.by_framework(@rails)).to include(@ruby, @css)
    end
    
    it 'can get the most popular language for a given framework' do
      res = Language.by_framework(@rails).most_popular
      expect(res.first).to eq(@ruby)
      expect(res.last).to eq(@css)
    end
    
  end

  describe "Validations" do
    it 'validats name is present' do
      expect(Language.new(name: "test")).to be_valid
      expect(Language.new).to_not be_valid
    end
  end
  
end
