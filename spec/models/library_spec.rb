require 'rails_helper'

RSpec.describe Library, type: :model do
  before(:each) do
    @rails = Framework.create(name: "Rails", description: "Convention wins!")
    @ruby = Language.create(name: "Ruby", description: "love the self") # but have occasional breakups
  end

  describe "Properties" do
  
    it 'has a name, verison and description' do
      expect(Library.new).to respond_to(:name)
      expect(Library.new).to respond_to(:version)
      expect(Library.new).to respond_to(:description)
    end

    it 'has links to documentaion and library pages' do
      expect(Library.new).to respond_to(:documentation_url)
      expect(Library.new).to respond_to(:library_url)
    end
    
  end

  describe "Relationships" do
    let(:lib) {Library.create(name: "Omniauth")}

    it "belongs to a framework" do
      lib.framework = Framework.create(name: "Sinatra")
      expect(lib.framework).to eq(Framework.last)
    end

    it "belongs to a language" do
      lib.language = Language.create(name: "Python")
      expect(lib.language).to eq(Language.last)
    end

    it "has a user that is aliased with created_by" do
      lib.user = User.first
      expect(lib.created_by).to eq(User.first)

      lib.created_by = User.create(email: Faker::Internet.free_email, password: "password")
      expect(lib.user).to eq(User.last)
    end

    xit "has_many Reviews" do
    end
    
  end
  
end
