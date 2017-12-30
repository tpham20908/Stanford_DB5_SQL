-- -- Q1: It's time for the seniors to graduate. Remove all 12th graders from Highschooler.
-- delete from Highschooler
-- where grade >= 12;

-- -- Q2: If two students A and B are friends, and A likes B but not vice-versa, remove the Likes tuple.
-- -- select * from Likes;
-- delete from Likes
-- where ID2 not in
--   (select ID1 from Likes L where Likes.ID1 = L.ID2)
--   and ID2 in
--   (select ID2 from Friend where ID1 = Likes.ID1);

-- Q3: For all cases where A is friends with B, and B is friends with C, add a new friendship
-- for the pair A and C. Do not add duplicate friendships, friendships that already exist, or friendships
-- with oneself. (This one is a bit challenging; congratulations if you get it right.)


select distinct A.ID1 as ID1, C.ID2 as ID2
from Friend A, Friend B, Friend C, Friend
where A.ID2 = B.ID1 and B.ID2 = C.ID1 and A.ID1 <> C.ID2;
