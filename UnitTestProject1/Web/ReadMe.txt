01) In IIS, what's the difference between the Integrated and Classic managed pipeline modes?
	Classic mode (IIS6 and below) IIS works with ISAPI extension (aspnet_isapi.dll) and ISAPI filter (aspnet_filter.dll) directly, black box, external plugin.
	IIS worker process first goes through native processing steps then routes to aspnet_isapi.dll for processing of managed code, finally routed back to IIS to send response
	This can result in duplication of processing steps, such as authentication and authorization
	Integrated mode is tightly integrated, part of IIS, eliminates previous duplicated steps such as authentication and authorization
02) Explain a browser request from client to server back to client rendering HTML
	Browser checks cache to see if it can find IP address, if not ISP will do a DNS lookup
	Browser issues HTTP Get request to web server, sends HTTP verb, User-Agent header (identifies itself), what type of responses it accepts (Accept, Accept-Encoding),
	Connection header (Keep-Alive), cookies, etc.
	Web Server (IIS for example) get request, does it's native processing, routes to ASP.NET DLLs (aspnet_isapi.dll and aspnet_filter.dll) to do it's processing, routes
	back to IIS, IIS sends back HTML response (classic pipeline, integrated is more tightly integrated, less duplication of processing steps) this will include response
	headers as well, Pragma: no-cache, Content-Encoding: gzip, Content-Type: text/html, response cookies etc.
	Browser begins rendering the website even before it has received the entire HTML document
	As browser renders the HTML, it will notice tags that require fetching of other URLs. The browser will send a GET request to retrieve each of these files (images, CSS, JS, etc.)	 
03) What is the Javascript DOM?
	Document Object Model, represents the structure of an HTML/XML document. It's essentially an API one uses to manipulate an HTML document, usually using Javascript 
04) Where should you place your Javascript code or references in the HTML file?
	Just before you need it and no sooner. Yahoo recommends the bottom of the page because of the way browsers download components. Scripts block parallel downloads. HTTP/1.1 specs
	suggests that browsers download no more than two components in parallel per hostname. While script is downloading, browser won't start any other downloads, even on different hostnames
05) What's the difference between HttpModule and HttpHandler?
	HttpModule is injected into the pipeline and executed on every request
	HttpHandler is usually executed for a particular extension (e.g., .pdf, .jpg)
06) What is prototype in Javascript and when would you use it?
	After you define your JS object, you can add behavior to it using prototype. E.g., you have a Person object, you can do Person.prototype.getName = function() {}
	All objects of Person, even the ones created before using prototype to add getName will get getName. 
	Reason why you would do this is maybe you don't own the JS that defined Person or maybe you just don't want to modify Person and do regression testing
	Some folks use prototype for apply inheritance, e.g., you have a Customer object, you can Customer.prototype = new Person() 
	Overall, it's better for memory and performance, if you use prototype, the method is only created one time, in the prototype
	You should always use prototype to define methods unless you need access to private data defined within class definition
07) What is hoisting in Javasript?
	Javascript interpreter's action of moving all variable and function declarations to the top of the current scope. However, only the actual declarations are hoisted, not the values.
	E.g., var test0 = 0; var test1 = 1; alert(test0 + " " + test1 + " " + test2); var test2 = 2; Will print out 0 0 undefined, no error, test2 without value is hoisted to top
08) What is a closure in Javascript?
	If you use the function keyword inside another function you are creating a closure. A closure is the local variables for a function, kept alive after the function has returned
09) What is an immediate function in JS?
	A structure that allows you to execute code immediately after DOM is loaded. (function() {})();
10) Name some common Javascript array methods?
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
11) Where are Javascript global variables stored (declared outside of functions or variables declared without the var keyword within functions)?
	window object
12) What's the difference between == and === in Javascript?
	== will do any type casting before comparison, === matches with exact types
13) What does 'use strict' do in Javascript?
	New feature in ECMAScript 5, strict operating context prevents certain actions and throws more exceptions hence more strict
	