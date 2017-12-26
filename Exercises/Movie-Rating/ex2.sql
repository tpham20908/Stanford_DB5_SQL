-- -- Q1: Find the names of all reviewers who rated Gone with the Wind.
-- select distinct name
-- from Reviewer, Movie, Rating
-- where Reviewer.rID = Rating.rID and Rating.mID = Movie.mID
--       and title = 'Gone with the Wind';

-- -- Q2: For any rating where the reviewer is the same as the director of
-- -- the movie, return the reviewer name, movie title, and number of stars.
-- select distinct name, title, stars
-- from Movie, Reviewer, Rating
-- where name = director and Movie.mID = Rating.mID
--       and Reviewer.rID = Rating.rID;

-- -- Q3: Return all reviewer names and movie names together in a single list,
-- -- alphabetized. (Sorting by the first name of the reviewer and first word in
-- -- the title is fine; no need for special processing on last names or removing "The".)
-- select name
-- from Reviewer
-- union
-- select title
-- from Movie;

-- Q4: Find the titles of all movies not reviewed by Chris Jackson.
select title from Movie
where mID not in (select mID from Reviewer, Rating
                  where Reviewer.rID = Rating.rID
                        and name = 'Chris Jackson');