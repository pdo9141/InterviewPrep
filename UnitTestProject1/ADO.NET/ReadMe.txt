01) What's the difference between DataSet and DataReader?
	DataSet is disconnected, records filled in memory, even if SQL connection is closed you can still access data 
	DataReader is connected, if SQL connection is closed you cannot access data
02) What's the difference between DataSet and DataTable?
	Data Table is an in-memory representation of a single database table which has collection of rows and columns.
	DataTable fetches only one TableRow at a time 
	DataSet is an in-memory representation of a database-like structure which has collection of DataTables. 
	DataSet can fetch multiple TableRows at a time (collection of DataTable objects), think multiple select statements in SP equals one DT each in DS