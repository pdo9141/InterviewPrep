http://www.csharpstar.com/top-20-interview-questions-on-rest-api/

01) What is REST? Representational state transfer is an architectural style for web services. REST makes communication between remote computers easy by using the simple HTTP protocol which support for 
	CRUD (Create, Read, Update, and Delete) operations on the server by modeling HTTP verbs (POST, GET, PUT, DELETE). 
	REST uses various representations to represent a resource where text, JSON, XML. XML and JSON are the most popular representations of resources
02) Name some of the commonly used HTTP methods used in REST based architecture?
	GET − Provides a read only access to a resource.
	PUT − Used to update an existing resource.
	DELETE − Used to remove a resource.
	POST − Used to create a new resource.
	OPTIONS − Used to get the supported operations on a resource.
03) What is a Resource in REST? Any information that can be named can be a resource: a document or image, a temporal service. It's basically "whatever thing is accessed by the URL you supply".
04) Explain the 5 REST design principles.
	1) Everything is a Resource
	2) Each Resource is identifiable by unique URI
	3) Use the standard HTTP methods
	4) Allow multiple representations for same Resource
	5) Communication should be always stateless
05) Explain different REST Architectural Goals
	1) Visibility - Visibility of the service means that every aspect of it should self-descriptive and should follow the HTTP language as per the design principles
	2) Reliability - An HTTP method is considered to be safe provided that when requested, it does not modify or cause any side effects on the state of the resource
	3) Scalability - Scaling your application would require you to put a load balancer to your application. There would be no need for the different nodes to sync between each other, as they should not care about the state at all.
	4) Performance - Performance is measured by the time needed for a single request to be processed, not by the total number of requests that the application can handle
	5) Portability - The ease at which services and solutions can be moved from one deployed location to another is represented by Portability. Considerations that should be taken into account include the level of compatible standardization across environments, the ability to keep both data and logic grouped, and how portable a given software program can be.
	6) Simplicity - A resource is just a set of information, and it can have multiple representations. However, the state of the resource is atomic. It is up to the caller to specify the content-type header of the http request, and then it is up to the server application to handle the representation accordingly and return the appropriate HTTP status code
06) Which protocol is used by RESTful webservices? RESTful web services make use of HTTP protocol as a medium of communication between client and server.
07) What is messaging in RESTful webservices? A client sends a message in form of a HTTP Request and server responds in form of a HTTP Response. This technique is termed as Messaging. These messages contain message data and metadata i.e. information about message itself.
08) What are the core components of a HTTP Request and HTTP Response? 
	There are 5 major components for HTTP Request.
	Verb − Indicate HTTP methods such as GET, POST, DELETE, PUT etc.
	URI − Uniform Resource Identifier (URI) to identify the resource on server.
	HTTP Version − Indicate HTTP version, for example HTTP v1.1 .
	Request Header − Contains metadata for the HTTP Request message as key-value pairs. For example, client ( or browser) type, format supported by client, format of message body, cache settings etc.
	Request Body − Message content or Resource representation.
 
	There are 4 major components for HTTP Response.
	Status/Response Code − Indicate Server status for the requested resource. For example 404 means resource not found and 200 means response is ok.
	HTTP Version − Indicate HTTP version, for example HTTP v1.1 .
	Response Header − Contains metadata for the HTTP Response message as key-value pairs. For example, content length, content type, response date, server type etc.
	Response Body − Response message content or Resource representation.
09) What is addressing in RESTful webservices? Addressing refers to locating a resource or multiple resources lying on the server. It is analogous to locate a postal address of a person.
10) What is URI? RI stands for Uniform Resource Identifier. Each resource in REST architecture is identified by its URI.
	Operations on the base URI affect the set of resources as a whole
	1. GET lists them
	2. POST adds a new resource to the set
	3. DELETE deletes the whole set
	4. PUT replaces the set with a new set

	Operations on an ID-qualified URI affect an individual resource
	1. GET retrieves it
	2. DELETE destroys it
	3. PUT replaces it or create if does not exists
11) What is the purpose of HTTP Verb in REST based webservices? VERB identifies the operation to be performed on the resource.
12) What is statelessness in RESTful Webservices? The communication between client and server must be stateless. This means that each request from a service consumer should contain all the necessary information for the service to understand the meaning of the request, and all session state data should then be returned to the service consumer at the end of each request
13) What are the advantages and disadvantages of statelessness in RESTful Webservices?
	Advantages:
	Web services can treat each method request independently.
	Web services need not to maintain client’s previous interactions. It simplifies application design.
	As HTTP is itself a statelessness protocol, RESTful Web services work seamlessly with HTTP protocol

	Disadvantages:
	Web services need to get extra information in each request and then interpret to get the client’s state in case client interactions are to be taken care of.
14) What is the difference between PUT and POST operations? PUT − Used to update an existing resource and POST − Used to create a new resource.
15) What should be the purpose of OPTIONS and HEAD method of RESTful web services?
	OPTIONS : list down the supported operations in a web service and should be read only.
	HEAD : return only HTTP Header, no Body and should be read only.	
16) What is caching? Caching refers to storing server response in client itself so that a client needs not to make server request for same resource again and again. A server response should have information about how a caching is to be done so that a client caches response for a period of time or never caches the server response.
17) What is the purpose of HTTP Status Code? HTTP Status code are standard codes and refers to predefined status of task done at server.
	200 – OK, shows success.
	201 – CREATED, when a resource is successful created using POST or PUT request. Return link to newly created resource using location header.
	204 – NO CONTENT, when response body is empty
	304 – NOT MODIFIED, used to reduce network bandwidth usage in case of conditional GET requests
	400 – BAD REQUEST, states that invalid input is provided
	401 – FORBIDDEN, states that user is not having access to method being used
	404 – NOT FOUND, states that method is not available
	409 – CONFLICT, states conflict situation while executing the method
	500 – INTERNAL SERVER ERROR, states that server has thrown some exception while executing the method
18) Explain the REST Constraints
Client-Server - A consumer invokes the service by sending the corresponding request message, and the service either rejects the request or performs the requested task before sending a response message back to the consumer
Cache - All clients access the same server, and often requesting the same resources, it is necessary that these responses might be cached, avoiding unnecessary processing and significantly increasing performance.
Stateless - The communication between client and server must be stateless. This means that each request from a service consumer should contain all the necessary information for the service to understand the meaning of the request, and all session state data should then be returned to the service consumer at the end of each request
Uniform Contract - The Uniform Contract states that all services and service consumers within a REST-compliant architecture must share a single, overarching technical interface. As the primary constraint that distinguishes REST from other architecture types
Layered System - he layered System principle states the client should never directly call the application server without first going through an intermediary. It can be a load balancer or any other machine that makes the interface between server(s). This ensures that the customer worries only about communication between the intermediary and the intermediary becomes responsible for distributing the requests on servers
Code-On-Demand - Code-On-Demand intended to allow logic within clients to be updated independently from server-side logic
19) Difference between SOAP and REST services?
	REST is simpler to program than SOAP
		Retrieval consists of a URL(GET)
		Creation consists of a URL(POST)
		Update and Delete also simple (PUT,DELETE)
	SOAP semantics are opaque, so it bypasses the features of layered internet
	REST is lightweight on the client side
		you need to write a little bit of script codeand you are off and running
		Javascript frameworks make it browser independent and easy to integrate
	REST is lightweight in server side
		you need to write a little bit of script codeand you are off and running
		Frameworks support the web servers
20) Why should you set the location? After a POST is issued a resource is created, it's good practice to set location of GET URI of newly created resource