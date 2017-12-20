-- select *
-- from Student;

-- select sID, sName, gpa
-- from Student
-- where gpa > 3.6;

-- select distinct sname, major, decision
-- from Student, Apply
-- where Student.sID = Apply.sID
--   and sizeHS < 1000 and major = 'CS' and cname = 'Stanford';

select College.cName
from College, Apply
where College.cName = Apply.cName
  and enrollment > 2000 and major = 'CS';