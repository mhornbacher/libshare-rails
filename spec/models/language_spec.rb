require 'rails_helper'

RSpec.describe Language, type: :model do
    before(:each) do
    @rails = Framework.create(name: "Rails", description: "Convention wins!")
    @ruby = Language.create(name: "Ruby", description: "love the self") # but have occasional breakups
  end
  
  it 'has a name and description' do
    expect(Language.new).to respond_to(:name)
    expect(Language.new).to respond_to(:description)
  end
end
