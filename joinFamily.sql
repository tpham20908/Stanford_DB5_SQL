-- select Student.sID, sName, GPA, Apply.cName, enrollment
-- from Student join Apply join College
-- on  Apply.sID = Student.sID and Apply.cName = College.cName;

select *
from Student;

select *
from Student S1
where   (select count(*) from Student S2
        where S2.sID <> S1.sID and S2.GPA = S1.GPA) =
        (select count(*) from Student S2
        where S2.sID <> S1.sID and S2.sizeHS = S1.sizeHS);