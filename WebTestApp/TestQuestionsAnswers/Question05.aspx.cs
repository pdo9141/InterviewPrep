using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebTestApp.TestQuestionsAnswers
{
    public partial class Question05 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string strInput = "";
            int result = 0;

            bool parseResult = int.TryParse(strInput, out result);
        }
    }
}