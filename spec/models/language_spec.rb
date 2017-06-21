require 'rails_helper'

RSpec.describe Language, type: :model do
  describe "Properties/Relationships" do
    before(:each) do
      @rails = Framework.create(name: "Rails", description: "Convention wins!")
      @ruby = Language.create(name: "Ruby", description: "love the self") # but have occasional breakups
    end
    
    it 'has a name and description' do
      expect(Language.new).to respond_to(:name)
      expect(Language.new).to respond_to(:description)
    end

    it 'has_many libraries' do
      lib = Library.create(name: "Omniauth", language: @ruby)
      expect(@ruby.libraries).to include(lib)
      expect(@ruby.libraries.count).to eq(1)
    end
    
    it 'has_many frameworks through libraries' do
      lib = Library.create(name: "Omniauth", language: @ruby, framework: @rails)
      expect(@ruby.frameworks).to include(@rails)
    end
    
  end
end
