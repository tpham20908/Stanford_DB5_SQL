-- Q1: Find the names of all reviewers who rated Gone with the Wind.
select distinct name
from Reviewer, Movie, Rating
where Reviewer.rID = Rating.rID and Rating.mID = Movie.mID
      and title = 'Gone with the Wind';