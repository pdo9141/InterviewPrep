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


continue on part 4