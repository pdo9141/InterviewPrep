01) What is the Javascript DOM?
	Document Object Model, represents the structure of an HTML/XML document. It's essentially an API one uses to manipulate an HTML document, usually using Javascript 
02) Where should you place your Javascript code or references in the HTML file?
	Just before you need it and no sooner. Yahoo recommends the bottom of the page because of the way browsers download components. Scripts block parallel downloads. HTTP/1.1 specs
	suggests that browsers download no more than two components in parallel per hostname. While script is downloading, browser won't start any other downloads, even on different hostnames
03) What is prototype in Javascript and when would you use it?
	After you define your JS object, you can add behavior to it using prototype. E.g., you have a Person object, you can do Person.prototype.getName = function() {}
	All objects of Person, even the ones created before using prototype to add getName will get getName. 
	Reason why you would do this is maybe you don't own the JS that defined Person or maybe you just don't want to modify Person and do regression testing
	Some folks use prototype for apply inheritance, e.g., you have a Customer object, you can Customer.prototype = new Person() 
	Overall, it's better for memory and performance, if you use prototype, the method is only created one time, in the prototype
	You should always use prototype to define methods unless you need access to private data defined within class definition
	Whenever you create functions which are objects in Javascript, it also creates a prototype object, if you declare function with new keyword you'll get __proto__ property, prototype doesn't
	come into play if you just call the function without the new keyword
04) What is hoisting in Javasript?
	Javascript interpreter's action of moving all variable and function declarations to the top of the current scope. However, only the actual declarations are hoisted, not the values.
	E.g., var test0 = 0; var test1 = 1; alert(test0 + " " + test1 + " " + test2); var test2 = 2; Will print out 0 0 undefined, no error, test2 without value is hoisted to top
05) What is a closure in Javascript?
	If you use the function keyword inside another function you are creating a closure. A closure is the local variables for a function, kept alive after the function has returned
06) What is an immediate function in JS?
	A structure that allows you to execute code immediately after DOM is loaded. (function() {})();
07) Name some common Javascript array methods?
	a) concat(): joins two or more arrays and returns a copy of the joined arrays
	b) every(): checks if every element in an array pass a test, you create the test function and pass as argument into every method
	c) some(): checks if any element in an array pass a test, you create the test function and pass as argument into some method
	d) filter(): creates a new array with every element in an array that pass a test, you create test function and pass as argument into filter method
	e) find(): returns the value of the first element in an array that pass a test, you create test function and pass as argument into find method
	f) forEach(): calls a function for each array element, you create the function with (item, index) as parameters and pass as argument into forEach method
	g) pop(): removes the last element of an array
	h) push(): adds new element(s) to the end of an array
	i) unshift(): adds new element(s) to the beginning of an array
	j) shift(): removes the first element of an array
	k) reverse(): reverses the order of the elements in an array
08) Where are Javascript global variables stored (declared outside of functions or variables declared without the var keyword within functions)?
	window object
09) What's the difference between == and === in Javascript?
	== will do any type casting before comparison, === matches with exact types
10) What does 'use strict' do in Javascript?
	New feature in ECMAScript 5, strict operating context prevents certain actions and throws more exceptions hence more strict
	