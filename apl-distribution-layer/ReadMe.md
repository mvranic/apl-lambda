# Build Dyalog APL dependencies layer

In order to run AWS APL lambda function (with support of .netcore), Dyalog APL binaries can be packed in AWS lambda layer.

Steps to create layer:
1. **docker** should be installed and run on PC. Docker is used for build to be able to build also on Windows (using Linux containers).
2. Download Dyalog APL 18.0 linux version ( a zip file) and copy to **apl-distribution** folder.
3. Build the layer running 
```bash
build.sh
```
 (on Linux) or 
 ```bash
  .\build.ps1
 ```
  (on windows). The build script will make file **apllayer.zip**
During the layer build is used **run.sh**.

# Publishing laye to AWS cloud

```bash
aws lambda publish-layer-version --region eu-west-1 --layer-name apl-18-0-disto --zip-file fileb://apllayer.zip
```

# Perquisites:
1. Docker desctop
2. AWS CLI (version 2)
