# APL interpreter runtime for AWS lambda

**Note: Dyalog APL interpreter license**
```
   Dyalog interpreter used in this project part of Dyalog docker image  dyalog/dyalog on Linux and
   THAT IS NON COMMERCIAL VERSION OF DYALOG INTERPRETER.
   Please, check the Dyalog APL interpreter license with Dyalog ltd at http://wwww.dyalog.com
```

In example the Dyalog binaries are at: ```./dyalog/opt/mdyalog```
The files can be extracted as describe at [How to get Dyalog Linux binaries from Dyalog image](./GetDyalog.md) . Dyalog will make general available NON COMMERCIAL version of interpreter.

# How to use APL lambda
## Develop your APL code on desktop

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

The code for example could found in ./18.0.0/test folder.

## Lets go to Cloud
You should have account on Amazon AWS cloud at <https://aws.amazon.com/> .

Open the [Lambda console](https://console.aws.amazon.com/lambda) .

Within this project is provided Lambda layer at ./17.1.0/layer.zip . It includes APL interpreter too. This layer might be used in next step.

Add layer to AWS Lambda:

![Create lambda layer](https://github.com/mvranic/apl-lambda/blob/master/img/create_layer.png "Create lambda layer screenshot")

Result will be:

![Lambda layer](https://github.com/mvranic/apl-lambda/blob/master/img/layer.png "APL lambda layer screenshot")

Create a new Lambda function and choose the custom runtime option.

![Create lambda](https://github.com/mvranic/apl-lambda/blob/master/img/create.png "Create lambda screenshot")

**Do not forget:** Select your `index.zip` as the "Function code" and change the handler form "index.handler" to **"index.aplHandler"**.

![Function code](https://github.com/mvranic/apl-lambda/blob/master/img/function_code.png "Function code setup screenshot")

Then click on Layers and choose "Add a layer", and "Provide a layer version ARN" and enter the following ARN:

```
arn:aws:lambda:us-east-2:882298957436:layer:Dyalog_APL_17_0:1
```

![Add layer to function](https://github.com/mvranic/apl-lambda/blob/master/img/add_function_layer.png "Function add layer setup screenshot")

Then save your lambda (press Save button) and test it with a test event! 

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

# Error message

On error JSON error message is created:

```json
{
  "errorType": "6",
  "errorMessage": " VALUE ERROR\\n aplHandler[7] aæa\u0026∇ ⍺ ⍵⌶⌸⌸⍠⎕⍞⍤.⍨⍉⌽⍴⍴⍀∪∊⍒⍋æsæd\\n                                          ∧\\n
Undefined name: æsæd",
  "stackTrace": [
    "#.AplLambdaNsName.lambdaexec2019916212526435198.aplHandler[7]",
    "#.AplLambdaNsName.callHandler[26]",
    "#.AplLambdaNsName.processEvents[47]",
    "#.AplLambdaNsName.start[3]",
    "#.AplLambdaNsName.aplLambdaBootstrap[57]",
    "#.loadAplLambda[6]"
  ]
} 
```

To decode UTF-8 value error message can be used:
```apl
  'UTF-8' ⎕UCS  ⎕UCS errorMessage
```

# Unicode encode and decode the data
The layer implements encode and decode of data as:

*encode to ANSI*
```apl
   ⎕UCS 'UTF-8' ⎕UCS errorMessage
```

*decode to UTF-8*
```apl
  'UTF-8' ⎕UCS  ⎕UCS errorMessage
```

# Environment variables
## APLASYNC - Async/Await on of
Setting *APLASYNC* to 1 are used async await model. Using this can be overhead, therefore default value for *APLASYNC* is 0.

## APLLOG - Logging flag
There are 5 levels of logging and integer value of *APLLOG* enables logging level:
1. [ERROR] - Error
2. [WARN] - Warring
3. [INFO] - Information
4. [DEBUG] - Debug
- any other value - [MISC] - Miscellaneous

# Notes: 
1. The event body should be esaped in the test:
'{\"name\":\"vale\"}'
2. The shell (sh) scripts likes LF instead CRLF. That can be issues if you run it from powershell with Linux subsystem.

# See
1. Dyalog APL interpret home <http://www.dyalog.com>
2. AWS Lambda Custom runtime <https://docs.aws.amazon.com/lambda/latest/dg/runtimes-custom.html>
3. Some custom runtime <https://github.com/mthenw/awesome-layers>
4. <https://github.com/lambci/docker-lambda>
5. <https://github.com/lambci/node-custom-lambda>

