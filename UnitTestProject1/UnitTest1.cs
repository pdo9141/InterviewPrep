using System;
using System.IO;
using System.Linq;
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

        [TestMethod]
        public void ProveSingleInstanceOfStaticClass_Test()
        {
            // We have inovked the method twice but the constructor will fire once
            MyStaticClass.SomeMethod();
            MyStaticClass.iCount++;
            MyStaticClass.iCount++;
            MyStaticClass.SomeMethod();
        }

        public static class MyStaticClass
        {
            public static int iCount;

            // If only one instance of the object is created then this constructor should run only once.
            static MyStaticClass()
            {
            }

            public static void SomeMethod()
            {
            }
        }

        [TestMethod]
        public void RecursionFindFilesExample_Test()
        {
            FindFiles(@"C:\temp\OdeToFood");
        }

        private static void FindFiles(string path)
        {
            foreach (string fileName in Directory.GetFiles(path))
            {
                Console.WriteLine(fileName);
            }

            foreach (string directory in Directory.GetDirectories(path))
            {
                // Notice that FindFiles() is calling itself
                FindFiles(directory);
            }
        }

        [TestMethod]
        public void ReverseEachWordInString_Test()
        {
            var inputString = "one two three four five";
            string resultString = string.Join(" ", inputString
                .Split(' ')
                .Select(x => new String(x.Reverse().ToArray())));

            Console.WriteLine(resultString);
        }
    }
}
