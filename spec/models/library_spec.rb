require 'rails_helper'

RSpec.describe Library, type: :model do
  before(:each) do
    @rails = Framework.create(name: "Rails", description: "Convention wins!")
    @ruby = Language.create(name: "Ruby", description: "love the self") # but have occasional breakups
    @devise = Library.create(name: "Devise", description: "authentication", language: @ruby, framework: @rails)
    @user = User.create(email: Faker::Internet.free_email, password: "password")
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
      lib.created_by = User.create(email: Faker::Internet.free_email, password: "password")
      expect(lib.created_by).to eq(User.last)
    end

    it "has_many Reviews" do
      Review.create(user: @user, library: lib, rating: 5, comment: "too cool!")
      expect(lib.reviews).to include(Review.last)
    end
    
  end

  describe "Functions" do
    before(:each) do
      @comment = Review.create(library: @devise, rating: 5, comment: "Testing comments")
      @no_comment = Review.create(library: @devise, rating: 1, comment: "")
    end

    it 'can calculate an average rating' do
      expect(@devise.average_rating).to eq(3)
    end

    it 'can retrive all reviews with comments' do
      expect(@devise.comments).to include(@comment)
      expect(@devise.comments).to_not include(@no_comment)
    end
    
  end

  describe "Validations" do
    
    it 'validates that the documentation_url is valid' do
      expect(Library.new(documentation_url: "")).to be_valid
      expect(Library.new(documentation_url: "http://test.com")).to be_valid
      expect(Library.new(documentation_url: "https://test.com")).to be_valid
      expect(Library.new(documentation_url: "test.com")).to_not be_valid
    end

    it 'validates that the library_url is valid' do
      expect(Library.new(library_url: "")).to be_valid
      expect(Library.new(library_url: "http://test.com")).to be_valid
      expect(Library.new(library_url: "https://test.com")).to be_valid
      expect(Library.new(library_url: "test.com")).to_not be_valid
    end

  end
  
end
