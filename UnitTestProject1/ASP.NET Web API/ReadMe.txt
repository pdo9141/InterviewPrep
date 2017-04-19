https://www.youtube.com/watch?v=0pcM6teVdKk&list=PL6n9fhu94yhW7yoUOGNOfHurUE6bpOO2b

01) The term API stands for ‘Application Programming Interface’. ASP.NET Web API is a framework for building Web API’s, i.e. HTTP based services on top of the .NET Framework. 
	The most common use case for using Web API is for building RESTful services. These services can then be consumed by a broad range of clients like
	1. Browsers
	2. Mobile applications
	3. Desktop applications
	4. IOTs
02) What are RESTful services. REST stands for Representational State Transfer. REST was first introduced in the year 2000 by Roy Fielding as part of his doctoral dissertation. 
	REST is an architectural pattern for creating an API that uses HTTP as its underlying communication method. The REST architectural pattern specifies a set of constraints that a 
	system should adhere to. Here are the REST constraints.
		Client Server constraint - This is the first constraint. Client sends a request and the server sends a response. This separation of concerns supports the independent evolution of 
		the client-side logic and server-side logic.
		Stateless constraint - The next constraint is the stateless constraint. The communication between the client and the server must be stateless between requests. This means we should 
		not be storing anything on the server related to the client. The request from the client should contain all the necessary information for the server to process that request. 
		This ensures that each request can be treated independently by the server.
		Cacheable constraint - Some data provided by the server like list of products, or list of departments in a company does not change that often. This constraint says that let 
		the client know how long this data is good for, so that the client does not have to come back to the server for that data over and over again.
		Uniform Interface - The uniform interface constraint defines the interface between the client and the server. To understand the uniform interface constraint, we need to understand 
		what a resource is and the HTTP verbs - GET, PUT, POST & DELETE. In the context of a REST API, resources typically represent data entities. Product, Employee, Customer etc are 
		all resources. The HTTP verb (GET, PUT, POST, DELETE) that is sent with each request tells the API what to do with the resource. Each resource is identified by a specific 
		URI (Uniform Resource Identifier). The following table shows some typical requests that you see in an API
03) Difference between WCF and Web API. When to choose one over the other? WCF (Windows Communication Foundation) - One of the choices available in .NET for creating RESTful services is WCF. 
	The problem with WCF is that, a lot of configuration is required to turn a WCF service into a RESTful service. The more natural choice for creating RESTful services is ASP.NET Web API, 
	which is specifically created for this purpose. WCF is more suited for building services that are transport/protocol independent. For example, you want to build a single service, 
	that can be consumed by 2 different clients - Let's say, a Java client and .NET client. Java client expects transport protocol to be HTTP and message format to be XML for interoperability, 
	where as the .NET client expects the protocol to be TCP and the message format to be binary for performance. For this scenario WCF is the right choice. 
	What we do here is create a single WCF service, and then configure 2 end points one for each client (i.e one for the Java client and the other for the .NET client). 
04) By default ASP.NET Web API will return JSON, the client can override this by changing the request header's Accept attribute to application/xml. In Fiddler, you can compose a POST or PUT
	request and update the request header's Content-Type attribute to application/json to execute post or put. When API methods return void a status code of 204 (no content) is returned,
	you can of course change this to return any status code you want.
05) What is Content Negotiation? One of the standards of the RESTful service is that, the client should have the ability to decide in which format they want the response - XML, JSON etc. 
	A request that is sent to the server includes an Accept header. Using the Accept header the client can specify the format for the response.
	Multiple values can also be specified for the Accept header. In this case, the server picks the first formatter which is a JSON formatter and formats the data in JSON.
		Accept: application/xml,application/json
	You can also specify quality factor. In the example below, xml has higher quality factor than json, so the server uses XML formatter and formats the data in XML.
		application/xml;q=0.8,application/json;q=0.5
	Within the WebApiConfig.cs file, you can easily update the formatters with the lines below:
		config.Formatters.JsonFormatter.SerializerSettings.Formatting = Newtonsoft.Json.Formatting.Indented;
		config.Formatters.JsonFormatter.SerializerSettings.ContractResolver = new CamelCasePropertyNamesContractResolver();

continue at part 6