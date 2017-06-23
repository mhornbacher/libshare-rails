require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
    render_views

    describe '#homepage' do

        before(:each) do
            get :homepage
        end

        it 'has a 200 status code' do
            expect(response.status).to eq(200)
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
                sign_in @user
                get :homepage
            end

            it 'shows the display name for the user' do
                expect(response.body).to include(@user.display_name)
            end

            it 'shows a log out link' do
                expect(response.body).to include("/sign_out")
            end

            it 'does not show the sign up button or link' do
                expect(response.body).to_not include("/sign_up")
            end
            
        end
        
        context 'logged_out' do
            it 'shows a sign in link' do
                expect(response.body).to include("/sign_in")
                expect(response.body).to include("Sign in")
            end

            it 'shows a sign up link' do
                expect(response.body).to include("/sign_up")
                expect(response.body).to include("Sign up")
            end
        end
        
    end
end