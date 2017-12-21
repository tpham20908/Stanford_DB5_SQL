-- select S1.sID, S1.sName, S1.GPA, S2.sID, S2.sName, S2.GPA
-- from Student S1, Student S2
-- where S1.GPA = S2.GPA and S1.sID < S2.sID;

-- union operator (\union)
-- select sName as name from Student
-- union all
-- select cName as name from College
-- order by name;

-- intersect operator (\intersect)
-- select sID from Apply where major = 'CS'
-- intersect
-- select sID from Apply where major = 'EE';

-- except operator (\diff)
select sID from Apply where major = 'CS'
except
select sID from Apply where major = 'EE';

-- in case the OS does not support except operator
select distinct A1.sID
from Apply A1, Apply A2
where A1.sID = A2.sID
  and A1.major = 'CS' and A2.major <> 'EE';