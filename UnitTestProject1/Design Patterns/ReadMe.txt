01) How do you implement the MVP pattern in the context of ASP.NET Web Forms?
	Have your view (code behind or main or control) class inherit an interface that itself inherits an empty interface. E.g., IBorrowerMismatch inherits IView (optional). 
	In your IBorrowerMismatch create fields you will use in your view such as collections or event handlers. Your view code will now how to implement these fields. In your view, 
	you must now new up an instance of your presenter class, you can do this on the page load method. After you new up the presenter class, immediately set the presenter's field 
	that holds the IBorrowerMismatch. The presenter should have a property to set it's IBorrowerMismatch reference, usually name View, in the set method of this property, attach the
	events in the view to methods in the presenter, for example:
		view.SearchBorrowerMismatches += OnSearchBorrowerMismatches;
		view.ApproveBorrowerMismatches += OnApproveBorrowerMismatches; 		
		view.CancelBorrowerMismatches += OnCancelBorrowerMismatches; 
	When your view needs handle a search, approve, or cancel operation, it delegates the execution to the presenter (OnSearchBorrowerMismatches, OnApproveBorrowerMismatches, OnCancelBorrowerMismatches).
	If an operation expects data returned, such as SearchBorrowerMismatches, the OnSearchBorrowerMismatches method should set this data on the view once it has it, that's why the presenter has a
	reference to the view. E.g., view.BorrowerMismatches = DB call to get borrower mismatches	
	If the view needs to give the presenter data on an operation, create xxxEventArgs classes and pass it along when calling SearchBorrowerMismatches/OnSearchBorrowerMismatches
	All the heavy lifting should be done in the presenter. The presenter should not have any references to UI code such as ASP.NET or Telerik controls. 		
02) How do you implement the mediator pattern in WPF?

		 
