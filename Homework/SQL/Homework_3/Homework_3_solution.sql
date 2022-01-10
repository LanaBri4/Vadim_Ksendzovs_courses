--1. Вывести всех работников чьи зарплаты есть в базе вместе с зарплатами.
select employee_name, monthly_salary 
from (employees e
join employee_salary es on e.id = es.employee_id) as ees
join salary s on ees.salary_id = s.id;

--2. Вывести всех работников у которых ЗП меньше 2000.
select employee_name 
from ((employees e 
join employee_salary es on e.id = es.id) as ees
join salary s on ees.salary_id = s.id)
where monthly_salary < 2000;

--3. Вывести все зарплатные позиции, но работник по ним не назначен. 
--(ЗП есть, но не понятно кто её получает.)
select monthly_salary 
from ((salary s 
left join employee_salary es on s.id = es.salary_id) as se
left join employees e on se.employee_id = e.id)
where employee_name is null;

--4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. 
--(ЗП есть, но не понятно кто её получает.)
select monthly_salary 
from ((salary s 
left join employee_salary es on s.id = es.salary_id) as se
left join employees e on se.employee_id = e.id)
where employee_name is null and monthly_salary < 2000;

--5. Найти всех работников кому не начислена ЗП.
select employee_name
from ((employees e 
left join employee_salary es on e.id = es.employee_id ) as es
left join salary s on es.salary_id = s.id)
where monthly_salary is null;

--6. Вывести всех работников с названиями их должности.
select employee_name, role_name 
from ((employees e 
join roles_employee re on e.id = re.employee_id) as er
join roles r on er.role_id = r.id);

--7. Вывести имена и должность только Java разработчиков.
select employee_name, role_name 
from ((employees e 
join roles_employee re on e.id = re.employee_id) as er
join roles r on er.role_id = r.id)
where role_name like '%Java developer%';

--8. Вывести имена и должность только Python разработчиков.
select employee_name, role_name 
from ((employees e 
join roles_employee re on e.id = re.employee_id) as er
join roles r on er.role_id = r.id)
where role_name like '%Python developer%';

--9. Вывести имена и должность всех QA инженеров.
select employee_name, role_name 
from ((employees e 
join roles_employee re on e.id = re.employee_id) as er
join roles r on er.role_id = r.id)
where role_name like '%QA engineer%';

--10. Вывести имена и должность ручных QA инженеров.
select employee_name, role_name 
from ((employees e 
join roles_employee re on e.id = re.employee_id) as er
join roles r on er.role_id = r.id)
where role_name like '%Manual QA engineer%';

--11. Вывести имена и должность автоматизаторов QA.
select employee_name, role_name 
from ((employees e 
join roles_employee re on e.id = re.employee_id) as er
join roles r on er.role_id = r.id)
where role_name like '%Automation QA%';

--12. Вывести имена и зарплаты Junior специалистов.
select employee, monthly_salary as salary 
from salary s 
join (select employee, salary_id
      from employee_salary es 
      join (select e.id as e_id, e.employee_name as employee
	        from employees e 
            join (select role_name, employee_id 
	              from roles r 
	              join roles_employee re 
	              on r.id = re.role_id
	              where role_name like '%Junior%') as rre
            on e.id = rre.employee_id) as emp
      on es.employee_id = emp.e_id) as emp_slr
on s.id = emp_slr.salary_id;

--13. Вывести имена и зарплаты Middle специалистов.
select employee, monthly_salary as salary 
from salary s 
join (select employee, salary_id
      from employee_salary es 
      join (select e.id as e_id, e.employee_name as employee
	        from employees e 
            join (select role_name, employee_id 
	              from roles r 
	              join roles_employee re 
	              on r.id = re.role_id
	              where role_name like '%Middle%') as rre
            on e.id = rre.employee_id) as emp
      on es.employee_id = emp.e_id) as emp_slr
on s.id = emp_slr.salary_id;

--14. Вывести имена и зарплаты Senior специалистов.
select employee, monthly_salary as salary 
from salary s 
join (select employee, salary_id
      from employee_salary es 
      join (select e.id as e_id, e.employee_name as employee
	        from employees e 
            join (select role_name, employee_id 
	              from roles r 
	              join roles_employee re 
	              on r.id = re.role_id
	              where role_name like '%Senior%') as rre
            on e.id = rre.employee_id) as emp
      on es.employee_id = emp.e_id) as emp_slr
on s.id = emp_slr.salary_id;

--15. Вывести зарплаты Java разработчиков.
select distinct monthly_salary as salary 
from salary s 
join (select salary_id
      from employee_salary es 
      join (select e.id as e_id
	        from employees e 
            join (select role_name, employee_id 
	              from roles r 
	              join roles_employee re 
	              on r.id = re.role_id
	              where role_name like '%Java developer%') as rre
            on e.id = rre.employee_id) as emp
      on es.employee_id = emp.e_id) as emp_slr
on s.id = emp_slr.salary_id;

--16. Вывести зарплаты Python разработчиков.
select distinct monthly_salary as salary 
from salary s 
join (select salary_id
      from employee_salary es 
      join (select e.id as e_id
	        from employees e 
            join (select role_name, employee_id 
	              from roles r 
	              join roles_employee re 
	              on r.id = re.role_id
	              where role_name like '%Python developer%') as rre
            on e.id = rre.employee_id) as emp
      on es.employee_id = emp.e_id) as emp_slr
on s.id = emp_slr.salary_id;

--17. Вывести имена и зарплаты Junior Python разработчиков.
select employee, monthly_salary as salary 
from salary s 
join (select employee, salary_id
      from employee_salary es 
      join (select e.id as e_id, e.employee_name as employee
	        from employees e 
            join (select role_name, employee_id 
	              from roles r 
	              join roles_employee re 
	              on r.id = re.role_id
	              where role_name like '%Junior Python%') as rre
            on e.id = rre.employee_id) as emp
      on es.employee_id = emp.e_id) as emp_slr
on s.id = emp_slr.salary_id;

--18. Вывести имена и зарплаты Middle JS разработчиков.
select employee, monthly_salary as salary 
from salary s 
join (select employee, salary_id
      from employee_salary es 
      join (select e.id as e_id, e.employee_name as employee
	        from employees e 
            join (select role_name, employee_id 
	              from roles r 
	              join roles_employee re 
	              on r.id = re.role_id
	              where role_name like '%Middle JavaScript%') as rre
            on e.id = rre.employee_id) as emp
      on es.employee_id = emp.e_id) as emp_slr
on s.id = emp_slr.salary_id;

--19. Вывести имена и зарплаты Senior Java разработчиков.
select employee, monthly_salary as salary 
from salary s 
join (select employee, salary_id
      from employee_salary es 
      join (select e.id as e_id, e.employee_name as employee
	        from employees e 
            join (select role_name, employee_id 
	              from roles r 
	              join roles_employee re 
	              on r.id = re.role_id
	              where role_name like '%Senior Java%') as rre
            on e.id = rre.employee_id) as emp
      on es.employee_id = emp.e_id) as emp_slr
on s.id = emp_slr.salary_id;

--20. Вывести зарплаты Junior QA инженеров.
select distinct monthly_salary as salary 
from salary s 
join (select salary_id
      from employee_salary es 
      join (select e.id as e_id
	        from employees e 
            join (select role_name, employee_id 
	              from roles r 
	              join roles_employee re 
	              on r.id = re.role_id
	              where role_name like '%Junior%'
	              and role_name like '% QA engineer%') as rre
            on e.id = rre.employee_id) as emp
      on es.employee_id = emp.e_id) as emp_slr
on s.id = emp_slr.salary_id;

--21. Вывести среднюю зарплату всех Junior специалистов.
select avg(distinct monthly_salary) as avg_salary 
from salary s 
join (select salary_id
      from employee_salary es 
      join (select e.id as e_id
	        from employees e 
            join (select role_name, employee_id 
	              from roles r 
	              join roles_employee re 
	              on r.id = re.role_id
	              where role_name like '%Junior%') as rre
            on e.id = rre.employee_id) as emp
      on es.employee_id = emp.e_id) as emp_slr
on s.id = emp_slr.salary_id;

--22. Вывести сумму зарплат JS разработчиков.
select sum(monthly_salary) as sum_salary 
from salary s 
join (select salary_id
      from employee_salary es 
      join (select e.id as e_id
	        from employees e 
            join (select role_name, employee_id 
	              from roles r 
	              join roles_employee re 
	              on r.id = re.role_id
	              where role_name like '%JavaScript%') as rre
            on e.id = rre.employee_id) as emp
      on es.employee_id = emp.e_id) as emp_slr
on s.id = emp_slr.salary_id;

--23. Вывести минимальную ЗП QA инженеров.
select min(monthly_salary) as min_salary 
from salary s 
join (select salary_id
      from employee_salary es 
      join (select e.id as e_id
	        from employees e 
            join (select role_name, employee_id 
	              from roles r 
	              join roles_employee re 
	              on r.id = re.role_id
	              where role_name like '%QA engineer%') as rre
            on e.id = rre.employee_id) as emp
      on es.employee_id = emp.e_id) as emp_slr
on s.id = emp_slr.salary_id;

--24. Вывести максимальную ЗП QA инженеров.
select max(monthly_salary) as max_salary 
from salary s 
join (select salary_id
      from employee_salary es 
      join (select e.id as e_id
	        from employees e 
            join (select role_name, employee_id 
	              from roles r 
	              join roles_employee re 
	              on r.id = re.role_id
	              where role_name like '%QA engineer%') as rre
            on e.id = rre.employee_id) as emp
      on es.employee_id = emp.e_id) as emp_slr
on s.id = emp_slr.salary_id;

--25. Вывести количество QA инженеров.
select count(role_name) 
from roles r 
join roles_employee re 
on r.id = re.role_id 
where role_name like '%QA engineer%';

--26. Вывести количество Middle специалистов.
select count(role_name) 
from roles r 
join roles_employee re 
on r.id = re.role_id 
where role_name like '%Middle%';

--27. Вывести количество разработчиков.
select count(role_name) 
from roles r 
join roles_employee re 
on r.id = re.role_id 
where role_name like '%developer%';

--28. Вывести фонд (сумму) зарплаты разработчиков.
select sum(monthly_salary) as sum_salary 
from salary s 
join (select salary_id
      from employee_salary es 
      join (select e.id as e_id
	        from employees e 
            join (select role_name, employee_id 
	              from roles r 
	              join roles_employee re 
	              on r.id = re.role_id
	              where role_name like '%developer%') as rre
            on e.id = rre.employee_id) as emp
      on es.employee_id = emp.e_id) as emp_slr
on s.id = emp_slr.salary_id;

--29. Вывести имена, должности и ЗП всех специалистов по возрастанию.
select employee, role_name as role, monthly_salary as salary
from salary s 
join (select employee, salary_id, role_name 
      from employee_salary es 
      join (select e.id as e_id, e.employee_name as employee, role_name 
	        from employees e 
            join (select role_name, employee_id 
	              from roles r 
	              join roles_employee re 
	              on r.id = re.role_id) as rre
            on e.id = rre.employee_id) as emp
      on es.employee_id = emp.e_id) as emp_slr
on s.id = emp_slr.salary_id
order by employee, role, salary asc;

--30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
select employee, role_name as role, monthly_salary as salary
from salary s 
join (select employee, salary_id, role_name 
      from employee_salary es 
      join (select e.id as e_id, e.employee_name as employee, role_name 
	        from employees e 
            join (select role_name, employee_id 
	              from roles r 
	              join roles_employee re 
	              on r.id = re.role_id) as rre
            on e.id = rre.employee_id) as emp
      on es.employee_id = emp.e_id) as emp_slr
on s.id = emp_slr.salary_id
where monthly_salary >= 1700 and monthly_salary <= 2300 
order by employee, role, salary asc;

--31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
select employee, role_name as role, monthly_salary as salary
from salary s 
join (select employee, salary_id, role_name 
      from employee_salary es 
      join (select e.id as e_id, e.employee_name as employee, role_name 
	        from employees e 
            join (select role_name, employee_id 
	              from roles r 
	              join roles_employee re 
	              on r.id = re.role_id) as rre
            on e.id = rre.employee_id) as emp
      on es.employee_id = emp.e_id) as emp_slr
on s.id = emp_slr.salary_id
where monthly_salary < 2300 
order by employee, role, salary asc;

--32. Вывести имена, должности и ЗП всех специалистов по возрастанию
-- у специалистов у которых ЗП равна 1100, 1500, 2000
select employee, role_name as role, monthly_salary as salary
from salary s 
join (select employee, salary_id, role_name 
      from employee_salary es 
      join (select e.id as e_id, e.employee_name as employee, role_name 
	        from employees e 
            join (select role_name, employee_id 
	              from roles r 
	              join roles_employee re 
	              on r.id = re.role_id) as rre
            on e.id = rre.employee_id) as emp
      on es.employee_id = emp.e_id) as emp_slr
on s.id = emp_slr.salary_id
where monthly_salary in ('1100', '1500', '2000')
order by employee, role, salary asc;
