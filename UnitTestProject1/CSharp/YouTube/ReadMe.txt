01) What is verbatim literal? Verbatim literals make escape sequences translate as normal printable characters to enhance readability. @"C:\Pragim\DotNet\Training\Csharp"
02) What are advantages and disadvantages of arrays? 
	Advantage: is that it's strongly typed, compilation errors, fast index lookup
	Disadvantage: you must know size up front, if size is 3 but you store 4 element, it will compile but you'll get runtime exception
				  have to rely on integral indices to store or retrieve items from the array
03) What is difference between arguments and parameters? In method declaration you specify parameters. When you run and pass in values those are arguments
04) Why namespaces? Namespaces are used to organize your program and they also provide assistance in avoiding name clashes.
05) What are destructors? ~Customer() {}, called automatically by garbage collector. Use to clean up resources (unmanaged resources like windows file handles or COM objects), usually in C# you don't use this
	When you use built-in .NET classes to work with files and database connections .NET will do all the dirty work to clean up those unmanaged resources so you don't have to worry about it.
	If you don't use these "wrappers" and work with files and database connections by opening network sockets etc. it is now unmanaged
06) Why would you use static vs instance class members? If the member never changes like PI (3.14) then it should be static. If the field can be different for each instance (radius of circle) then it should be instance.
	Static members conserve memory since it's shared by all instances, this applies to static methods as well
07) Can you have both a regular and static constructor in the same class? Yes, note also that static constructors cannot have access modifiers (public, protected, private, internal)
08) Why do you use static constructors? To initialize static fields. Static constructors are called only once and before instance constructors
09) What is polymorphism? Imagine if you have an Employee base class and have an array of Employee objects but you store derived classes in the array. For example, you use PartTimeEmployee, FullTimeEmployee, and TemporaryEmployee
	derived classes. Now when you iterate and call PrintFullName method at runtime, it'll print the derived classes' implementation. Keep in mind that the base class PrintFullName method must be marked as virtual and the derived
	classes must override the virtual method. If you don't do this, call PrintFullName will use the base class implementation. Polymorphism allows you to invoke derived class methods through a base class reference at runtime.
10) What is the difference between method overriding and method hiding? In method overriding a base class reference variable pointing to a child class object, will invoke the overridden method in the child class (use override in derived class).
	In method hiding a base class reference variable pointing to a child class object will invoke the hidden method in the base class (use new in derived class method signature).
11) What is encapsulation? When you only expose fields to the client you want exposed by using access modifiers such as private and protected. You can leverage setters and getters or properties to control value invariants






continue on video 27

