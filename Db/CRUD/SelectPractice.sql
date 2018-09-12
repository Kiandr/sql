/* Simple Select method*/
select * from DbExe.dbo.Person;

/* Show the numberof rows in the table stasff*/
select count(*) from DbExe.dbo.staff;

/*show number of staff members by denger*/
select count(*) from DbExe.dbo.staff group by DbExe.dbo.staff.gender;

/*Show the number of staff member by gender and include the name of the gender*/
select gender, count (*) from staff group by gender;