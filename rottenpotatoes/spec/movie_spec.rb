require 'rails_helper'

describe Movie do
    describe ".with_same_dir" do
       it 'should return correct movie' do
           movie1 = Movie.create(title: 'xyz', director: 'dir')
           movie2 = Movie.create(title: 'abc', director: 'dir')
           movie3 = Movie.create(title: 'pqr', director: 'dir1')
           movies_with_same = Movie.with_same_dir(movie1.director)
           expect(movies_with_same).to eq([movie1, movie2])
       end
       
       it 'should not return incorrect movie' do
           movie1 = Movie.create(title: 'xyz', director: 'dir')
           movie2 = Movie.create(title: 'abc', director: 'dir')
           movie3 = Movie.create(title: 'pqr', director: 'dir1')
           movies_with_same = Movie.with_same_dir(movie1.director)
           expect(movies_with_same == [movie1,movie3]).to eq false
       end
       
       it 'should not return itself movie' do
           movie1 = Movie.create(title: 'xyz')
           movie2 = Movie.create(title: 'abc', director: 'dir2')
           movie3 = Movie.create(title: 'pqr', director: 'dir1')
           movies_with_same = Movie.with_same_dir(movie1.director)
           expect(movies_with_same).to eq([movie1])
       end
    end
    
    describe ".all_ratings" do
       it 'should give all possible ratings' do
           movie1 = Movie.create(title: 'xyz', rating: 'G')
           movie2 = Movie.create(title: 'abc', director: 'dir2', rating: 'PG')
           movie3 = Movie.create(title: 'pqr', director: 'dir1', rating: 'R')
          result=Movie.all_ratings
          expect(result.sort).to eq(['G','PG','R'])
       end
    end
    
    describe ".with_ratings" do
       it 'should return all' do
           movie1 = Movie.create(title: 'xyz', rating: 'G')
           movie2 = Movie.create(title: 'abc', director: 'dir2', rating: 'PG')
           movie3 = Movie.create(title: 'pqr', director: 'dir1', rating: 'R')
           result = Movie.with_ratings([])
           expect(result).to eq([movie1,movie2,movie3])
       end
       
       it 'should return movie with G rating' do
           movie1 = Movie.create(title: 'xyz', rating: 'G')
           movie2 = Movie.create(title: 'abc', director: 'dir2', rating: 'PG')
           movie3 = Movie.create(title: 'pqr', director: 'dir1', rating: 'R')
           result = Movie.with_ratings(['G'])
           expect(result).to eq([movie1])
       end
    end
end