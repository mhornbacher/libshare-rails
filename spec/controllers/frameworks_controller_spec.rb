require 'rails_helper'

RSpec.describe FrameworksController, type: :controller do
    render_views

    describe '#index' do
        before(:each) do
            get :index
        end
        
        it 'shows a list of frameworks' do
            framework = Framework.first
            expect(response.body).to include(framework.name)
        end
        
        it 'shows each frameworks average_rating' do
            expect(response.body).to include(" | 2.5")
        end
        
        it 'has a a link to make a new framework' do
            expect(response.body).to have_link("Create new framework", href: new_framework_path)
        end
    end
    
    describe '#show' do
        before(:each) do
            @framework = Framework.first
            get :show, id: @framework.id
        end

        it 'assigns the framework to an @framework variable' do
            expect(assigns(:framework)).to eq(@framework)
        end

        it 'shows the framework title, average_rating, and description' do
            expect(response.body).to include(@framework.name)
            expect(response.body).to include(@framework.description)
            expect(response.body).to include(@framework.average_rating.to_s)
        end
        
        it 'lists the languages that it was buit with' do
            expect(response.body).to include("Built with")
            expect(response.body).to include(@framework.languages.pluck(:name)[0])
        end
        
        it 'links to libraries' do
            lib = @framework.libraries.first
            expect(response.body).to have_link(lib.name, href: library_path(lib))
        end
    end
    

    # # not working but works when tested by hand. Rspec not loading the page correctly
    describe '#show -> logged in as user' do
    
        it 'has edit button' do
            @framework = Framework.first
            @user = User.first

            expect(@user.role).to eq("user")

            sign_in @user
            get :show, id: @framework.id
            expect(response.body).to have_link("Edit", edit_framework_path(@framework))
        end

    end
    
    describe 'logged in as admin' do

        it '#show -> has edit and delete button' do
            @framework = Framework.first
            @user = User.last

            expect(@user.role).to eq("admin")

            sign_in @user
            get :show, id: @framework.id
            expect(response.body).to have_link("Edit", edit_framework_path(@framework))
            expect(response.body).to have_link("Delete", framework_path(@framework))
        end

    end

    
    describe '#new' do
        before(:each) do
            sign_in User.first
            get :new
        end

        it 'has name and description fields' do
            expect(response.body).to have_field("framework_name")
            expect(response.body).to have_field("framework_description")
        end
        
    end
    
    describe '#edit' do
        before(:each) do
            @framework = Framework.first
            sign_in User.first
            get :edit, id: @framework.id
        end

        it 'has prepoulated name and description fields' do
            expect(response.body).to include(@framework.name)
            expect(response.body).to include(@framework.description)
        end
        
    end
    
end
