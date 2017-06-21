require 'rails_helper'

RSpec.describe Framework, type: :model do

  before(:each) do
    @rails = Framework.create(name: "Rails", description: "Convention wins!")
    @ruby = Language.create(name: "Ruby", description: "love the self") # but have occasional breakups
  end
  
  it 'has a name and description' do
    expect(Framework.new).to respond_to(:name)
    expect(Framework.new).to respond_to(:description)
  end

  it 'has_many libraries' do
    lib = Library.create(name: "Omniauth", framework: @rails)
    expect(@rails.libraries).to include(lib)
  end
  
  it 'has_many languages through libraries' do
    lib = Library.create(name: "Omniauth", framework: @rails, language: @ruby)
    expect(@rails.languages).to include(@ruby)
  end
  
  # More tests here
  
end
