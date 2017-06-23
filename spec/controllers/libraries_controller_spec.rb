require 'rails_helper'

RSpec.describe LibrariesController, type: :controller do
    render_views

    before(:each) do
        @lib = Library.first
    end

    describe '#index' do

        before(:each) do
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

    describe '#show' do
        before(:each) do
            get :show, id: @lib.id
        end

        it 'shows name, version and description' do
            expect(response.body).to include(@lib.name)
            expect(response.body).to include(@lib.description)
            expect(response.body).to include(@lib.version)
        end

        it 'shows the average_rating, vote_count, and comment_count' do
            expect(response.body).to include(@lib.average_rating.to_i.to_s)
            expect(response.body).to include(@lib.vote_count.to_s)
            expect(response.body).to include(@lib.comment_count.to_s)
        end

        it 'shows link to framework' do
            expect(response.body).to have_link(@lib.framework.name, href: framework_path(@lib.framework))
        end

        it 'shows link to language' do
            expect(response.body).to have_link(@lib.language.name, href: language_path(@lib.language))
        end

        it 'shows link to documentation an project page if present' do
            expect(response.body).to have_link("Documentation", href: @lib.documentation_url)
            expect(response.body).to have_link("Project page", href: @lib.library_url)
        end

        it 'shows the display name of the user that created it' do
            expect(response.body).to include(@lib.created_by.display_name)
        end

        it 'displays its comments' do
            @lib.reviews.create(rating: 3, comment: "test comment", user: User.first)
            # reload the page
            get :show, id: @lib.id
            expect(response.body).to include("test comment")
        end

        context 'logged_in' do
            before(:each) do
                @user = User.first
                sign_in @user
                get :show, id: @lib.id
            end
            
            it 'has a nested form for creating reviews' do
                expect(response.body).to have_field('review_rating')
                expect(response.body).to have_field('review_comment')
            end

            it 'has edit button' do
                expect(response.body).to have_link("Edit", href: edit_library_path(@lib))
            end
            
        end

        # TODO admin context can delete

        context 'logged_out' do
            it 'does not have the nested form or edit button' do
                expect(response.body).to_not have_field('review_rating')
                expect(response.body).to_not have_field('review_comment')
                expect(response.body).to_not have_link("Edit", href: edit_library_path(@lib))
            end
        end
        
    end
    
    describe '#new' do
        before(:each) do
            get :new
        end
    end
    
    describe '#edit' do
        before(:each) do
            get :edit
        end
    end
    
    describe '#create' do
    end
    
    describe '#update' do
    end
    
    describe '#destroy' do
    end
        
end
