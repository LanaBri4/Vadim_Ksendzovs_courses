create table employees (
	id serial primary key, 
	employee_name varchar(50) not null 
	);

insert into employees (employee_name)
	values 	('Joyce Adams'),
		('Jessie White'),
		('Emma Norman'),
		('Kathleen Reed'),
		('Matthew Williams'),
		('Amy Wilkins'),
		('Marilyn Hernandez'),
		('Natalie Stevens'),
		('Jon Thomas'),
		('Martha Martin'),
		('Robert Miles'),
		('Randy Hanson'),
		('Dorothy Morris'),
		('Shirley Harris'),
		('James Morgan'),
		('Eva Moore'),
		('Vicki Rodgers'),
		('Erin Robertson'),
		('Rene Garcia'),
		('Jennifer Allen'),
		('Olga Brown'),
		('Larry Rogers'),
		('Jacob Williams'),
		('Mario Harris'),
		('John Keller'),
		('Daniel Nguyen'),
		('Kelly Hansen'),
		('Gary Cruz'),
		('Michael Scott'),
		('Samuel Lopez'),
		('Victoria Jones'),
		('Vivian Brady'),
		('Helen Martinez'),
		('Toni Walker'),
		('Edward Robertson'),
		('George Coleman'),
		('Anthony Horton'),
		('Bruce Walsh'),
		('Darlene Chavez'),
		('Kristina Jones'),
		('Joseph Ford'),
		('Lisa Graves'),
		('Timothy Wells'),
		('Jeremy Garza'),
		('Jesse McCarthy'),
		('Cheryl Bridges'),
		('John Freeman'),
		('Harry Gonzales'),
		('Jacqueline Rowe'),
		('Jean Wright'),
		('Cynthia Lopez'),
		('Paul Robbins'),
		('Matthew Griffith'),
		('Kenneth Johnston'),
		('Michele Bell'),
		('Nancy Roberts'),
		('Marlene Scott'),
		('Luis Fernandez'),
		('Paul Ward'),
		('Donald Jones'),
		('Anna Jones'),
		('Marian Lopez'),
		('William Price'),
		('Nancy Page'),
		('Marilyn Davis'),
		('April Wilson'),
		('Edward Wheeler'),
		('Stacey Evans'),
		('Larry Lopez'),
		('Cheryl Ward');
		
create table salary (
	id serial primary key, 
	monthly_salary int not null 
	);

insert into salary (monthly_salary)
	values 	(1000),
		(1100),
		(1200),
		(1300),
		(1400),
		(1500),
		(1600),
		(1700),
		(1800),
		(1900),
		(2000),
		(2100),
		(2200),
		(2300),
		(2400),
		(2500);
		
create table employee_salary (
	id serial primary key,
	employee_id int unique not null,
	salary_id int not null
	);

insert into employee_salary (employee_id, salary_id )
	values	(20, 5),
		(8, 8),
		(30, 6),
		(11, 7),
		(19, 10),
		(10, 9),
		(23, 15),
		(18, 11),
		(26, 14),
		(6, 4),
		(14, 13),
		(7, 3),
		(12, 1),
		(28, 12),
		(13, 2),
		(16, 16),
		(3, 6),
		(15, 13),
		(2, 9),
		(1, 5),
		(29, 14),
		(24, 11),
		(25, 12),
		(21, 10),
		(27, 7),
		(9, 3),
		(17, 1),
		(22, 8),
		(4, 4),
		(5, 2),
		(79, 15),
		(82, 16),
		(81, 14),
		(74, 2),
		(80, 10),
		(77, 3),
		(75, 16),
		(73, 1),
		(83, 12),
		(76, 7);
		
create table roles (
	id serial primary key,
	role_name int unique not null 
	);		

alter table roles alter column role_name type varchar(30);

insert into roles (role_name)
	values 	('Junior Python developer'),
		('Middle Python developer'),
		('Senior Python developer'),
		('Junior Java developer'),
		('Middle Java developer'),
		('Senior Java developer'),
		('Junior JavaScript developer'),
		('Middle JavaScript developer'),
		('Senior JavaScript developer'),
		('Junior Manual QA engineer'),
		('Middle Manual QA engineer'),
		('Senior Manual QA engineer'),
		('Project Manager'),
		('Designer'),
		('HR'),
		('CEO'),
		('Sales manager'),
		('Junior Automation QA engineer'),
		('Middle Automation QA engineer'),
		('Senior Automation QA engineer');
		
create table roles_employee (
	id serial primary key,
	employee_id int unique not null,
	role_id int not null,
	foreign key (employee_id)
		references employees(id),
	foreign key (role_id)
		references roles(id)
	);

insert into roles_employee (employee_id, role_id)
	values  (53, 5),
		(31, 5),
		(15, 14),
		(1, 5),
		(40, 7),
		(11, 3),
		(67, 4),
		(64, 3),
		(44, 7),
		(43, 5),
		(14, 16),
		(48, 8),
		(6, 12),
		(2, 9),
		(28, 9),
		(38, 8),
		(59, 12),
		(10, 13),
		(51, 11),
		(3, 9),
		(32, 8),
		(50, 10),
		(5, 13),
		(60, 16),
		(68, 3),
		(27, 2),
		(30, 2),
		(54, 13),
		(16, 9),
		(58, 12),
		(42, 11),
		(21,9),
		(4, 2),
		(25, 12),
		(22, 11),
		(37, 6),
		(61, 12),
		(41, 15),
		(39, 4),
		(65, 3);
