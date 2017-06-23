require 'rails_helper'

RSpec.describe Language, type: :model do
  before(:each) do
    @rails = Framework.first
    @ruby = Language.first
    @javascript = Language.last
    @devise = Library.find_by(name: "Devise")
  end

  describe "Properties/Relationships" do
    
    it 'has a name and description' do
      expect(Language.new).to respond_to(:name)
      expect(Language.new).to respond_to(:description)
    end

    it 'has_many libraries' do
      lib = Library.create(name: "Omniauth", language: @ruby)
      expect(@ruby.libraries).to include(lib)
      expect{Library.create(name: "omniauth-github", language: @ruby)}.to change {@ruby.libraries.count}.by(1)
    end
    
    it 'has_many frameworks through libraries' do
      lib = Library.create(name: "Omniauth", language: @ruby, framework: @rails)
      expect(@ruby.frameworks).to include(@rails)
    end
    
  end

  describe "Functions" do

    it '#average_rating -> average rating accross all libraries' do
      expect(@ruby.average_rating).to eq(2.75)
    end
  end

  describe "Scopes" do
    
    it '#most popular -> most popular by review count' do
      expect(Language.most_popular.to_ary).to eq([@javascript, @ruby])
    end
    
    it '#by_framework -> all the languages with a given framework' do
      expect(Language.by_framework(@rails)).to include(@ruby, @javascript)
    end
    
    it '#by_framework.most_popular -> most popular by reviews tied to this framework' do
      css = Language.create(name: "CSS")
      bootstrap = css.libraries.create(name: "Bootstrap", framework: @rails)
      5.times {bootstrap.reviews.create(rating: 3)}

      expect(Language.by_framework(@rails).most_popular.pluck(:name)).to eq(["CSS", "Ruby", "JavaScript"])
    end

    it '#most_recent -> sorts by updated at in descending order' do
      expect(Language.most_recent).to eq(Language.order("updated_at DESC"))
    end
    
  end

  describe "Validations" do
    it 'validats #name is present' do
      expect(Language.new(name: "test")).to be_valid
      expect(Language.new).to_not be_valid
    end
  end
  
end
