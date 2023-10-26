require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  let!(:movie_with_director) { Movie.create(title: "Movie1", director: "Director A") }
  let!(:movie_without_director) { Movie.create(title: "Movie2", director: nil) }
  let!(:movie_attributes) { { title: "Movie3", rating: "PG", description: "A great movie", release_date: "2023-01-01", director: "Director B" } }

  describe 'GET #show' do
    it 'assigns the requested movie to @movie' do
      get :show, id: movie_with_director.id
      expect(assigns(:movie)).to eq(movie_with_director)
    end
  end

  describe 'GET #index' do
    it 'assigns all movies to @movies' do
      get :index
      expect(assigns(:movies)).to match_array([movie_with_director, movie_without_director])
    end
  end

  describe 'GET #new' do
    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    it 'creates a new movie' do
      expect {
        post :create, movie: movie_attributes
      }.to change(Movie, :count).by(1)
    end

    it 'redirects to the movies index' do
      post :create, movie: movie_attributes
      expect(response).to redirect_to(movies_path)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested movie to @movie' do
      get :edit, id: movie_with_director.id
      expect(assigns(:movie)).to eq(movie_with_director)
    end
  end

  describe 'PUT #update' do
    it 'updates the movie' do
      put :update, id: movie_with_director.id, movie: { title: "Updated Title" }
      movie_with_director.reload
      expect(movie_with_director.title).to eq("Updated Title")
    end

    it 'redirects to the movie show page' do
      put :update, id: movie_with_director.id, movie: { title: "Updated Title" }
      expect(response).to redirect_to(movie_path(movie_with_director))
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the movie' do
      expect {
        delete :destroy, id: movie_with_director.id
      }.to change(Movie, :count).by(-1)
    end

    it 'redirects to movies index' do
      delete :destroy, id: movie_with_director.id
      expect(response).to redirect_to(movies_path)
    end
  end

  describe 'GET #search_directors' do
    context 'when movie has a director' do
      before { get :search_directors, id: movie_with_director.id }

      it 'assigns movies with the same director' do
        expect(assigns(:movies)).not_to include(movie_with_director)
      end
    end

    context 'when movie does not have a director' do
      before { get :search_directors, id: movie_without_director.id }

      it 'redirects to the movies index' do
        expect(response).to redirect_to(movies_path)
      end
    end
  end
end