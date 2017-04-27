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
06) What is MediaTypeFormatter? MediaTypeFormatter is an abstract class from which JsonMediaTypeFormatter and XmlMediaTypeFormatter classes inherit from. JsonMediaTypeFormatter handles JSON 
	and XmlMediaTypeFormatter handles XML.
	How to return only JSON from ASP.NET Web API Service irrespective of the Accept header value?
		config.Formatters.Remove(config.Formatters.XmlFormatter);
	How to return only XML from ASP.NET Web API Service irrespective of the Accept header value?
		config.Formatters.Remove(config.Formatters.JsonFormatter);
	How to return JSON instead of XML from ASP.NET Web API Service when a request is made from the browser?
		1) config.Formatters.JsonFormatter.SupportedMediaTypes.Add(new MediaTypeHeaderValue("text/html"));
		   The problem with this approach is that Content-Type header of the response is set to text/html which is misleading.
		2) Create your own CustomJsonFormatter : JsonMediaTypeFormatter, in constructor this.SupportedMediaTypes.Add(new MediaTypeHeaderValue("text/html"));
		   Override the SetDefaultContentHeaders method headers.ContentType = new MediaTypeHeaderValue("application/json");
		   Register the formatter in Register() config.Formatters.Add(new CustomJsonFormatter());
	How do you create your own CSV formatter? http://www.tugberkugurlu.com/archive/creating-custom-csvmediatypeformatter-in-asp-net-web-api-for-comma-separated-values-csv-format 
07) Decorate the parameter for the POST method with [FromBody] Employee employee to hydrate the argument with the response body. By default you'll get 204 status code when POST is called with void.
	You want to return HttpResponseMessage instead and return Request.CreateResponse(HttpStatusCode.Created, employee), that is 201 status code, EF will update employee with auto generated ID
	You'll probably want to include the URI where you can get newly created employee. Use message.Headers.Location = new Uri(Request.RequestUri + employee.ID.ToString())
	If there are any errors, log exception then use Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex), might not be a good idea to return ex if public API
08) When using GET method, make sure you respond with proper HTTP status code if no resource found, not return 200 (HttpStatusCode.OK), return 404 (HttpStatusCode.NotFound)
	Request.CreateResponse(HttpStatusCode.NotFound, "Employee with id " + id " not found)
09) When using DELETE method, on success ensure you return status code 200 and not 204. On failure ensure you return HttpStatusCode.NotFound (404) or HttpStatusCode.BadRequest (400)
10) When using PUT method, Put(int id, [FromBody]Employee employee), on success ensure you return 200 and not 204 (no content). On failure ensure you return HttpStatusCode.NotFound (404) or HttpStatusCode.BadRequest (400)
11) How do you create custom method names in API controller and map them to proper HTTP method? Use [HttpGet], [HttpPost], [HttpPut], [HttpDelete] attributes 
12) By default, how does Web.API handle parameter binding? If the parameter is a simple type like int, bool, double, etc., Web API tries to get the value from the URI (Either from route data or Query String)
	If the parameter is a complex type like Customer, Employee etc., Web API tries to get the value from the request body. We can change this default parameter binding process by using [FromBody] and [FromUri] attributes. 
	We have decorated id parameter with [FromBody] attribute, this forces Web API to get it from the request body
	We have decorated employee parameter with [FromUri] attribute, this forces Web API to get employee data from the URI (i.e Route data or Query String)
13) How do you use JQuery to call Web.API? 
	$(document).ready(function () {
            var ulEmployees = $('#ulEmployees');
            $('#btn').click(function () {
                $.ajax({
                    type: 'GET',
                    url: "api/employees/",
                    dataType: 'json',
                    success: function (data) {
                        ulEmployees.empty();
                        $.each(data, function (index, val) {
                            var fullName = val.FirstName + ' ' + val.LastName;
                            ulEmployees.append('<li>' + fullName + '</li>');
                        });
                    }
                });
            });
        });
14) What is same origin policy? Browsers allow a web page to make AJAX requests only with in the same domain. Browser security prevents a web page from making AJAX requests to another domain. This is called same origin policy. 
	You'll encounter a CORS issue if port, http vs https, or .com vs .net is different. There are two ways to get around the problem:
	1) Using JSONP (JSON with Padding) 
	   Install Nuget package WebApiContrib.Formatting.Jsonp
	   Add these lines into WebApiConfig Register()
	       var jsonpFormatter = new JsonpMediaTypeFormatter(config.Formatters.JsonFormatter);
	   In client AJAX call, change the dataType from json to jsonp
		   config.Formatters.Insert(0, jsonpFormatter);
	2) Enabling CORS (Cross Origin Resource Sharing)
	   Install Nuget package Microsoft.AspNet.WebApi.Cors
	   Add these lines into WebApiConfig Register()
	       EnableCorsAttribute cors = new EnableCorsAttribute("*", "*", "*"); // instead of *, you can be more grandular with origns, headers, methods
           config.EnableCors(cors);
	  EnableCors attribute can be applied on a specific controller or controller method. Remember to only still prep your app for CORS with config.EnableCors(); in WebApiConfig Register()
	  To disable CORS for a specific action apply [DisableCors] on that specific action
	  CORS is only a browser security thing, if you use Fiddler you will be able to make the request and get a response
15) How do you enable SSL (HTTPS) in Visual Studio for your Web.API project? Right-click on the project and go to properties, set SSL Enabled to true. Navigate to a REST method, click on the certificate issue, 
	click proceed to localhost link to see invalid certificate message. Make sure to click on the lock symbol in the URL to see the invalid certificate message. The reason for this is that, the certificate that 
	Visual Studio installed automatically is not trusted. To resolve this problem we have to place the certificate that visual studio has issued in the Trusted Root Certificates folder.
		1. In the RUN window, type mmc.exe and click OK
		2. On the window that appears, click "File" - "Add/Remove Snap-in"
		3. From the "Available snap-ins" list select "Certificates" and click "Add"
		4. On the next screen, select "Computer account" radio button
		5. On the next screen, select "Local computer" radio button and click "Finish" and then "OK"
		6. Expand Console Root - Certificates (Local Computer) - Personal - Certificates. In this folder you will find a certificate that is Issued To local and Issued By local. 	
		7. Right click on the localhost certificate, and select "All Tasks" and then "Export"
		8. Click "Next" on the subsequent screen
		9. Select "DER encoded binary X.509 (.CER)" radio button, and then click Next
		10. On the next screen, provide a name for the certificate that you are exporting and click "Next". I have placed certificate in my case at c:\Certificates\localhost
		11. Click "Finish" on the next screen
		12. Expand Console Root - Certificates (Local Computer) - Trusted Root Certification Authorities - Certificates
		13. Right click on "Certificates", and select "All Tasks" and then "Import"
		14. Click "Next" on the subsequent screen
		15. Enter the complete path where you have exported the certificate and click "Next". In my case the certificate is at c:\Certificates\localhost.cer
		16. On the next screen, select "Place all certificates in the following store" radio button and click "Next"
		17. Finally click "Finish"	
16) How do you enable HTTPS in Web.API? Create a new class that inherits AuthorizationFilterAttribute (RequireHttpsAttribute), override the OnAuthorization method.
		public override void OnAuthorization(HttpActionContext actionContext)
        {
            if (actionContext.Request.RequestUri.Scheme != Uri.UriSchemeHttps)
            {
                actionContext.Response = actionContext.Request.CreateResponse(HttpStatusCode.Found);
                actionContext.Response.Content = new StringContent("<p>Use https instead of http</p>", Encoding.UTF8, "text/html");
                UriBuilder uriBuilder = new UriBuilder(actionContext.Request.RequestUri);
                uriBuilder.Scheme = Uri.UriSchemeHttps;
                uriBuilder.Port = 44337;
                actionContext.Response.Headers.Location = uriBuilder.Uri;
            }
            else
            {
                base.OnAuthorization(actionContext);
            }
        }
	In WebApiConfig Register() add config.Filters.Add(new RequireHttpsAttribute());
	Please note: If you don't want to enable HTTPS for the entire application then don't add RequireHttpsAttribute to the filters collection on the config object in the register method. 
	Simply decorate the controller class or the action method with RequireHttpsAttribute for which you want HTTPS to be enabled. For the rest of the controllers and action methods HTTPS will not be enabled. 
17) How do you implement basic authentication in Web API? Create a class file (BasicAuthenticationAttribute) which inherits from AuthorizationFilterAttribute, override the OnAuthorization method.
	public override void OnAuthorization(HttpActionContext actionContext)
        {
            if (actionContext.Request.Headers.Authorization == null)
            {
                actionContext.Response = actionContext.Request
                    .CreateResponse(HttpStatusCode.Unauthorized);
            }
            else
            {
                string authenticationToken = actionContext.Request.Headers.Authorization.Parameter;
                string decodedAuthenticationToken = Encoding.UTF8.GetString(Convert.FromBase64String(authenticationToken));
                string[] usernamePasswordArray = decodedAuthenticationToken.Split(':');
                string username = usernamePasswordArray[0];
                string password = usernamePasswordArray[1];

                if (EmployeeSecurity.Login(username, password))
                {
                    Thread.CurrentPrincipal = new GenericPrincipal(new GenericIdentity(username), null);
                }
                else
                {
                    actionContext.Response = actionContext.Request.CreateResponse(HttpStatusCode.Unauthorized);
                }
            }
        }
	
	Enable basic authentication
	1. The BasicAuthenticationAttribute can be applied on a specific controller, specific action, or globally on all Web API controllers.
	2. To enable basic authentication across the entire Web API application, register BasicAuthenticationAttribute as a filter using the Register() method in WebApiConfig class
		config.Filters.Add(new RequireHttpsAttribute());
	3. You can also apply the attribute on a specific controller, to enable basic authentication for all the methods in that controller
	4. In our case let's just enable basic authentication for Get() method in EmployeesController. Also modify the implementation of the Get() method as shown below.
18) How do you call Web API with basic authentication using JQuery AJAX? Use the attribute code below when making the AJAX call:
	headers: {
		'Authorization': 'Basic ' + btoa(username + ':' + password)
	}
19) How do you use and customize ASP.NET Identity with Web API?
	__MigrationHistory	The presence of this table tells us that it is using entity framework
	AspNetRoles			Store roles information. We do not have any roles yet so this table is empty
	AspNetUserClaims	We do not have claims, so this table will also be empty
	AspNetUserLogins	This table is for third party authentication providers like Twitter, Facebook. Microsoft etc. Information about those logins will be stored in this table
	AspNetUserRoles		This is a mapping table which tells us which users are in which roles
	AspNetUsers			This table stores the registered users of our application

	The DefaultConnection string in web.config controls the name of the generated database. To change the name of the generated database change the DefaultConnection string in web.config. 
	For example, if you want to name the database - UsersDB, change the DefaultConnection string as shown below
	<add name="DefaultConnection" connectionString="Data Source=(LocalDb)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\UsersDB.mdf;Initial Catalog=UsersDB;Integrated Security=True" providerName="System.Data.SqlClient" />

	Can we create this database in SQL Server? The answer is, YES we can. To create the database in SQL Server, change the DefaultConnection string in web.config to point to your SQL Server. 
	<add name="DefaultConnection" connectionString="Data Source=(local);Initial Catalog=UsersDB;Integrated Security=True" providerName="System.Data.SqlClient" />

	Is it mandatory for the Identity tables to be in a separate database. Can't we have them created in an existing database? Yes you can.
	You can have them created by Identity framework in an existing database by just making your connection string point to your existing database instead of a separate database.
	<add name="DefaultConnection" connectionString="Data Source=(local);Initial Catalog=EmployeeDB;Integrated Security=True" providerName="System.Data.SqlClient" />
20) How do you implement token authentication in Web API? When you scaffold a new Web.API application, you get the token API method. In Fiddler, for example, you can use the POST method to post to 
	http://localhost:34838/token with the request body of username=a@a.com@password=Test123@&grant_type=password. Look at the response, you'll see a JSON response with fields for your access_token, 
	when it expires, when it was issued, the token type, and the userName. All this was provided out of the box by ASP.NET Web.API, see Startup.Auth.cs and it's ConfigureAuth method. Where is the
	code that validates the username/password passed? If you look closely at the ConfigureAuth method, you'll see as part of the OAuthAuthorizationServerOptions a Provider field which is set to 
	an instance of ApplicationOAuthProvider, go to this definition to find the GrantResourceOwnerCredentials method. You can now use this token to try and access an Authorized endpoint. In Fiddler,
	issue a GET request and add to your header an Authorization: Bearer [copy the token out from your post token request]
21) How do you issue a token request with JQuery/AJAX? Don't forget to set contentType and grant_type.
		$.ajax({
			// Post username, password & the grant type to /token
			url: '/token',
			method: 'POST',
			contentType: 'application/json',
			data: {
				username: $('#txtUsername').val(),
				password: $('#txtPassword').val(),
				grant_type: 'password'
			},
			// When the request completes successfully, save the access token in the browser session storage and
			// redirect the user to Data.html page. We do not have this page yet. So please add it to the EmployeeService project before running it
			success: function (response) {
				sessionStorage.setItem("accessToken", response.access_token);
				window.location.href = "Data.html";
			},
			// Display errors if any in the Bootstrap alert <div>
			error: function (jqXHR) {
				$('#divErrorText').text(jqXHR.responseText);
				$('#divError').show('fade');
			}
		});

	Please note: 
	1. sessionStorage data is lost when the browser window is closed.
	2. To store an item in the browser session storage use setItem() method. Example: sessionStorage.setItem("accessToken", response.access_token)
	3. To retrieve an item from the browser session storage use getItem() method. Example: sessionStorage.getItem("accessToken")
	4. To remove an item from the browser session storage use removeItem() method. Example: sessionStorage.removeItem('accessToken')

	Here's the code to use the token in JQuery/AJAX:
	  $.ajax({
            url: '/api/employees',
            method: 'GET',
            headers: {
                'Authorization': 'Bearer ' + sessionStorage.getItem("accessToken")
            },
            success: function (data) {
                $('#divData').removeClass('hidden');
                $('#tblBody').empty();
                $.each(data, function (index, value) {
                    var row = $('<tr><td>' + value.ID + '</td><td>'
                        + value.FirstName + '</td><td>'
                        + value.LastName + '</td><td>'
                        + value.Gender + '</td><td>'
                        + value.Salary + '</td></tr>');
                    $('#tblData').append(row);
                });
            },
            error: function (jQXHR) {
                // If status code is 401, access token expired, so
                // redirect the user to the login page
                if (jQXHR.status == "401") {
                    $('#errorModal').modal('show');
                }
                else {
                    $('#divErrorText').text(jqXHR.responseText);
                    $('#divError').show('fade');
                }
            }
        });
22) How do you get authenticated user identity name in ASP.Net Web API? The response object from the POST token call returns a JSON object with many fields including username. From the Web.API controller method, you can get logged in user
	identity details by using User.Identity or RequestContext.Principal.Identity.
23) What are the benefits of using external social authentication such as Google or Facebook? Registration is simple and easy. All they have to provide is their social login username and password and the user is registered with our application. 
	This also means one less password to remember. When users don’t have to remember mulitple usernames and passwords to login to multiple web sites, there will be less failed logins. As you know remembering multiple usernames and passwords 
	is definitely as hassle. From development point of view, we do not have to write code to manage usernames and passwords. All this is done by the external authentication providers like Google, Facebook, Twitter, Microsoft etc. 
24) How do you implement Google authentication with Web API?
	Step 1 : To register your application go to 
	https://console.developers.google.com
	Step 2 : Login with your GMAIL account. Click on Credentials link on the left, and then create a new project, by clicking on "Create Project" button. 
	Step 3 : Name your project "Test Project" and click "CREATE" button. 
	Step 4 : The new project will be created. Click on "OAuth consent screen". In the "Product name shown to users" textbox type "Test Project" and click "Save" button 
	Step 5 : The changes will be saved and you will be redirected to "Credentials" tab. If you are not redirected automatically, click on the "Credentials" tab and you will see "Create Credentials" dropdown button. Click on the button, 
	and select "OAuth client ID" option 
	Step 6 : On the next screen, 
	Select "Web application" radio button. 
	Type "Web client 1" in the "Name" textbox.
	In the "Authorized JavaScript origins" textbox type in the URI of your application. I have my web api application running at http://localhost:61358
	In the "Authorized redirect URIs" textbox type in the redirect URI i.e the path in our application that users are redirected to after they have authenticated with Google. I have set it to http://localhost:61358/signin-google
	Click the "Create" button, you will see a popup with OAuth client ID and client secret. Make a note of both of them. We will need both of these later. 
	Step 7 : Enable Google+ API service. To do this click on "Library" link on the left hand pane.Under "Social APIs" click on "Google+ API" link and click "Enable" button.

	Enable Google OAuth authentication in ASP.NET Web API service
	Step 1 : In Startup.Auth.cs file in App_Start folder un-comment the following code block, and include ClientId and ClientSecret that we got after registering our application with Google.
	Step 2 : In Login.html page include the following HTML table, just below "Existing User Login" table
	Step 3 : In the script section, in "Login.html" page, wire up the click event handler for "Login with Google" button. 
	Step 4 : Open "ApplicationOAuthProvider.cs" file from "Providers" folder, and modify ValidateClientRedirectUri() method as shown below. The change is to set the Redirect URI to Login.html
	Step 5 : At this point build the solution and navigate to Login.html. Click on "Login with Google" button. Notice we are redirected to "Google" login page. Once we provide our Google credentials and successfully login, we are redirected to 
	our application Login.html page with access token appended to the URL.
	Step 6 : Next we need to retrieve the access token from the URL. The following JavaScript function does this. Add a new JavaScript file to the Scripts folder. Name it GoogleAuthentication.js. Reference jQuery. You can find minified jQuery 
	file in the scripts folder. Copy and and paste the following function in it. Notice we named the function getAccessToken(). 
	Step 7 : Notice the above function calls isUserRegistered() JavaScript function which checks if the user is already registered with our application. isUserRegistered() function is shown below. To check if the user is registered we issue a 
	GET request to /api/Account/UserInfo passing it the access token using Authorization header. If the user is already registered with our application, we store the access token in local storage and redirect the user to our protected page which 
	is Data.html. If the user is not registered, we call a different JavaScript function - signupExternalUser(). We will discuss what signupExternalUser() function does in just a bit. Now copy and paste the following function also 
	in GoogleAuthentication.js file.
	Step 8 : If the Google authenticated user is not already registered with our application, we need to register him. This is done by signupExternalUser() function show below. To register the user with our application we issue 
	a POST request to /api/Account/RegisterExternal, passing it the access token. Once the user is successfully registered, we redirect him again to the same URL, to which the user is redirected when we clicked the "Login with Google" button. 
	Since the user is already authenticated by Google, the access token will be appended to the URL, which will be parsed by getAccessToken() JavaScript function. getAccessToken() function will again call isUserRegistered() function. Since 
	the user is already registered with our application, we redirect him to the Data.html page and he will be able to see the employees data. Copy and paste the following function also in GoogleAuthentication.js file.
	Step 9 : In AccountController.cs, modify RegisterExternal() method as shown below. Notice we removed "RegisterExternalBindingModel" parameter and if (!ModelState.IsValid) code block.
	Step 10 : Finally, on Login.html page reference GoogleAuthentication.js file and call get getAccessToken() function
25) How do you implement Facebook authentication with Web API?
	Due to Facebook making a breaking change to it's API URL, you need to create a FacebookBackChannelIHandler that inherits HttpClientHandler, override the SendAsync method.
	Enable Facebook authentication in Startup.Auth.cs.
		var facebookOptions = new FacebookAuthenticationOptions()
		{
			AppId = "160811734413146",
			AppSecret = "21f2665e0aed11867fcd8d35e67d6068",
			BackchannelHttpHandler = new FacebookBackChannelHandler(),
			UserInformationEndpoint = "https://graph.facebook.com/v2.4/me?fields=id,email"
		};
		facebookOptions.Scope.Add("email");
		app.UseFacebookAuthentication(facebookOptions);
26) How do you use attribute routing in ASP.NET Web API? The framework will get confused if you have two action methods that starts with GetXXXX and has the same arguments. Decorate methods with the [Route("api/students/{id}/courses")] attribute
	config.MapHttpAttributeRoutes() enable attribute routing
27) How do you use route prefix in Web API? Instead of always specifying "api/students" in the Route attribute, decorate the controller with [RoutePrefix("api/students")] now you can remove that string part in your route attributes.
	To override the route prefix, in case you have a GetTeachers method in your Student controller, you need to use the "~" symbol in your route attribute, [Route("~/api/teachers")]
28) How do you use attribute routing constraints? Say you have two methods, Get(int id) and Get(string name), you must use routing constraints else framework will be confused, use [Route("{id:int}")] and [Route("{name:alpha}")].
	Other constraints include min, max, length, minlength, maxlength, and range which take arguments. [Route("{id:int:min(1)}")], [Route("{id:int:min(1):max(3)}")], [Route("{id:int:range(1,3)}")]
29) How do you generate links using route names in Web API? When a client issues an HTTP POST request to create a resource, you should send back a 201 code and set the location header attribute with a link to the newly create resource.
	1. Set a name for the route using the Name property of the [Route] attribute
	[Route("{id:int}", Name = "GetStudentById")]
	public Student Get(int id)
	{
		return students.FirstOrDefault(s => s.Id == id);
	}

	2. Use the name of the route to generate the link 
	public HttpResponseMessage Post(Student student)
	{
		students.Add(student);
		var response = Request.CreateResponse(HttpStatusCode.Created);
		response.Headers.Location = new Uri(Url.Link("GetStudentById", new { id = student.Id }));
		return response;
	}
30) Whats the difference between IHttpActionResult (Web API 2) and HttpResponseMessage (Web API 1)? Using IHttpActionResult, the code is cleaner and easier to read and unit testing controller action methods is much simpler. 
	You get of helper methods: Ok(), Content(), BadRequest(), Conflict(), Created(), InternalServerError(), Redirect(), Unauthorized()

	if (student == null)
	{
		return Request.CreateErrorResponse(HttpStatusCode.NotFound, "Student not found");
	}
	return Request.CreateResponse(student);

	if (student == null)
	{
		return Content(HttpStatusCode.NotFound, "Student not found");
	}
	return Ok(student);
31) Why is versioning required in Web API? Once a Web API service is made public, different client applications start using your Web API services. As the business grows and requirements change, we may have to change 
	the services as well, but the changes to the services should be done in way that does not break any existing client applications. This is when Web API versioning helps. We keep the existing services as is, 
	so we are not breaking the existing client applications, and develop a new version of the service that new client applications can start using.
32) What are the different options available to acheive versioning? 1. URI's, Query String, Version Header, Accept Header, Media Type 
32) Web API versioning using URI. Create StudentV1 and StudentV2 entities, create StudentsV1Controller and StudentsV2Controller controllers. Use convention based routing by updating configuration in WebApiConfig.cs.
	Use attribute routing (prefix optional) in your controllers if you don't wish to use convention based routing.

continue on part 36