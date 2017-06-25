require 'rails_helper'

RSpec.describe Library, type: :model do
  before(:each) do
    @rails = Framework.first
    @ruby = Language.first
    @javascript = Language.last
    @devise = Library.find_by(name: "Devise")
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
    let(:lib) {Library.create(name: "Omniauth", framework: @rails, language: @ruby)}

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
      @comment = Review.create(library: @devise, rating: 5, comment: "Testing comments", user: @user)
      @no_comment = Review.create(library: @devise, rating: 1, comment: "", user: @user)
    end

    it '#average rating -> the average rating from all reviews' do
      expect(@devise.average_rating).to eq(2.66666666666667)
    end

    it '#comments -> only reviews with comments' do
      expect(@devise.comments).to include(@comment)
      expect(@devise.comments).to_not include(@no_comment)
    end

    it '#comment_count -> returns the number of comments on the library' do
      expect(@devise.comment_count).to eq(2)
    end
    
    it '#vote_count -> returns the total number of reviews' do
      expect(@devise.vote_count).to eq(3) # one more no comment review comes form the seeds.rb file
    end
    
  end

  describe "Scopes" do

    it '#most_popular -> sorts by most popular' do
      expect(Library.most_popular.limit(3).pluck(:name)).to eq(["Devise", "CanCanCan", "Pundit"])
    end

    it '#most_recent -> sorts by updated at in descending order' do
      expect(Library.most_recent).to eq(Library.order("updated_at DESC"))
    end

  end

  describe "Validations" do

    it 'validats that the name is present' do
      @library = Library.new
      @library.valid?

      expect(@library.errors).to have_key(:name)
    end
    
    it 'validates that the documentation_url is valid' do
      @library = Library.new(name: "test")
      @library.documentation_url = "test.com"
      @library.valid?

      expect(@library.errors).to have_key(:documentation_url)
    end

    it 'validates that the library_url is valid' do
      @library = Library.new(name: "test")
      @library.library_url = "test.com"
      @library.valid?

      expect(@library.errors).to have_key(:library_url)
    end

  end
  
end
