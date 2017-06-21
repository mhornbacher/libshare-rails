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

  end
end
