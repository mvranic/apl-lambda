# APL interpreter runtime for AWS lambda

**Note: Dyalog APL interpreter licence**
```
   Dyalog interpreter used in this project part of Dyalog docker image on Linux. 
   Please, check the Dyalog APL interpreter licence with Dyalog ltd at http://wwww.dyalog.com
```

In example the Dyalog binaries are at: ```./dyalog/opt/mdyalog```
The files can be extracted as describe at [How to get Dyalog Linux binaries from Dyalog image](./GetDyalog.md)

# Create Dyalog APL AWS lambda layer
In progress...

# How to use APL lambda

Save as `index.apl`:

```apl
event←index arg;context
   event context←arg
   ⎕←'Hi from APL on Lambda!'
   ⎕←'There is ',(⍕getRemainingTimeInMillis context.deadlineMs ⎕TS),' ms remaining'
```

Then bundle up into a zipfile – this is your function bundle:

```sh
zip -yr lambda.zip index.dyalog  # add dws or dyalog files too if you have any
```

Create a new Lambda function and choose the custom runtime option.

![Create lambda](https://www.github.com/mvranic/apl-lambda/master/img/create.png "Create lambda screenshot")

Select your `lambda.zip` as the "Function code" and make the handler "index.handler".

![Function code](https://www.github.com/mvranic/apl-lambda/master/img/function_code.png "Function code setup screenshot")

Then click on Layers and choose "Add a layer", and "Provide a layer version ARN" and enter the following ARN:

```
arn:aws:lambda:us-east-1:553035198032:layer:nodejs10:17
```

Or [use this link](https://console.aws.amazon.com/lambda/home?region=us-east-1#/connect/layer?layer=arn:aws:lambda:us-east-1:553035198032:layer:nodejs10:17) and pick your function from the "Function name" auto-suggest.

![Add a layer](https://www.github.com/mvranic/apl-lambda/master/img/layer.png "Add a layer screenshot")

Then save your lambda and test it with a test event!

![Test event output](https://www.github.com/mvranic/apl-lambda/master/img/log.png "Test event output screenshot")

## Current Version ARNs

| Node.js version | ARN |
| --- | --- |
| 10.16.3 | `arn:aws:lambda:<region>:553035198032:layer:nodejs10:17` |
| 12.9.0  | `arn:aws:lambda:<region>:553035198032:layer:nodejs12:13` |

## Previous Version ARNs

| Node.js version | ARN |
| --- | --- |
| 12.8.1  | `arn:aws:lambda:<region>:553035198032:layer:nodejs12:12` |
| 10.16.2 | 


# See
1. <https://aws.amazon.com/blogs/apn/aws-lambda-custom-runtime-for-php-a-practical-example/>
2. <https://aws.amazon.com/blogs/compute/scripting-languages-for-aws-lambda-running-php-ruby-and-go/>
3. <https://github.com/mthenw/awesome-layers>
4. <https://docs.aws.amazon.com/lambda/latest/dg/runtimes-api.html>
5. <https://medium.com/@avijitsarkar123/aws-lambda-custom-runtime-really-works-how-i-developed-a-lambda-in-perl-9a481a7ab465>
6. <https://aws.amazon.com/blogs/opensource/rust-runtime-for-aws-lambda/>
7. <https://github.com/rrainn/aws-lambda-custom-node-runtime>
8. <https://github.com/lambci/crambda>