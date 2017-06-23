require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
    render_views

    describe '#homepage' do

        before(:each) do
            get :homepage
        end
        
        it 'lists popular frameworks' do
            top_frameworks = Framework.most_popular.limit(3)
            expect(response.status).to eq(200)
            expect(assigns(:top_frameworks)).to eq(top_frameworks)
            expect(response.body).to include("Popular Frameworks")
        end
        
        it 'lists popular languages' do
            top_languages = Language.most_popular.limit(3)
            expect(response.status).to eq(200)
            expect(assigns(:top_languages)).to eq(top_languages)
            expect(response.body).to include("Popular Languages")
        end
        
        it 'lists popular libraries' do
            top_libraries = Library.most_popular.limit(3)
            expect(response.status).to eq(200)
            expect(assigns(:top_libraries)).to eq(top_libraries)
            expect(response.body).to include("Popular Libraries")
        end

        context 'logged_in' do
            before(:each) do
                @user = User.first
                login(@user)
            end
            
        end
        
        context 'logged_out' do

        end
        
    end
end