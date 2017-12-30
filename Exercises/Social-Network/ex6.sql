-- -- Q1: It's time for the seniors to graduate. Remove all 12th graders from Highschooler.
-- delete from Highschooler
-- where grade >= 12;

-- Q2: If two students A and B are friends, and A likes B but not vice-versa, remove the Likes tuple.
-- select * from Likes;
delete from Likes
where ID2 not in
  (select ID1 from Likes L where Likes.ID1 = L.ID2)
  and ID2 in
  (select ID2 from Friend where ID1 = Likes.ID1);
