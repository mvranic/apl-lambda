using Amazon.Lambda.Core;
using Amazon.Lambda.RuntimeSupport;
using Amazon.Lambda.Serialization.Json;
using AplAwsRuntime;
using System;
using System.Diagnostics;
using System.Threading.Tasks;

namespace CSharpFunction
{
    public class Function {
        /// <summary>
        /// The main entry point for the custom runtime.
        /// </summary>
        /// <param name="args"></param>
        private static async Task Main(string[] args) {
            Task.Run(() =>{
                var aplHandler = new AplHandler();
                ProgramBase.Main(aplHandler.GetFunc("FunctionHandler"));  
            }).Wait();

            /*
var process = new Process();
process.StartInfo.CreateNoWindow = true;
process.StartInfo.UseShellExecute = false;
process.StartInfo.FileName = "ls";
process.StartInfo.RedirectStandardOutput = true;
process.OutputDataReceived += (sender, data) => {
Console.WriteLine(data.Data);
};

process.StartInfo.RedirectStandardError = true;
process.ErrorDataReceived += (sender, data) => {
Console.WriteLine(data.Data);
};

process.StartInfo.Arguments = "-la";

process.Start();
*/
            
    }
    }
}
