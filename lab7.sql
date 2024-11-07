create index index_countries on countries (name);
create index index_employees_name on employees (name, surname);
create unique index index_employees_salary on employees (salary);
create index index_employees_name_substring on employees (substring(name from 1 for 4));
create index index_departments_budget on departments (budget);
create index index_employees_salary on employees (salary);