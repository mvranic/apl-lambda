using Amazon.Lambda.Core;
using Amazon.Lambda.RuntimeSupport;
using Amazon.Lambda.Serialization.Json;
using AplAwsRuntime;
using System;
using System.Diagnostics;
using System.Threading.Tasks;

namespace AplFunction
{
    public class Function {
        /// <summary>
        /// The main entry point for the custom runtime.
        /// </summary>
        /// <param name="args"></param>
        private static async Task Main(string[] args) {

            Task.Run(() => {
                Console.WriteLine("Start process");
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

                Console.WriteLine("Stop process");
                process.Start();
        //    }).Wait();


         //   Task.Run(() =>{
                Console.WriteLine("Start AplHandler");
                var aplHandler = new AplHandler();
                ProgramBase.Main(aplHandler.GetFunc("FunctionHandler"));
                Console.WriteLine("End AplHandler");
            }).Wait();
            
    }
    }
}
