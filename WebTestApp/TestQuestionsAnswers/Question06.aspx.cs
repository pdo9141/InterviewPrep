using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Text;

namespace WebTestApp.TestQuestionsAnswers
{
    public partial class Question06 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //string strDelimiter = ddlExportFormat.SelectedValue == "COMMA DELIMITED" ? "," : "|";
            string strDelimiter = ",";

            string cs = ConfigurationManager.ConnectionStrings["SampleDBCS"].ConnectionString;
            StringBuilder sb = new StringBuilder();
            using (SqlConnection con = new SqlConnection(cs))
            {
                string strQuery = "SELECT [ID] ,[Name],[Location] FROM [Departments];";
                strQuery += "SELECT [ID],[Name],[DepartmentID] FROM [Employees];";
                SqlDataAdapter da = new SqlDataAdapter(strQuery, con);
                DataSet ds = new DataSet();
                da.Fill(ds);

                ds.Tables[0].TableName = "Departments";
                ds.Tables[1].TableName = "Employees";

                foreach (DataRow depratmentDR in ds.Tables["Departments"].Rows)
                {
                    int departmentId = Convert.ToInt32(depratmentDR["ID"]);
                    sb.Append(departmentId.ToString() + strDelimiter);
                    sb.Append(depratmentDR["Name"].ToString() + strDelimiter);
                    sb.Append(depratmentDR["Location"].ToString());
                    sb.Append("\r\n");
                    foreach (DataRow employeeDR in ds.Tables["Employees"].Select("DepartmentId = '" + departmentId.ToString() + "'"))
                    {
                        sb.Append(employeeDR["ID"].ToString() + strDelimiter);
                        sb.Append(employeeDR["Name"].ToString() + strDelimiter);
                        sb.Append(departmentId.ToString());
                        sb.Append("\r\n");
                    }
                }
            }

            string strFileName = strDelimiter == "," ? "Data.csv" : "Data.txt";

            StreamWriter file = new StreamWriter(@"C:\ExportedData\" + strFileName);
            file.WriteLine(sb.ToString());
            file.Close();
        }
    }
}