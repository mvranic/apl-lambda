using Amazon.Lambda.Core;
using AplAwsRuntime;
using System;
using System.Collections.Generic;
using System.Text;

namespace AplFunction {
    public class AplHandler : AplHandlerBase {
        
        public AplHandler() { }

        /// <summary>
        /// A simple function that takes a string and does a ToUpper
        ///
        /// To use this handler to respond to an AWS event, reference the appropriate package from 
        /// https://github.com/aws/aws-lambda-dotnet#events
        /// and change the string input parameter to the desired event type.
        /// </summary>
        /// <param name="input"></param>
        /// <param name="context"></param>
        /// <returns></returns>
        public string FunctionHandler(string input, ILambdaContext context) {
            Console.WriteLine($"Input {input}");
            input = input?.ToUpper();
            Console.WriteLine($"Output {input}");
            return input;
        }
    }
}
