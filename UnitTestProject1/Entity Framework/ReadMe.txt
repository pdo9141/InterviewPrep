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
09) With Schema First, lets say you have an Employee and EmployeeContactDetails tables but you want to make that into a single entity. This is referred to as entity splitting, to do this, 
	go to the designer, cut and paste all properties from EmployeeContactDetails except for EmployeeID and paste into Employee. Right-click EmployeeContactDetails and 
	choose Delete from Model, when prompted select No so that it doesn't delete the underlying EmployeeContactDetails DB table. Right-click on Employee and choose the Table Mapping option, 
	click Add a Table or View and choose EmployeeContactDetails, this should auto map all your fields.
10) With Schema First, lets say you have one DB table Employees but you want to map it to two entites (Employee and EmployeeContactDetail), this is called Table Splitting. Why would you want
	to do this? Table Splitting is useful when you want to delay the loading of some properties with large data when using lazy loading. For example, if you have Employee entity and if it contains 
	Photo property that would return large binary data, and if we use this Photo property only on a few pages in our application, then it does not make sense from a performance perspective to load 
	this property every time we load the Employee entity. Using lazy loading load it only on the pages where we need to display Employee photo. To achieve this, add your ADO Entity Data Model, the
	designer view will add one Employee entity, right-click and Add Entity, name it EmployeeContactDetail, name the Key Property the same as Employee entity (EmployeeID). Cut and paste the desired
	fields from Employee and paste into EmployeeContactDetail. Right-click on EmployeeContactDetail and Add Association, right-click in designer on the line that connects Employee and EmployeeContactDetail
	 and select properties, here you need to specify Referential Constraint, the Principal will be Employee, Dependent is EmployeeContactDetail, Principal and Dependent Property is EmployeeID.
	 Last thing you need to do is right-click on EmployeeContactDetail and select Table Mapping, click Add a Table or View to map entity to Employees DB table. Don't forget to explicitly include the
	 contact details in your queries. List<Employee> employees = employeeDBContext.Employees.Include("EmployeeContactDetail").ToList();
11) With Code First, if you want to entity split the Employee class into two tables (Employees and EmployeeContactDetails) you can override the DbContext method OnModelCreating. 
	In this method, modelBuilder.Entity<Employee>()
						// Specify properties to map to Employees table
						.Map(map => {
							map.Properties(p => new
							{
								p.EmployeeId,
								p.FirstName,
								p.LastName,
								p.Gender
							});

							map.ToTable("Employees");
						})
						// Specify properties to map to EmployeeContactDetails table
						.Map(map =>
						{
							map.Properties(p => new
							{
								p.EmployeeId,
								p.Email,
								p.Mobile,
								p.Landline
							});

							map.ToTable("EmployeeContactDetails");
						});
12) With Code First, to handle Table splitting where you have two entities (Employee and EmployeeContactDetail) to one DB table (Employees), add your navigation fields, Employee should have EmployeeContactDetail and 
	EmployeeContactDetail should have Employee. You now need to override the OnModelCreating method in DBContext class.
		modelBuilder.Entity<Employee>()
            .HasKey(pk => pk.EmployeeID)
            .ToTable("Employees");

        modelBuilder.Entity<EmployeeContactDetail>()
            .HasKey(pk => pk.EmployeeID)
            .ToTable("Employees");

        modelBuilder.Entity<Employee>()
            .HasRequired(p => p.EmployeeContactDetail)
            .WithRequiredPrincipal(c => c.Employee);
13) What is conditional mapping in EF? Imagine if the application that we are developing always need only the employees who are not terminated, then in the query we will have to always include the filter across our entire application. 
	Conditional Mapping can be used to apply such a permanent filter on the entity, so that the generated SQL query always have the WHERE clause. To do this in Schema First:
	1. Right click on the entity and select "Table Mapping" option from the context menu
	2. Add the condition - When Is Terminated = false
	At this point, if you build the solution or validate the model, you will get the following error This is because, a table column cannot be mapped more than once. We have used IsTerminated column in conditional mapping, 
	so it cannot be used in property mapping as well. For this reason delete it from Employee entity.
14) To do conditional mapping in Code First, all you need to do is override OnModelCreating in DBContext class.
			modelBuilder.Entity<Employee>()
                .Map(m => m.Requires("IsTerminated")
                .HasValue(false))
                .Ignore(m => m.IsTerminated);
15) What is self referencing association in EF? Imagine an Employees table that had a column for ManagerID which has a value that maps to the same table's EmployeeID. EF will create an Employee entity with navigation fields
	for their subordinates and manager. EF will name it something funky like Employees1 and Employee1, just remember to change these when using the Schema First Approach.
16) With Code First Approach, to create a self referencing association table in EF override OnModelCreating in DBContext class.
	 modelBuilder.Entity<Employee>()
        .HasOptional(e => e.Manager)
        .WithMany()
        .HasForeignKey(m => m.ManagerID);
17) How do you do Table Per Hierarchy (TPH) Inheritance in EF schema first? For example you have one Employees DB table which holds both permenant and contract employee details. You want to have an object graph of Employee (base class) 
	and two subclasses that derive from this, ContractEmployee and PermanentEmployee. In designer view, add entity PermanentEmployee and select base type as Employee. Cut and paste fields from Employee that are specific to PermanentEmployee.
	Do the same for ContractEmployee. Right-click ContractEmployee and PermanentEmployee and select table mapping to map your fields. Go to properties of Employee and set the Abstract value to False. You don't want developers creating
	instances of Employee. Go back to mappings and add condition, When Discriminator = PermanentEmployee or When Discriminator = ContractEmployee so that EF knows how to map your entities. You need to now delete the Discriminator field
	from Employee to avoid build error. Use OfType method when you query EF to produce derived types. employeeDBContext.Employees.OfType<PermanentEmployee>().ToList(); If by chance you want all Employee base but want all fields for both
	ContractEmployee and PermanentEmployee to display, create a private method that expects List<Employee>, create a DataTable with all columns, populate rows by casting using "employee is PermanentEmployee".
18) How do you do Table Per Hierarchy with code first? Create your object graphs with inheritance, Discriminator will be automatically created for you. You can use [Column(Order = 1)] attribute to control order of DB table column ordering.


continue on part 20