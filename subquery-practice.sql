-- select sName
-- from Student
-- where sID in (select sID
--               from Apply
--               where major = 'CS')
--   and sID not in (select sID
--                   from Apply
--                   where major = 'EE');

-- -- get the collge in the same state
-- select cName, state
-- from College C1
-- where exists (select *
--               from College C2
--               where C1.state = C2.state
--                 and C1.cName <> C2.cName);

-- -- get the college with highest enrollment
-- select cName, enrollment
-- from College C1
-- where not exists (select *
--                   from College C2
--                   where C2.enrollment > C1.enrollment);

-- -- get the student with highest GPA
-- select sName, GPA
-- from Student S1
-- where not exists (select *
--                   from Student S2
--                   where S2.GPA > S1.GPA);

-- -- get the student with highest GPA
-- select sName, GPA
-- from Student
-- where GPA >= all (select GPA from Student);

-- -- find students who is not from smallest HS
-- -- with 'any' construct supported
-- select sID, sName, sizeHS
-- from Student
-- where sizeHS > any (select sizeHS from Student);
-- -- without 'any' operator supported
-- select sID, sName, sizeHS
-- from Student S1
-- where exists (select *
--               from Student S2
--               where S2.sizeHS < S1.sizeHS);

-- subquery in select and from clauses
-- this ex
select sID, sName, GPA, GPA*(sizeHS/1000.0) as scalesGPA
from Student
where abs(GPA*(sizeHS/1000.0) - GPA) > 1.0;

-- equals to
select *
from (select sID, sName, GPA, GPA*(sizeHS/1000.0) as scalesGPA
from Student) G
where abs(scalesGPA - GPA) > 1.0;