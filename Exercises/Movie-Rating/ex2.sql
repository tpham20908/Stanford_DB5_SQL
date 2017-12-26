-- -- Q1: Find the names of all reviewers who rated Gone with the Wind.
-- select distinct name
-- from Reviewer, Movie, Rating
-- where Reviewer.rID = Rating.rID and Rating.mID = Movie.mID
--       and title = 'Gone with the Wind';

-- Q2: For any rating where the reviewer is the same as the director of
-- the movie, return the reviewer name, movie title, and number of stars.
select distinct name, title, stars
from Movie, Reviewer, Rating
where name = director and Movie.mID = Rating.mID
      and Reviewer.rID = Rating.rID;