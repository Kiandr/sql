create table Person(
Id integer, 
FirstName varchar(30),
LastName varchar(10)
);

create table company_divisions (
    department varchar(100),
    company_division varchar(100),
    primary key (department)
  );

  create table company_regions (
   region_id int,
   company_regions varchar(20),
   country varchar(20),
   primary key (region_id)
  );

  create table staff
  (
      id integer,
      last_name varchar(100),
      email varchar(200),
      gender varchar(10),
      department varchar(100),
      start_date date,
      salary integer,
      job_title varchar(100),
      region_id int,
      primary key (id)
  );

