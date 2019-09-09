# APL interpreter runtime for AWS lambda

**Note: Dyalog APL interpreter license**
```
   Dyalog interpreter used in this project part of Dyalog docker image   dyalog/dyalog on Linux and
   THAT IS NON COMMERCIAL VERSION OF DYALOG INTERPRETER.
   Please, check the Dyalog APL interpreter license with Dyalog ltd at http://wwww.dyalog.com
```

In example the Dyalog binaries are at: ```./dyalog/opt/mdyalog```
The files can be extracted as describe at [How to get Dyalog Linux binaries from Dyalog image](./GetDyalog.md) . Dyalog will make general available NON COMMERCIAL version of interpreter.

# How to use APL lambda

Save as `aplHandler.apl`:

```apl
  res←aplHandler arg;event;context;deadline
  event context←arg
  ⎕←'Hi from APL (handler) on AWS Lambda!'
  deadline←⍎⊃context.deadlineMs
  myFn ⍝ Call to another function from MyLib.dws
  ⎕←'There is '(#.AplLambdaNsName.getRemainingTimeInMillis deadline ⎕TS)' ms remaining.'
  res←event
```

Save as index.package.json:
```json
  {
    "DyalogFiles" : ["AplHandler.aplf"],
    "DwsFiles" : []
  }
```
This is package information as in AWS lambda placing of files must be defined explicitly.

Then bundle up into a zipfile – this is your function bundle:

```sh
  zip -yr lambda.zip aplHandler.dyalog index.package.json 
```

There can be also DWS files with library to zip file.

The code for example could found in ./17.1.0/test folder.

Add layer to AWS Lambda:

![Create lambda layer](https://github.com/mvranic/apl-lambda/blob/master/img/create_layer.png "Create lambda layer screenshot")

Result will be:

![Lambda layer](https://github.com/mvranic/apl-lambda/blob/master/img/layer.png "APL lambda layer screenshot")

Create a new Lambda function and choose the custom runtime option.

![Create lambda](https://github.com/mvranic/apl-lambda/blob/master/img/create.png "Create lambda screenshot")

Select your `index.zip` as the "Function code" and change the handler form "index.handler" to "index.aplHandler".

![Function code](https://github.com/mvranic/apl-lambda/blob/master/img/function_code.png "Function code setup screenshot")

Then click on Layers and choose "Add a layer", and "Provide a layer version ARN" and enter the following ARN:

```
arn:aws:lambda:us-east-2:882298957436:layer:Dyalog_APL_17_0:1
```

![Add layer to function](https://github.com/mvranic/apl-lambda/blob/master/img/add_function_layer.png "Function add layer setup screenshot")

Then save your lambda and test it with a test event! 

![Test event output](https://github.com/mvranic/apl-lambda/blob/master/img/log.png "Test event output screenshot")

## Current Version ARNs

| Version | ARN | Description |
| --- | --- | --- |
| 1 | `arn:aws:lambda:us-east-2:882298957436:layer:Dyalog_APL_17_0:1` | 	Dyalog APL runtime | 
| | |  |

# Create Dyalog APL AWS lambda layer
## Build APL code DWS code
In order to build APL code to dws file 
[How to get Dyalog Linux binaries from Dyalog image](./build-apllambda.md)

## Build layer.zip
To build layer.zip use *build.sh*

## To test layer local
To test use *test.sh*

# Known issues
The event body should be esaped:
'{\"name\":\"vale\"}'

# See
1. Dyalog APL interpret home <http://www.dyalog.com>
2. AWS Lambda Custom runtime <https://docs.aws.amazon.com/lambda/latest/dg/runtimes-custom.html>
3. Some custom runtime <https://github.com/mthenw/awesome-layers>
4. <https://github.com/lambci/docker-lambda>
5. <https://github.com/lambci/node-custom-lambda>

