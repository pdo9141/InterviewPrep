using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace WebTestApp.TestQuestionsAnswers
{
    public partial class Question03 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string CS = ConfigurationManager.ConnectionStrings["SampleDBCS"].ConnectionString;
            SqlConnection con = new SqlConnection(CS);
            SqlCommand cmd = new SqlCommand("Select * from Employees", con);
            con.Open();
            SqlDataReader rdr = cmd.ExecuteReader();

            DataTable dt = new DataTable();
            dt.Columns.Add("Serial Number");
            dt.Columns.Add("Employee Code");
            dt.Columns.Add("Name");
            dt.Columns.Add("Date Of Joining");
            dt.Columns.Add("Eligible for Gratuity");

            while (rdr.Read())
            {
                DataRow dr = dt.NewRow();
                dr["Serial Number"] = rdr["SerialNumber"];
                dr["Employee Code"] = rdr["EmpCode"];
                dr["Name"] = rdr["Name"];
                dr["Date Of Joining"] = ((DateTime)rdr["DateOfJoining"]).ToShortDateString();
                dr["Eligible for Gratuity"] = IsEligibleForGratuity((DateTime)rdr["DateOfJoining"]);
                dt.Rows.Add(dr);
            }
            con.Close();

            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        private string IsEligibleForGratuity(DateTime dateOfJoining)
        {
            double differenceInDays = (DateTime.Now - dateOfJoining).TotalDays;

            if (differenceInDays >= (365 * 5))
                return "Yes";
            else
                return "No";
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == System.Web.UI.WebControls.DataControlRowType.DataRow)
            {
                DataRowView drv = (DataRowView)e.Row.DataItem;
                int columnIndex = drv.DataView.Table.Columns["Eligible for Gratuity"].Ordinal;
                if (drv[columnIndex].ToString() == "Yes")
                {
                    e.Row.Cells[columnIndex].BackColor = System.Drawing.Color.Yellow;
                }
            }
        }
    }
}