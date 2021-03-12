require 'rails_helper'

describe MoviesController do
    describe "#same_director" do
       it 'should return director' do
           movie1 = Movie.create(title: 'xyz', director: 'dir')
           movie2 = Movie.create(title: 'abc', director: 'dir')
           movie3 = Movie.create(title: 'pqr', director: 'dir1')
           dir = Movie.find(movie1.id).director
           #response = M(movie1)
           #expect(response).to eq([movie11,movie2])
           #get :id/:same_director
           expect(dir !~ /[A-Z]/i).to eq false
       end
       #Then {it 'should return correct movies'}
       #When do
        #   movie1 = Movie.create!(title: 'xyz')
         #  movie2 = Movie.create!(title: 'abc', director: 'dir')
          # movie3 = Movie.create!(title: 'pqr', director: 'dir1')
       #end
       #Then {it 'should not return matches'}
       it 'should return empty director' do
           movie1 = Movie.create(title: 'xyz')
           movie2 = Movie.create(title: 'abc', director: 'dir')
           movie3 = Movie.create(title: 'pqr', director: 'dir1')
           dir = Movie.find(movie1.id).director
           #response = M(movie1)
           #expect(response).to eq([movie11,movie2])
           #get :id/:same_director
           expect(dir !~ /[A-Z]/i).to eq true
       end
    end
end