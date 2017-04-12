using System;
using System.Linq;
using System.Text;
using System.Collections.Generic;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Data.Entity;
using UnitTestProject1.Entity_Framework.Models;

namespace UnitTestProject1.Entity_Framework
{
    /// <summary>
    /// Summary description for EFTests
    /// </summary>
    [TestClass]
    public class EFTests
    {
        public EFTests()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        private TestContext testContextInstance;

        /// <summary>
        ///Gets or sets the test context which provides
        ///information about and functionality for the current test run.
        ///</summary>
        public TestContext TestContext
        {
            get
            {
                return testContextInstance;
            }
            set
            {
                testContextInstance = value;
            }
        }

        #region Additional test attributes
        //
        // You can use the following additional attributes as you write your tests:
        //
        // Use ClassInitialize to run code before running the first test in the class
        // [ClassInitialize()]
        // public static void MyClassInitialize(TestContext testContext) { }
        //
        // Use ClassCleanup to run code after all tests in a class have run
        // [ClassCleanup()]
        // public static void MyClassCleanup() { }
        //
        //Use TestInitialize to run code before running each test
        [TestInitialize()]
        public void MyTestInitialize()
        {
            //Database.SetInitializer(new DropCreateDatabaseIfModelChanges<EmployeeDBContext>());
            //Database.SetInitializer(new EmployeeDBContextSeeder());
        }
        //
        // Use TestCleanup to run code after each test has run
        // [TestCleanup()]
        // public void MyTestCleanup() { }
        //
        #endregion

        [TestMethod]
        public void EF_Part1_Test()
        {
            /*
            using (var db = new EmployeeDBContext())
            {
                var departments = db.Departments.ToList();
            }
            */
        }

        [TestMethod]
        public void EF_Part2_Test()
        {
            /*
            using (var db = new Models.EmployeeModelContainer())
            {
                var departments = db.Departments.ToList();
            }
            */
        }

        [TestMethod]
        public void EF_Part3_Test()
        {
            /*
            var repo = new Models.EmployeeRepository();
            var departments = repo.GetDepartments();
            */
        }

        [TestMethod]
        public void EF_Part8_Test()
        {
            /*
            var repo = new Models.EmployeeRepository();
            var employees = repo.GetEmployees();            
            */
        }

        [TestMethod]
        public void EF_Part10_Test()
        {
            using (var db = new Models.EmployeeDBContext())
            {
                var employees = db.Employees.ToList();
            }            
        }
    }
}
