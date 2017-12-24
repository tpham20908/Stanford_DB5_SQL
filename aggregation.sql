-- select CS.avgGPA - nonCS.avgGPA
-- from (select avg(GPA) as avgGPA
--       from Student
--       where sID in (select sID from Apply
--                     where major = 'CS')) as CS,
--       (select avg(GPA) as avgGPA
--       from Student
--       where sID not in (select sID from Apply
--                     where major = 'CS')) as nonCS;

-- select distinct (select avg(GPA) as avgGPA
--       from Student
--       where sID in (select sID from Apply
--         where major = 'CS')) -
--       (select avg(GPA) as avgGPA
--       from Student
--       where sID not in (select sID from Apply
--         where major = 'CS')) as d
-- from Student;

-- select cName, count(*)
-- from Apply
-- group by cName;

-- select state, sum(enrollment) as totalEnr
-- from College
-- group by state;

-- select cName, major, min(GPA), max(GPA)
-- from Student, Apply
-- where Student.sID = Apply.sID
-- group by cName, major;

select Student.sID, cName
from Student, Apply
where Student.sID = Apply.sID
order by Student.sID;

select Student.sID, count(distinct cName)
from Student, Apply
where Student.sID = Apply.sID
group by Student.sID;