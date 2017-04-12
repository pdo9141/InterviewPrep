using System.ComponentModel.DataAnnotations.Schema;

namespace UnitTestProject1.Entity_Framework.Models
{
    //[Table("tblEmployees")]
    public class Employee
    {
        // Scalar Properties
        public int Id { get; set; }

        //[Column("First_Name")]
        public string FirstName { get; set; }

        public string LastName { get; set; }

        public string Gender { get; set; }

        public int Salary { get; set; }

        public string JobTitle { get; set; }

        public int DepartmentId { get; set; }

        // Navigation Property
        [ForeignKey("DepartmentId")]
        public Department Department { get; set; }
    }
}
