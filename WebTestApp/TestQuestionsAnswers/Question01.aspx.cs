using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace WebTestApp.TestQuestionsAnswers
{
    public partial class Question01 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string USADBCS = ConfigurationManager.ConnectionStrings["USADB"].ConnectionString;
            string UKDBCS = ConfigurationManager.ConnectionStrings["UKDB"].ConnectionString;
            SqlConnection con = new SqlConnection(USADBCS);
            SqlDataAdapter da = new SqlDataAdapter("select * from Employees", con);

            DataSet ds1 = new DataSet();
            da.Fill(ds1);

            con = new SqlConnection(UKDBCS);
            da.SelectCommand.Connection = con;

            DataSet ds2 = new DataSet();
            da.Fill(ds2);

            ds1.Merge(ds2);

            GridView1.DataSource = ds1;
            GridView1.DataBind();
        }
    }
}