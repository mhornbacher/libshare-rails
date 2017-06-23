require 'rails_helper'

RSpec.describe LibrariesController, type: :controller do
    render_views

    describe '#index' do

        before(:each) do
            @lib = Library.first
            get :index
        end
        
        it 'shows links to libraries' do
            expect(response.body).to have_link(@lib.name, href: library_path(@lib))
        end

        it 'shows each librarys average rating' do
            expect(response.body).to include(@lib.average_rating.to_i.to_s)
        end
        
        it 'has a link to create a new framework' do
            expect(response.body).to have_link("Create new library", href: new_library_path)
        end
        
    end
        
end
