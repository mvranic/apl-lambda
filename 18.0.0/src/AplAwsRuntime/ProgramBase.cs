using Amazon.Lambda.Core;
using Amazon.Lambda.RuntimeSupport;
using Amazon.Lambda.Serialization.Json;
using System;
using System.Threading.Tasks;

namespace AplAwsRuntime {
    public class ProgramBase {
        private static async Task MainAsync(Func<string, ILambdaContext, string> functionHandler) {
            using (var handlerWrapper = HandlerWrapper.GetHandlerWrapper(functionHandler, new JsonSerializer()))
            using (var bootstrap = new LambdaBootstrap(handlerWrapper)) {
                await bootstrap.RunAsync();
            }
        }

        public static void Main(Func<string, ILambdaContext, string> functionHandler) {
            Task.Run(() => MainAsync(functionHandler)).Wait();
        }
    }
}
