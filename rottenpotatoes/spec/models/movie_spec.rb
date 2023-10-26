require 'rails_helper'

RSpec.describe Movie, type: :model do
  # Let's say you have the following setup:
  let!(:movie1) { Movie.create(title: "Movie1", director: "Director A") }
  let!(:movie2) { Movie.create(title: "Movie2", director: "Director A") }
  let!(:movie3) { Movie.create(title: "Movie3", director: "Director B") }

  describe '#others_by_same_director' do
    it 'returns movies by the same director' do
      expect(movie1.others_by_same_director).to include(movie2)
      expect(movie1.others_by_same_director).not_to include(movie1, movie3)
    end
  end

  describe '.with_director' do
    it 'returns all movies by the given director' do
      expect(Movie.with_director("Director A")).to include(movie1, movie2)
      expect(Movie.with_director("Director A")).not_to include(movie3)
    end
  end
end
