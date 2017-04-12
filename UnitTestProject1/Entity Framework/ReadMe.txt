https://www.youtube.com/watch?v=Z7713GBhi4k&list=PL6n9fhu94yhUPBSX-E2aJCnCR3-_6zBZx&index=1

01) To use Schema First Approach, add ADO.NET Entity Data Model which creates an EDMX file
02) To use Model First Approach, create entities, relationships between entities, inheritance hierarchies etc. add ADO.NET Entity Data Model to create EDMX file
	but select Empty EF Designer model instead of EF Designer from database. Here you will create your models, their scalar properties, and associations.
	Once you finish the designer, you can right-click on the design surface and choose the Generate Database from Model option. This will create the DDL create script
	to produce the Departments and Employees database objects.
03) To use Code First Approach, create custom classes first and based on those classes EF can generate database automatically for us. For example, you would create 
	the Department, Employee, EmployeeDBContext (inherit DBContext, add DbSet for Department and Employee). You can optionally create a EmployeeRepository class
	which would work with the EmployeeDBContext directly. EF by convention will look for a connection string in your config file that match the class that inherits
	DBContext, in our case that would be EmployeeDBContext. On your first app run, EF should create your Departments, Employees, and _MigrationHistory tables
04) Use [ForeignKey("DepartmentId")], [Table("tblEmployees")], and [Column("First_Name")] attributes to control DB table and column creation.
05) After DB is created, you handle model changes with the help of _MigrationHistory table. EF hashes your models into this table's Model column and compares the new hash 
	to stored value to know if model changes have occurred. Use Database.SetInitializer(new DropCreateDatabaseIfModelChanges<EmployeeDBContext>()); to drop DB and recreate.
	In MSTest call this in your [TestInitialize()] method.
06) To seed DB with test data, create a the new EmployeeDBContextSeeder which inherits DropCreateDatabaseIfModelChanges<EmployeeDBContext> and override the Seed method.
	Replace your original initializer seeder with Database.SetInitializer(new EmployeeDBContextSeeder());
07) With Schema First, you can choose to use your own stored procedures instead of the dynamically generated EF queries. Go to the designer, right-click on the entity,
	choose Stored Procedure Mapping, selete your insert, update, and delete function options to your stored procedures.
08) With Code First, you can choose to use your own stored procedures instead of the dynamically generated EF queries. In your EmployeeDBContext class, override the OnModelCreating method
	and add this line, modelBuilder.Entity<Employee>().MapToStoredProcedures(), now when your DB is created, tables and stored procedures are automatically created as well.
	To override SP name defaults, modify your EmployeeDBContext class, change modelBuilder.Entity<Employee>().MapToStoredProcedures(p => p.Insert(x => x.HasName("InsertEmployee")))
	To override SP parameter defaults, use modelBuilder.Entity<Employee>().MapToStoredProcedures(p => p.Insert(x => x.HasName("InsertEmployee")
		.Parameter(n => n.Name, "EmployeeName")
		.Parameter(n => n.Gender, "EmployeeGender")))

continue on part 10