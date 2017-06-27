require 'rails_helper'

RSpec.describe LanguagesController, type: :controller do
    render_views

    describe '#index' do
        before(:each) do
            get :index
        end
        
        it 'shows a list of languages' do
            language = Language.first
            expect(response.body).to include(language.name)
        end
        
        it 'shows each language average_rating' do
            expect(response.body).to include("2.67")
        end
        
        it 'has a a link to make a new language' do
            expect(response.body).to have_link("Create new language", href: new_language_path)
        end
    end
    
    describe '#show' do
        before(:each) do
            @language = Language.first
            get :show, id: @language.id
        end

        it 'assigns the language to an @language variable' do
            expect(assigns(:language)).to eq(@language)
        end

        it 'shows the language title, average_rating, and description' do
            expect(response.body).to include(@language.name)
            expect(response.body).to include(@language.description)
            expect(response.body).to include(@language.average_rating.to_s)
        end
        
        it 'lists the frameworks use it' do
            expect(response.body).to include("Frameworks built on")
            expect(response.body).to include(@language.frameworks.pluck(:name)[0])
        end
        
        it 'links to libraries' do
            lib = @language.libraries.first
            expect(response.body).to have_link(lib.name, href: library_path(lib))
        end

    end
    
    describe '#new' do
        before(:each) do
            sign_in User.first
            get :new
        end

        it 'has name and description fields' do
            expect(response.body).to have_field("language_name")
            expect(response.body).to have_field("language_description")
        end
        
    end
    
    describe '#edit' do
        before(:each) do
            @language = Language.first
            sign_in User.first
            get :edit, id: @language.id
        end

        it 'has prepoulated name and description fields' do
            expect(response.body).to include(@language.name)
            expect(response.body).to include(@language.description)
        end
        
    end
end
