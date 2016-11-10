01) What tools would you use to profile memory?
	CLRProfiler, Redgate Memory Profiler
02) How can you verify queries EF is generating under the hood?
	SQL Profiler
03) What is IO bound and CPU bound mean?
	IO bound means read/write to disk or network read/write would go faster if IO subsystem is faster (SSD hard drive possibly)
	CPU bound means calculations would be faster if CPU were faster
04) What are anemic domain models
	Domain models that have no behavior. The behavior is usually in code-behind, click events, controllers, or helper classes such as manager, helper, service, processor, etc.
	A true domain model has data and behavior
05) What are invariants?
	Pieces of information that makes an object real or valid. A zebra without strips is not a zebra, it's a horse
	To implement a valid object, dump the default constructor and create one passing in all required fields
	Nail down your encapsulation, private setters, only allow clients to update fields they are allowed to update
06) How do you get rid of switch statements?
	You leverage polymorphism

