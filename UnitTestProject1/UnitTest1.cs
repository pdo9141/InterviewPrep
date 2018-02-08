using System;
using System.Diagnostics;
using System.IO;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace UnitTestProject1
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void Matrix_Transpose_Test()
        {
            int[,] matrix = new int[4,4]
            {
                { 1, 2, 3, 4},
                { 5, 6, 7, 8},
                { 9, 10, 11, 12},
                { 13, 14, 15, 16}
            };

            PrintMatrix(matrix);
            Console.WriteLine("");
            // matrix = TransposeMatrix(matrix);
            TransposeMatrixBetter(matrix);
            PrintMatrix(matrix);
        }

        private void TransposeMatrixBetter(int[,] matrix)
        {
            int rows = matrix.GetLength(0);
            int cols = matrix.GetLength(1);

            for (int y = 0; y < rows; y++)
            {
                for (int x = y + 1; x < cols; x++)
                {
                    int temp = matrix[y, x];
                    matrix[y, x] = matrix[x, y];
                    matrix[x, y] = temp;
                }
            }
        }

        private int[,] TransposeMatrix(int[,] matrix)
        {
            int rows = matrix.GetLength(0);
            int cols = matrix.GetLength(1);
            int[,] result = new int[cols, rows];

            for (int y = 0; y < cols; y++)
            {
                for (int x = 0; x < rows; x++)
                {
                    result[y, x] = matrix[x, y];
                }
            }

            return result;
        }

        private void PrintMatrix(int[,] matrix)
        {
            int rows = matrix.GetLength(0);
            int cols = matrix.GetLength(1);

            for (int y = 0; y < rows; y++)
            {
                for (int x = 0; x < cols; x++)
                {
                    Console.Write(matrix[y,x] + "\t");
                }
                Console.WriteLine("");
            }
        }

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
