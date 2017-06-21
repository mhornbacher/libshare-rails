require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do
    @user = User.first
  end
  
  it 'has an email address and password' do
    expect(User.new).to respond_to(:email)
    expect(User.new).to respond_to(:password)
  end
  
  it 'has provider and uid' do
    expect(User.new).to respond_to(:provider)
    expect(User.new).to respond_to(:uid)
  end

end
