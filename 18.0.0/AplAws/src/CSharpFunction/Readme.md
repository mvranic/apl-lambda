# AWS Lambda Custom Runtime Function Project

This starter project consists of:
* Function.cs - contains a class with a Main method that starts the bootstrap, and a single function handler method
* aws-lambda-tools-defaults.json - default argument settings for use with Visual Studio and command line deployment tools for AWS
* bootstrap - a Linux bash script that is invoked by the AWS Lambda infrastructure to start the function

You may also have a test project depending on the options selected.

The generated Main method is the entry point for the function's process.  The main method wraps the function handler in a wrapper that the bootstrap can work with.  Then it instantiates the bootstrap and sets it up to call the function handler each time the AWS Lambda function is invoked.  After the set up the bootstrap is started.

The generated function handler is a simple method accepting a string argument that returns the uppercase equivalent of the input string. Replace the body of this method, and parameters, to suit your needs. 

## Here are some steps to follow from Visual Studio:

(Deploying and invoking custom runtime functions is not yet available in Visual Studio)

## Here are some steps to follow to get started from the command line:

Once you have edited your template and code you can deploy your application using the [Amazon.Lambda.Tools Global Tool](https://github.com/aws/aws-extensions-for-dotnet-cli#aws-lambda-amazonlambdatools) from the command line.  Version 3.1.4
or later is required to deploy this project.

Install Amazon.Lambda.Tools Global Tools if not already installed.
```
    dotnet tool install -g Amazon.Lambda.Tools
```

If already installed check if new version is available.
```
    dotnet tool update -g Amazon.Lambda.Tools
```

Execute unit tests
```
    cd "AplAws/test/CSharpFunction.Tests"
    dotnet test
```

Deploy function to AWS Lambda
```
    cd "AplAws/src/CSharpFunction"
    dotnet lambda deploy-function MyUpperCSharp --function-role lambda-s3-role
```
Where **lambda-s3-role** is role which autorise Lambda execution and S3 access. See AWS documentions about roles. 

To invoke function from AWS Lambda

```
dotnet lambda invoke-function MyUpperCSharp --payload "Just Checking If Everything is OK"
```

results as

```
Amazon Lambda Tools for .NET Core applications (3.3.1)
Project Home: https://github.com/aws/aws-extensions-for-dotnet-cli, https://github.com/aws/aws-lambda-dotnet

Payload:
"JUST CHECKING IF EVERYTHING IS OK"

Log Tail:
START RequestId: dd59facc-3ada-48eb-8f53-3525d7b2bd79 Version: $LATEST
Input Just Checking If Everything is OK
Output JUST CHECKING IF EVERYTHING IS OK
END RequestId: dd59facc-3ada-48eb-8f53-3525d7b2bd79
REPORT RequestId: dd59facc-3ada-48eb-8f53-3525d7b2bd79  Duration: 1409.39 ms    Billed Duration: 1900 ms        Memory Size: 256 MB     Max Memory Used: 92 MB  Init Duration: 439.25 ms
```

## Improve Cold Start

.NET Core 3.0 has a new feature called ReadyToRun. When you compile your .NET Core 3.0 application you can enable ReadyToRun 
to prejit the .NET assemblies. This saves the .NET Core runtime from doing a lot of work during startup converting the 
assemblies to a native format. ReadyToRun must be used on the same platform as the platform that will run the .NET application. In Lambda's case
that means you have to build the Lambda package bundle in a Linux environment. To enable ReadyToRun edit the aws-lambda-tools-defaults.json
file to add /p:PublishReadyToRun=true to the msbuild-parameters parameter.

## See
* <https