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

  describe "Validations" do
    it 'defaults the rating to 1' do
      expect(Review.new().rating).to eq(1)
    end
    
    it 'limits the rating to between 1 and 5' do
      expect(Review.new(rating: 0)).to_not be_valid
      expect(Review.new(rating: 6)).to_not be_valid
    end
  end
  
end
