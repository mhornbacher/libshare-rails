require 'rails_helper'

RSpec.describe Review, type: :model do
  
  describe "Properties/Relationships" do

    before(:each) do 
      @user = User.create(email: Faker::Internet.free_email, password: "password")
    end

    it 'has a rating and comment' do
      expect(Review.new).to respond_to(:comment)
      expect(Review.new).to respond_to(:rating)
    end
    
    it 'belongs_to a user' do
      review = Review.create(rating: 5, user: @user)
      expect(review.user).to eq(@user)
    end

    it 'belongs_to a library' do
      review = Review.create(rating: 5, library: Library.create(name: "pry"))
      expect(review.library).to eq(Library.last)
    end
    
  end
  
end
