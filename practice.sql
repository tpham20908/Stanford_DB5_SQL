-- select distinct Student.sID, sName, GPA, Apply.cName, enrollment
-- from Student, College, Apply
-- where Apply.sID = Student.sID
--   and Apply.cName = Apply.cName
--   order by GPA desc, enrollment;

-- select *
-- from Apply
-- where major like '%bio%';

select sID, sName, sizeHS, GPA*(sizeHS/1000.0) as scaledGPA
from Student;