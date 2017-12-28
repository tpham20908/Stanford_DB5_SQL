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

-- -- Q3: For every pair of students who both like each other, return the name and grade of both
-- -- students. Include each pair only once, with the two names in alphabetical order.
-- select H1.name, H1.grade, H2.name, H2.grade
-- from Highschooler H1, Highschooler H2, Likes
-- where H1.ID = ID1 and ID2 = H2.ID
--   and H2.ID in (select ID1 from Likes)
--   and H1.ID in (select ID2 from Likes)
--   and H1.name < H2.name;

-- -- Q4: Find all students who do not appear in the Likes table (as a student who likes or is liked)
-- -- and return their names and grades. Sort by grade, then by name within each grade.
-- select name, grade
-- from Highschooler
-- where ID not in (select ID1 from Likes
--                   union
--                   select ID2 from Likes)
-- order by grade, name;

-- -- Q5: For every situation where student A likes student B, but we have no information about whom B
-- -- likes (that is, B does not appear as an ID1 in the Likes table), return A and B's names and grades.
-- select H1.name, H1.grade, H2.name, H2.grade
-- from Highschooler H1, Highschooler H2, Likes
-- where H1.ID = ID1 and ID2 = H2.ID
--   and H2.ID not in (select ID1 from Likes);

-- -- Q6: Find names and grades of students who only have friends in the same grade. Return the result
-- -- sorted by grade, then by name within each grade.
-- select distinct H1.name, H1.grade
-- from Friend join Highschooler H1 on H1.ID = ID1
--             join Highschooler H2 on H2.ID = ID2
-- where H1.grade = H2.grade

-- except

-- select distinct H1.name, H1.grade
-- from Friend join Highschooler H1 on H1.ID = ID1
--             join Highschooler H2 on H2.ID = ID2
-- where H1.grade <> H2.grade

-- order by H1.grade, H1.name;

-- Q7: For each student A who likes a student B where the two are not friends, find if they have a friend C
-- in common (who can introduce them!). For all such trios, return the name and grade of A, B, and C.
select (select name from Highschooler where ID = LikesNotFriend.ID1),
       (select grade from Highschooler where ID = LikesNotFriend.ID1),
       (select name from Highschooler where ID = LikesNotFriend.ID2),
       (select grade from Highschooler where ID = LikesNotFriend.ID2),
       (select name from Highschooler where ID = MutualFriend.ID2),
       (select grade from Highschooler where ID = MutualFriend.ID2)
from
  (select * from Likes except select * from Friend) LikesNotFriend
  join Friend MutualFriend on LikesNotFriend.ID1 = MutualFriend.ID1
where exists (select * from Friend
              where LikesNotFriend.ID2 = ID1 and MutualFriend.ID2 = ID2);