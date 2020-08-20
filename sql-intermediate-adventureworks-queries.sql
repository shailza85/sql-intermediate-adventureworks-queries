-- Determine the employee with the highest accumulated vacation hours.

SELECT EmployeeID, FirstName, LastName, VacationHours FROM Contact 
INNER JOIN Employee ON Employee.ContactID=Contact.ContactID 
WHERE VacationHours IN ( 
    SELECT MAX(VacationHours) FROM Contact 
    INNER JOIN Employee ON Employee.ContactID=Contact.ContactID    
);

-- Determine how many employees there are whose names start with the letter S.

SELECT count(*) 'Count(EmployeeName(StartWithS))'FROM Contact 
INNER JOIN Employee ON Employee.ContactID=Contact.ContactID 
WHERE FirstName LIKE 'S%';

-- Determine the current payrate of the CEO of Adventure Works.

SELECT employeepayhistory.EmployeeID, employee.Title, employeepayhistory.Rate 'CurrentPayRate'FROM employeepayhistory INNER JOIN employee
ON employee.EmployeeID = employeepayhistory.EmployeeID
WHERE employee.Title = 'Chief Executive Officer';


-- Determine how many employees are currently employed in each department.

SELECT department.DepartmentID, department.name, count(EmployeeID) 'NumberOfEmployees' FROM department
INNER JOIN employeedepartmenthistory
ON employeedepartmenthistory.DepartmentID=department.DepartmentID
GROUP BY department.Name;

-- Challenge: Determine the first and last names of the employees who were hired in the most recent uptake. 


SELECT FirstName, LastName, Employee.HireDate FROM Contact
INNER JOIN Employee ON Employee.ContactID=Contact.ContactID
WHERE HireDate IN (
    SELECT MAX(HireDate) FROM Contact
    INNER JOIN Employee ON Employee.ContactID=Contact.ContactID
);