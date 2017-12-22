select Student.sID, sName, GPA, Apply.cName, enrollment
from Student join Apply join College
on  Apply.sID = Student.sID and Apply.cName = College.cName;