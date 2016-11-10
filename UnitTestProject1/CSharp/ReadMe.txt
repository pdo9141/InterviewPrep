01) What is the use of a private constructor?
	A class with a private constructor cannot be inherited (sealed)
	You cannot create an object of a class with a private constructor (cannot new up)
	Leverage private constructor for implement the Singleton pattern
02) What is the difference between Convert.ToString() and ToString()
	Convert.ToString handles null, ToString does not handle null (null exception)
03) What collections do you use and when would you use them?
	Array: when you need fast access by index
	List<T>: when you need fast access by index
	Dictionary<TKey, TValue>: when you need fast access by key
	Queue<T>: when you need FIFO
	Stack<T>: when you need LIFO
04) What is boxing and unboxing?
	Boxing is converting a value type to a reference type (think ArrayList since everything is stored as objects)
	Unboxing is converting a reference type to a value type
05) What's is so good about generics?
	You avoid boxing/unboxing by leveraging generics
	Utilize same code on different data types
06) What's the difference between Func, Action, Delegate, Events
	Delegate is essentially a function pointer, you can pass any method as the delegate as long as the method signature is the same, gives you swapability 
	Delegates are useful for callback functions, data communication between code with delegate and client which uses that code, you need to know something, pass me a callback delegate and I'll tell you
	You can call a delegate by using the Invoke method but usually you just pass delegates as parameter arguments and the placeholder is called within the method
	Func is easier way to write delegate, Func can have return value
	Action is earier way to write delegate, Action return void
	Events is a pub/sub model, you event place holders in code then you subscribe to that event in your calling code, kinda of like the template pattern
07) What is the yield keyword?
	You use yield in for iterations, filtering for loops, yield yields control back to caller and then goes back into filter method
	In the filter method variables are stateful meaning even value types hold their previous value, you can do running total for example
08) What is the volatile keyword?
	Volatile helps with multi-threaded programming, ensures all threads get latest not stale value
09) What keywords and structures can you use to help with multithreaded programming?
	lock, Monitor.Enter, Interlocked
10) Is string a value or reference type?
	string is a special kind of reference type
	immutable, you can't change it once created, setting it's value creates new memory allocation on the heap
11) Difference between string and StringBuilder
	string is your immutable string type,  
	StringBuilder is your mutable string type
12) What are immutable objects, why would you use it, and how do you implement it?
	Immutable objects are objects which once loaded cannot be changed or modified (externally or internally)
	You use them on master data, configuration data, or singleton objects	
	Make all fields private readonly, remove setters from properties, create constructor and initialize your fields here and only here
13) What's the difference between == vs Equals
	When dealing with strings Equals compares values while == compares object references. It behaves differently depending upon actual type used
14) Difference between out and ref
	Almost the same, you're passing argument by reference, out requires you set the argument before the method exists
15) Difference between const and readonly
	Readonly can be initialized in the consructor, const must be initialized during declaration
16) Difference between var and dynamic
	Var saves typing, type is inferred, dynamic is magic, you can stuff anything in it, sort of like Javascript's var. When you use dynamic you give up compiler type checking.
	dynamic cust = GetCustomer(); cust.MissingMethod(); You don't have to cast to customer to use methods but this will compile and will only throw exception when run since MissingMethod doesn't exists
17) Difference between IEnumerable vs IEnumerator
	IEnumerable you can take a List and traverse the collection with foreach, IEnumerable uses IEnumerator internally
	IEnumerator you can take a List and traverse by getting enumerator and using the MoveNext(), then Current
	Use IEnumerable usually cause coding is easier but use IEnumerator if you need that state tracking, you're doing MoveNext so Current retains your existing state
18) IL Code, CLR, CTS, CAS
19) Difference between thread, process, AppDomain
20) Difference between assembly, exe, DLL
21) Abstraction and Encapsulation
	Abstraction hiding implementation details by providing generic layer, interfaces, abstract classes. Represent essential features, no tedious detail, think higher level concepts
	Encapsulation is about information hiding, give clients only access to properties and methods they absolutely need
22) What is polymorphism?
	Utilizing the same abstract code execution and make it behave differently depending on concrete classes used
23) Can .NET leak memory?
	No, garbage collection handled by runtime but with LOH fragmentation it can be considered a leak cause it throws an OutOfMemory Exception
24) What are anonymous methods and uses?
	Method coded inline using delegate keyword, PointAddFunction pointAdd = delegate(int num1, int num2) { return num1 + num3; }; pointAdd.Invoke(2, 2);
	Use instead of full blown delegate declaration and methods, use when you're lazy, anonymous methods are better performing than delegates
25) What is indexer?
	When you have a class that has a collection children for example Customer has Addresses, helps simplify the way we access child collections of a class
	Add this getter/setter property, e.g., public Address this[int PinCode] { get{}}, public Address this[PhoneNumber] { get{} }
26) What is shadowing and it's uses?
27) What is contravariance and covariance?
28) How are tuple and anonymous types useful?
	When you want one logical unit but don't want to create a full blown object. Can be used as method parameters or return types, minimize code
	For readability and maintainablity it's better to use anonymous types to see meaningful names (no Item1, Item2 etc.)
	If you want to return an anonymous type from a method, return object then write a generic cast method, send in anonymous signature with defaults as Type parameter in cast method
29) What is unchecked and checked?	
30) Debug vs Release
31) Multithreading and thread safety