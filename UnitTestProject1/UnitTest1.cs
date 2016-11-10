using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace UnitTestProject1
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void Anonymous_Type_Test()
        {
            string name = "Phi Hung Do";
            var result = Cast(ParseData(name), new { FirstName = "", MiddleName = "", LastName = "" });            
            var firstName = result.FirstName;
            var middleName = result.MiddleName;
            var lastName = result.LastName;
        }

        public static object ParseData(string strData)
        {
            var arrayData = strData.Split(' ');
            return new { FirstName = arrayData[0], MiddleName = arrayData[1], LastName = arrayData[2] };
        }

        public T Cast<T>(object obj, T type)
        {
            return (T)obj;
        }
    }
}
