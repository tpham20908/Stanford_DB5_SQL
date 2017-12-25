-- --Q1: Find the titles of all movies directed by Steven Spielberg.
-- select title
-- from Movie
-- where director = 'Steven Spielberg';

-- -- Q2: Find all years that have a movie that received a rating of 4 or 5, and sort them in increasing order.
-- select year
-- from Movie
-- where mID in (select mID from rating
--               where stars >= 4)
--           order by year;

-- -- Q3: Find the titles of all movies that have no ratings.
-- select title from Movie
-- where mID not in (select mID from Rating);

-- Q4: Some reviewers didn't provide a date with their rating.
-- Find the names of all reviewers who have ratings with a
-- NULL value for the date.
-- select name from reviewer
-- where rID in (select rID from Rating
--               where ratingDate is null);

-- -- Q5: Write a query to return the ratings data in a
-- -- more readable format: reviewer name, movie title, stars,
-- -- and ratingDate. Also, sort the data, first by reviewer
-- -- name, then by movie title, and lastly by number of stars.
-- select name, title, stars, ratingDate
-- from Movie m, Reviewer rv, Rating rt
-- where m.mID = rt.mID and rv.rID = rt.rID
-- order by rv.name, m.title, rt.stars;

-- -- Q6: For all cases where the same reviewer rated the
-- -- same movie twice and gave it a higher rating the second
-- -- time, return the reviewer's name and the title of the movie.
-- select name, title
-- from Movie, Reviewer,
--   (select rID, mID
--   from Rating R1
--   where mID in
--     (select mID from Rating R2
--     where R1.mID = R2.mID
--     and R1.rID = R2.rID
--     and R1.stars < R2.stars
--     and R1.ratingDate < R2.ratingDate)) as R
-- where R.rID = Reviewer.rID and R.mID = Movie.mID;

-- Q7: For each movie that has at least one rating,
-- find the highest number of stars that movie received.
-- Return the movie title and number of stars. Sort by
-- movie title.
select distinct title, stars
from Movie, Rating R1
where not exists
    (select * from Rating R2
    where R1.mID = R2.mID
    and R2.stars > R1.stars)
  and Movie.mID = R1.mID
  order by title;