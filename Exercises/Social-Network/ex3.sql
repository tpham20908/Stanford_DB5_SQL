-- Q1: Find the names of all students who are friends with someone named Gabriel.
select H1.name
from Highschooler H1, Friend, Highschooler H2
where H1.ID = ID1 and ID2 = H2.ID and H2.name = 'Gabriel';