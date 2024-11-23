create database lab9;
create function increased_value(a integer) returns integer as
$$
 select a + 10;
$$
 language sql;
create or replace function compare_numbers(a integer, b integer) returns TEXT as
$$
DECLARE
   result TEXT;
BEGIN
 if a = b THEN
     result := 'Equal';
 elsif a > b THEN
       result := 'Greater';
 elsif a < b THEN
       result := 'Lesser';
 end if;
 return result;
END;
$$ 
 language plpgsql;
create or replace function number_series(n integer) returns TEXT as
$$
DECLARE 
 counter INTEGER := 1;
 result TEXT := '';
BEGIN
 while counter <= n LOOP
 result := result || counter || ', ';
 counter := counter + 1;
 END LOOP;
 return RESULT;
END;
$$ language plpgsql;
CREATE OR REPLACE FUNCTION employee(name VARCHAR, surname VARCHAR)
RETURNS SETOF employees AS $$
BEGIN
    RETURN QUERY
    SELECT e.* 
    FROM employees e
    WHERE e.first_name = name AND e.last_name = surname;
END;
$$ LANGUAGE plpgsql;

select increased_value (10);
select compare_numbers (115, 123);
select compare_numbers (22, 22);
select compare_numbers (2, 1);
select number_series(10);
select * from employee('Michael', 'Rogers');
CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,  
    category_name VARCHAR(255) NOT NULL,  
    description TEXT  
);
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,  
    product_name VARCHAR(255) NOT NULL,  
    price DECIMAL(10, 2) NOT NULL,  
    category_id INT, 
    description TEXT, 
    FOREIGN KEY (category_id) REFERENCES categories(category_id) 
);
CREATE OR REPLACE FUNCTION list_products_by_name(category_name_param VARCHAR)
RETURNS TABLE (
    product_id INT,
    product_name VARCHAR,
    price DECIMAL(10, 2),
    description TEXT,
    category_name VARCHAR
) AS $$
BEGIN
    -- Return the product details for the given category_name
    RETURN QUERY
    SELECT p.product_id, p.product_name, p.price, p.description, c.category_name
    FROM products p
    JOIN categories c ON p.category_id = c.category_id
    WHERE c.category_name = category_name_param;  -- Use the function parameter explicitly
END;
$$ LANGUAGE plpgsql;
SELECT * FROM list_products_by_name('Electronics');
drop function calculate_bonus(employee_id INT, bonus_percentage DECIMAL)
CREATE OR REPLACE FUNCTION calculate_bonus(employee_id_param INT, bonus_percentage DECIMAL)
RETURNS DECIMAL AS $$
DECLARE
    current_salary DECIMAL;
    bonus DECIMAL;
BEGIN
    SELECT salary INTO current_salary
    FROM employees
    WHERE employee_id = employee_id_param;

   
    bonus := current_salary * bonus_percentage / 100;

    
    RETURN bonus;
END;
$$ LANGUAGE plpgsql;

drop function salary (employee_id_param INT, bonus_percentage DECIMAL);
CREATE OR REPLACE FUNCTION update_salary(employee_id_param INT, bonus_percentage DECIMAL)
RETURNS VOID AS $$
DECLARE
    current_bonus DECIMAL;
    new_salary DECIMAL;
BEGIN
    
    current_bonus := calculate_bonus(employee_id_param, bonus_percentage);

    
    SELECT salary INTO new_salary
    FROM employees
    WHERE employee_id = employee_id_param;

   
    new_salary := new_salary + current_bonus;

    
    UPDATE employees
    SET salary = new_salary
    WHERE employee_id = employee_id_param;
END;
$$ LANGUAGE plpgsql;

SELECT update_salary(1, 10);
CREATE OR REPLACE FUNCTION complex_calculation(num_value INT, text_value VARCHAR)
RETURNS TABLE (final_result VARCHAR, numeric_result INT) AS $$
DECLARE
    result_text VARCHAR;
    modified_text VARCHAR;
    numeric_computation INT;
BEGIN
   
    BEGIN
       
        modified_text := CONCAT(text_value, '_processed');
        result_text := 'Text after modification: ' || modified_text;
    END;

    
    BEGIN
        
        numeric_computation := num_value * num_value;
    END;

   
    final_result := result_text || '. Computed square is ' || numeric_computation;

    
    RETURN NEXT;
END;
$$ LANGUAGE plpgsql;
SELECT * FROM complex_calculation(5, 'Test');