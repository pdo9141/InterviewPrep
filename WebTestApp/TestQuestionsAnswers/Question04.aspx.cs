using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebTestApp.TestQuestionsAnswers
{
    public partial class Question04 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int?[] numbers = { 2, 3, 7, 1, 1000, 222 };
            int? largestEvenNumber = numbers.Where(n => n % 2 == 0).Max();
            int? smallestOddNumber = numbers.Where(n => n % 2 != 0).Min();

            /*
            foreach (int i in numbers)
            {
                if (i % 2 == 0)
                {
                    if (!largestEvenNumber.HasValue || i > largestEvenNumber)
                    {
                        largestEvenNumber = i;
                    }
                }
                else
                {
                    if (!smallestOddNumber.HasValue || i < smallestOddNumber)
                    {
                        smallestOddNumber = i;
                    }
                }
            }
            */

            ltrEven.Text = largestEvenNumber.Value.ToString();
            ltrOdd.Text = smallestOddNumber.Value.ToString();
        }
    }
}