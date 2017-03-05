using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace WebTestApp.TestQuestionsAnswers
{
    public partial class Question02 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DropDownList1.DataTextField = "TABLE_NAME";
                DropDownList1.DataValueField = "TABLE_NAME";
                DropDownList1.DataSource = GetAllTables();
                DropDownList1.DataBind();
                DropDownList1.Items.Insert(0, new ListItem("Select Table", "-1"));
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedValue != "-1")
            {
                GridView1.DataSource = GetTableMetadata(DropDownList1.SelectedValue);
                GridView1.DataBind();
            }
        }

        private DataTable GetAllTables()
        {
            string CS = ConfigurationManager.ConnectionStrings["SampleDBCS"].ConnectionString;
            SqlConnection con = new SqlConnection(CS);
            SqlDataAdapter da = new SqlDataAdapter("spGetAllTables", con);
            DataTable dataTable = new DataTable();
            da.Fill(dataTable);

            return dataTable;
        }

        private DataTable GetTableMetadata(string tableName)
        {
            string CS = ConfigurationManager.ConnectionStrings["SampleDBCS"].ConnectionString;
            SqlConnection con = new SqlConnection(CS);
            SqlDataAdapter da = new SqlDataAdapter("spGetTableMetadata", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@TableName", tableName));
            DataTable dataTable = new DataTable();
            da.Fill(dataTable);

            return dataTable;
        }
    }
}