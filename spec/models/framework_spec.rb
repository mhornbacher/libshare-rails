require 'rails_helper'

RSpec.describe Framework, type: :model do

  before(:each) do
    @rails = Framework.first
    @ruby = Language.first
    @javascript = Language.last
    @devise = Library.find_by(name: "Devise")
  end

  describe "Properties/Relationships" do
    
    it 'has a name and description' do
      expect(Framework.new).to respond_to(:name)
      expect(Framework.new).to respond_to(:description)
    end

    it 'has_many libraries' do
      lib = Library.create(name: "Omniauth", framework: @rails, language: @ruby)
      expect(@rails.libraries).to include(lib)
    end
    
    it 'has_many languages through libraries' do
      lib = Library.create(name: "Omniauth", framework: @rails, language: @ruby)
      expect(@rails.languages).to include(@ruby)
    end

  end  

  describe "Functions" do
    
    it '#average_rating -> Calculates average rating for library' do
      # this number is generated from the seed file
      expect(@rails.average_rating).to eq(3.5)
    end
    
    it '#most_recent -> sorts by updated at in descending order' do
      expect(Framework.most_recent).to eq(Framework.order("updated_at DESC"))
    end

  end
  
  describe "Scopes" do

    it '#most popular -> most popular by review count' do
      expect(Framework.most_popular.pluck(:name)).to eq(["Rails", "jQuery", "React", "Sinatra"])
    end
    
    it '#by_language -> all the languages with a given language' do
      expect(Framework.by_language(@javascript).pluck(:name)).to eq(["Rails", "jQuery", "React"])
    end
    
    it '#by_language.most_popular -> most popular by reviews tied to this language' do
      # Rails is last here since it only has one review for javascript
      expect(Framework.by_language(@javascript).most_popular.pluck(:name)).to eq(["jQuery", "React", "Rails"])
    end
    
  end


  describe "Validations" do
    it 'validats name is present' do
      expect(Framework.new(name: "test")).to be_valid
      expect(Framework.new).to_not be_valid
    end
  end
  

end
