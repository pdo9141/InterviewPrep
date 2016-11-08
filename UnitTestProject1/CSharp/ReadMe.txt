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
07) What is the yield keyword?
08) What is the volatile keyword?
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
15) Difference between const and readonly
16) Difference between var and dynamic
17) Difference between IEnumerale vs IEnumerator
18) IL Code, CLR, CTS, CAS
19) Difference between thread, process, AppDomain
20) Abstraction and Encapsulation
21) Can .NET leak memory?
	No, garbage collection handled by runtime but with LOH fragmentation it can be considered a leak cause it throws an OutOfMemory Exception