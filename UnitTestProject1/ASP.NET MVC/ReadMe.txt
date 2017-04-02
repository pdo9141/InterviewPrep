https://www.youtube.com/watch?v=-pzwRwYlXMw&list=PL6n9fhu94yhVm6S8I2xd6nYz2ZORd7X2v

01) You can return pretty much anything from a Controller, string, ActionResult, JSON, byte[]
02) The ignore line for .axd in the routing file is used to ignore trace files, etc. You can view trace.axd in browser (pageoutput = false in web.config trace)
03) The bad thing about ViewBag and ViewData is that they do not provide compile time error checking. When you use ViewData you access data
	by using a key (e.g., ViewData["Countries"]), you need to cast back to known type in View. It's better practice to use strongly typed ViewModels
04) When you add a DBContext class, whatever you name the class will be used to try and match connection string name in web.config (e.g., EmployeeContext)
05) Use the table attribute in DataAnnotations if your model and DB table name do not match
06) In Global.asax.cs/Application_Start, add Database.SetInitializer<YourDBContextClass>(null), needed to init your DB if not already created
07) To generate a hyperlink, use the helper @Html.ActionLink([text to display], [controller to invoke], [route values, use anonymous object])
	Be wary, you might need to pass null for html attributes if you're using overload to pass controller name and action as well
08) To create an insert view, create an action method of Create with [HttpGet] and Create with [HttpPost]. When you scaffold using create template and concrete class, you get the validation summary, client
	side jquery, HTML helpers editorfor, validationmessagefor, etc. Use @Html.DropDownList to swamp out text fields for desired dropdown types. On the [HttpPost] Create method, you can use the FormCollection
	as an argument and harvest the form fields posted. Once done inserting business object, use the RedirectToAction method to navigate back to index view
09) You can also use individual arguments for the form fields (e.g., string name, string gender, string city, etc. this is one form of model binding, order doesn't matter, names have to match) instead of FormCollection. 
	Neither is best practice, you want to leverage model binding to bind to your business model (Employee) as argument. If you want, you can not pass an Employee object as an argument at all. You can new up an Employee
	object and use the UpdateModel(employee) method. If you have two argumentless Create methods though, you'll get a compilation error unless you rename your action methods and use the [ActionName("Create")] attribute 
10) Check the ModelState.IsValid property before inserting persisting business model. 
11) If you get intermittent error stating adding the specified count to the semaphore would cause it to exceed its maximum count, you can restart IIS or disable connection pooling in connection string in web.config
12) The difference between UpdateModel and TryUpdateModel is that UpdateModel throws an exception when there are binding errors, TryUpdateModel does not. You probably never want to use UpdateModel but
	why would you use TryUpdateModel vs just specifying the model as an a parameter? You might want to use the overloads (include or exclude) of the TryUpdateModel and UpdateModel methods to explicitly bind only certain model properties.
	You do this when you don't want the user posting values you don't want changed or if you want to hack using Fiddler. You can also use the bind attribute on the model parameter to do this as well.
13) Use System.ComponentModel.DataAnnotations namespace and ModelState.IsValid on your model entities for form data validation
14) Use the @Html.DisplayFor helper for readonly fields. If the field is annotated with required you will need to use the @Html.HiddenFor helper to post value across to circumvent validation error. This will not be enough
	though, you can easily hack this with Fiddler by dragging the valid POST request into Composer and modifying the readonly field in the request body. Use the overloads (include or exclude) for UpdateModel and TryUpdateModel to pass in the
	model names you want to explicitly bind. You can also use the bind attribute on the model parameter to do this as well.
15) You can also use the Bind attribute on the argument object, bind can take both include and exclude list. Ensure that you go and retrieve the original object and set the object fields you didn't pull in.
	Note that when you call ModelState.IsValid that it'll not pass even after you set a required field using the original model's data. Probably better to use a custom ViewModel though.
	Some folks prefer to just pass the ID as action argument, retrieve model from ID, take all the fields they want to auto-bind into an interface and then call UpdateModel<IEmployee>(employee), 
	this preserves the Name field from retrieval and only binds interface fields, if Name is pass in form it will not matter
16) Using GET method to delete records is bad because it opens a security hole and is not recommended by Microsoft. Just imagine what can happen if there is an image tag in a malicious email as shown below. 
	The moment we open the email, the image tries to load and issues a GET request, which would delete the data. Also, when search engines index your page, they issue a GET request which would delete the data. 
	In general GET request should be free of any side-effects, meaning it should not change the state. Deletes should always be performed using a POST request in MVC and DELETE method in RESTFul WEB.API
17) Use the @Html.BeginForm HTML helper while traversing your IEnumerable models to build form post for delete
18) If you want to change the @Html.DisplayNameFor name (name of object property, most likely DB column name in generated classes from EF) for auto generated EF classes, create another partial class
	and use the [MetadataType(typeof(DepartmentMetaData))] in the System.ComponentModel.DataAnnotations namespace. In your DepartmentMetaData class, you can specify other annotations such as required as well.
	Use the [Display(Name = "Department")] to change the error messaging and column names
19) You can dynamcially add model validation error by using ModelState.AddModelError("Name", "The Name field is required.")
20) Consider using custom ViewModels (DTOs essentially) for views not explicitly binded to a real model
21) You can mix Razor and ASPX view engine pages in the same application if you want to but this is bad practice of course. Use the View(string viewName, object model) overload in controller to use ASPX view
22) There's really not much of a difference between Razor and ASPX view engine code, just syntax really. Spark, NHaml, SharpDOM, and Brail (Nuget packages) are some third party MVC view engines.
23) In the HTML helpers, if you try to add attributes such as HTML class to your form element and the keyword is C# reserved such has class, use the @ symbol to circumvent it, new @Html.TextBox("firstname", "John", new { title = "First Name Field", @class = "employeeFirstName", @readonly = "true" })
	HTML helpers include @Html.TextBox, @Html.Label, @Html.Password, @Html.TextArea, @Html.Hidden
24) To load dropdowns with DB data store your data in ViewBag and SelectList, for example, ViewBag.Departments = new SelectList(dbContext.Departments, "Id", "Name"), in view you'll code @Html.DropDownList("Departments", "-- Select Department --") 
	To set selected item add DB column IsSelected BIT, load EF departments, traverse departments and build SelectListItem setting Selected property from IsSelected DB column  
25) The difference between @Html.TextBox (used with hardcode and ViewBag values) and @Html.TextBoxFor (strongly typed to model)? Html.TextBox amd Html.DropDownList are not strongly typed and hence they doesn't require a strongly typed view. This means that we can hardcode whatever name we want. On the other hand, 
	Html.TextBoxFor and Html.DropDownListFor are strongly typed and requires a strongly typed view, and the name is inferred from the lambda expression. Strongly typed HTML helpers also provide compile time checking. Since, in real time, we mostly use strongly typed views, 
	prefer to use Html.TextBoxFor and Html.DropDownListFor over their counterparts. Whether, we use Html.TextBox & Html.DropDownList OR Html.TextBoxFor & Html.DropDownListFor, the end result is the same, that is they produce the same HTML.
26) To create radio buttons for the departments, use @using (Html.BeginForm()), then traverse each department in Model.Departments and build radio using @Html.RadioButtonFor helper
27) When working with checkboxes, you can create views and stuff them into an EditorTemplates directory, name the view files (cshtml) the same as your model (e.g., City.cshtml). In your editor view, you can use the @Html.CheckboxFor and @Html.DisplayFor helpers.
	In your index view, you can use the @Html.EditorForModel()
28) When working with @Html.ListBoxFor(x => x.SelectedCities, Model.Cities) consider using a custom ViewModel with two fields, IEnumerable<SelectListItem> for Cities display and IEnumerable<string> for SelectedCities 
29) DisplayAttribute, Display, and DisplayName are accomplish the same thing. You can use the DisplayFormat attribute to format dates, you can also use the NullDisplayText property of DisplayFormat to display custom text for null values
	You can use the ScaffoldColumn(false) attribute to hide a column but this will only work when you use the @Html.DisplayForModel() helper, you usually don't want to use this helper because you want more control over HTML display.
	You an use the DisplayColumn("") with @Html.DisplayTextFor to display one field for a complex type, used with single entity and entity with object graphs
	You can use the DataType(DataType.EmailAddress, DataType.Currency (specify culture in web.config), DataType.Url, DataType.Email, DataType.Date, DateType.Time) for more formatted display
	When using DataType.Url, if you want the href to include target="blank" create a DisplayTemplates folder, and add Url.cshtml. If you only want it on certain URL fields to open in new window create a new view, e.g., OpenInNewWindow.cshtml and use the UIHint("OpenInNewWindow") attribute
	HiddenInput and ReadOnly attributes are also useful
	Use the templated helpers @Html.Display (view not strongly typed, ViewData), @Html.DisplayFor (use with strongly type models that return object graphs), @Html.DisplayForModel to help with display, walks the metadata for your object
	Use the templated helpers @Html.Editor (view not strongly typed, ViewData), @Html.EditorFor (use with strongly type models that return object graphs), @Html.EditorForModel to help with display, walks the metadata for your object
30) Create DisplayTemplates or EditorTemplates in shared or dedicated folders to customize display of @Html.DisplayForModel and @Html.EditorForModel helpers. You can for example, attach a JQuery calendar picker to DateTime? fields by creating DateTime.cshtml in these folders
	For DateTime values, you can read metadata format of value in model by leveraging DisplayFormat(DataFormatString) attribute with ApplyFormatInEditMode=true, in .cshtml file, use @ViewData.TemplateInfo.FormattedModelValue
31) To view metadata of the model in your custom template helper .cshtml files, leverage @ViewData.ModelMetadata
32) To display images in MVC, leverage the Url.Content helper, <img src="@Url.Content(@Model.Photo)" alt="@Model.AlternateText" />, alternatively, you can create your own custom image helper by creating an extension method to HtmlHelper class
	1. Create a static method in a static class
	2. The first parameter has to be the type to which we are adding the extension method
	3. Return type should be IHtmlString, as these strings are excluded from html encoding
	4. To help, creation of HTML tags, use TagBuilder class
	5. Include the namespace of the helper method in either the view or web.config
33) All MVC output is HTML encoded by default, this is to avoid cross site scripting attacks. To avoid HTML encoding in Razor, you can return IHTML strings or use the HTML.Raw() helper
34) You can enable compile time error checking in views by editing the .csproj file and setting the MvcBuildViews node value to true
35) What is the advantage of using strongly typed models? You get intellisense and compile time error checking (you get red underline squigglies and if you've edit .csproj MvcBuildViews you'll get build error)
36) Partial views are similar to user controls in web forms. You use the @Html.Partial("_Employee", yourModelInstance) helper in your views to use the partial component. Partial views can be located in shared or specific views folder. 
	Name the partials with underscore, create as partial view in window prompt. Note, remember to use @Model in your partial view code to refer to yourModelInstance you passed into the @Html.Partial helper in your view.
	You can also use { Html.RenderPartial("_Employee", yourModelInstance); } instead of @Html.Partial("_Employee", yourModelInstance) instead, Html.RenderPartial is better for performance.
37) What's the difference between Html.RenderPartial and Html.Partial? The main difference is that "RenderPartial()" returns void and the output will be written directly to the output stream, whereas the "Partial()" method returns MvcHtmlString, 
	which can be assigned to a variable and manipulated if required. So, when there is a need to assign the output to a variable for manipulating it, then use Partial(), else use RenderPartial(). From a performance perspective, 
	rendering directly to the output stream is better. RenderPartial() does exactly the same thing and is better for performance over Partial().
38) What are T4 templates? T4 stands for Text Template Transformation Toolkit and are used by visual studio to generate code when you add a view or a controller. When you add a view, the scaffold options (Create, Delete, Edit, List) are the T4 templates.
	You can add your own by going into C:\Program Files (x86)\Microsoft Visual Studio 10.0\Common7\IDE\ItemTemplates\[CSharp | FSharp | VisualBasic]\Web\[MVC 2 | MVC 3 | MVC 4]\CodeTemplates
39) How do you allow HTML to be posted into MVC action method? This will circumvent built in XSS (cross site scripting) protection. Use the [ValidateInput(false)] attribute
40) How do you prevent XSS attacks but still allow your whitelist?
	1. Disable input validation (ValidateInput attribute)
	2. Encodes all the input that is coming from the user (You want to use StringBuilder here for performance reasons)
	3. Finally we selectively replace, the encoded html with the HTML elements that we want to allow. (use Replace method on StringBuilder for your whitelist tags, <b>, <u>, etc.)
41) Use the @ symbol to switch between c# and HTML (sometimes you have to use paranthesis with @ symbol to clearly demarcate your C# code). What if you what the @ literal to display (no need in email addresses, MVC smart enough to know)? You can use @@ or try <text> or @: 
42) Use @{} to define C# code block.
43) For comments, use @* this is a comment *@
44) How do you centralize specification of layout for all views? Use the _ViewStart.cshtml file. You can place in shared or view specific folder.
	You can write some logic in _ViewStart.cshtml to dynamically specify which layout to use (e.g., Request.Browser.IsBrowser("Chrome") ? "_ChromeLayout" : "_OtherLayout")
	You can also specify layout file in a controller action method (return View("Create", "_Layout")) or in an action filter.
	Modify your action method to return PartialView("_Employee", employee) which returns PartialViewResult in action method signature to avoid using layout specified in _ViewStart.cshtml


continue on part 61