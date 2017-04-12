using System.Collections.Generic;
using System.Linq;

namespace UnitTestProject1.Entity_Framework.Models
{
    public class EmployeeRepository
    {
        EmployeeDBContext employeeDBContext = new EmployeeDBContext();

        public List<Employee> GetEmployees()
        {
            return employeeDBContext.Employees.ToList();
        }

        public void InsertEmployee(Employee employee)
        {
            employeeDBContext.Employees.Add(employee);
            employeeDBContext.SaveChanges();
        }

        public void UpdateEmployee(Employee employee)
        {
            Employee employeeToUpdate = employeeDBContext
                .Employees.SingleOrDefault(x => x.Id == employee.Id);
            employeeToUpdate.FirstName = employee.FirstName;
            employeeToUpdate.LastName = employee.LastName;
            employeeToUpdate.Gender = employee.Gender;
            employeeToUpdate.Salary = employee.Salary;
            employeeToUpdate.JobTitle = employee.JobTitle;
            employeeDBContext.SaveChanges();
        }

        public void DeleteEmployee(Employee employee)
        {
            Employee employeeToDelete = employeeDBContext
                .Employees.SingleOrDefault(x => x.Id == employee.Id);
            employeeDBContext.Employees.Remove(employeeToDelete);
            employeeDBContext.SaveChanges();
        }
    }
}
