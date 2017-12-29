-- Q1: For every situation where student A likes student B, but student B likes a different
-- student C, return the names and grades of A, B, and C.
select H1.name, H1.grade, H2.name, H2.grade, H3.name, H3.grade
from Highschooler H1 join Likes L1 on H1.ID = L1.ID1
     join Highschooler H2 on L1.ID2 = H2.ID
     join Likes L2 on H2.ID = L2.ID1
     join Highschooler H3 on L2.ID2 = H3.ID
where H1.ID <> H3.ID;

-- Q2: Find those students for whom all of their friends are in different grades from themselves.
-- Return the students' names and grades.
select H1.name, H1.grade
from Highschooler H1 join Friend on H1.ID = ID1
      join Highschooler H2 on ID2 = H2.ID
where H1.grade <> H2.grade
except
select H1.name, H1.grade
from Highschooler H1 join Friend on H1.ID = ID1
      join Highschooler H2 on ID2 = H2.ID
where H1.grade = H2.grade;

-- Q3: What is the average number of friends per student? (Your result should be just one number.)
select distinct
  ((select count(*) from Friend) * 1.0) /
  (select count(distinct ID1) from Friend)
from Friend;

-- Q4: Find the number of students who are either friends with Cassandra or are friends of friends
-- of Cassandra. Do not count Cassandra, even though technically she is a friend of a friend.
select count(*)
from (
  select ID2
  from Highschooler join Friend on ID = ID1
  where name = 'Cassandra'
  union
  select ID2
  from Friend
  where ID1 in
    (select ID2
    from Highschooler join Friend on ID = ID1
    where name = 'Cassandra')
  except
  select ID from Highschooler where name = 'Cassandra'
);

-- Q5: Find the name and grade of the student(s) with the greatest number of friends.
select name, grade
from Highschooler
where ID in
  (select ID1
  from Friend
  group by ID1
  having count(*) =
    (select max(count)
    from
      (select count(*) as count
       from Friend
       group by ID1)));