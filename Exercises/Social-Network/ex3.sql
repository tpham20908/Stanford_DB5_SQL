-- -- Q1: Find the names of all students who are friends with someone named Gabriel.
-- select H1.name
-- from Highschooler H1, Friend, Highschooler H2
-- where H1.ID = ID1 and ID2 = H2.ID and H2.name = 'Gabriel';

-- -- Q2: For every student who likes someone 2 or more grades younger than themselves,
-- -- return that student's name and grade, and the name and grade of the student they like.
-- select H1.name, H1.grade, H2.name, H2.grade
-- from Likes, Highschooler H1, Highschooler H2
-- where H1.ID = ID1 and H2.ID = ID2
--   and (H1.grade - H2.grade) >= 2;

-- Q3: For every pair of students who both like each other, return the name and grade of both
-- students. Include each pair only once, with the two names in alphabetical order.
select H1.name, H1.grade, H2.name, H2.grade
from Highschooler H1, Highschooler H2, Likes
where H1.ID = ID1 and ID2 = H2.ID
  and H2.ID in (select ID1 from Likes)
  and H1.ID in (select ID2 from Likes)
  and H1.name < H2.name;