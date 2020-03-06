using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

using Xunit;
using Amazon.Lambda.Core;
using Amazon.Lambda.TestUtilities;

using CSharpFunction;

namespace CSharpFunction.Tests
{
    public class FunctionTest
    {
        [Fact]
        public void TestToUpperFunction()
        {
            // Invoke the lambda function and confirm the string was upper cased.
            var context = new TestLambdaContext();
            var aplHandler = new AplHandler();
            var handler = aplHandler.GetFunc("FunctionHandler");

            var upperCase = handler("hello world", context);

            Assert.Equal("HELLO WORLD", upperCase);
        }
    }
}
