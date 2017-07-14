require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do
    @user = User.create(email: Faker::Internet.free_email, password: "password")
  end

  describe "Properties/Relationships" do
    
    it 'has an email address and password' do
      expect(User.new).to respond_to(:email)
      expect(User.new).to respond_to(:password)
    end
    
    it 'has provider and uid' do
      expect(User.new).to respond_to(:provider)
      expect(User.new).to respond_to(:uid)
    end

    it 'has many reviews' do
      rev1 = Review.create(rating: 1, user: @user)
      rev2 = @user.reviews.create(rating: 5)
      expect(@user.reviews).to include(rev1, rev2)
    end

    it 'has a role that defaults to user' do
      expect(User.new.role).to eq("user")
      expect(User.new.user?).to eq(true)
    end

    it 'role => 10 is admin' do
      expect(User.new(role: 10).role).to eq("admin")
      expect(User.new(role: 10).admin?).to eq(true)
    end

  end

  describe "Functions" do
    
    it '#display_name -> Return username or email (as a backup)' do
      expect(@user.display_name).to eq(@user.email)

      @user.username = "test"
      expect(@user.display_name).to_not eq(@user.email)
      expect(@user.display_name).to eq("test")
    end

    # TODO test oauth genearation
    
  end

  describe "Validations" do

    it 'emails are unique' do
      expect(User.new(email: @user.email, password: "password")).to_not be_valid
    end

    it 'usernames are unique' do
      User.create(email: Faker::Internet.free_email, password: "password", username: "test")
      expect(User.new(email: Faker::Internet.free_email, password: "password", username: "test")).to_not be_valid
    end

    it 'email addresses are valid' do

      user = User.new(email: "sam.net")
      user.valid?
      expect(user.errors.messages).to include(:email)
      
      user.email = "sam@sam.globe"
      user.valid?
      expect(user.errors.messages).to_not include(:email)
    end
  end
end
