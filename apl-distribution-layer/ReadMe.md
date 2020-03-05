# Build Dyalog APL dependencies layer

In order to run AWS APL lambda function (with support of .netcore), Dyalog APL binaries can be packed in AWS lambda layer.

Steps to create layer:
1. **docker** should be installed and run on PC
2. Download Dyalog APL 18.0 linux version ( a zip file) and copy to **apl-distribution** folder.
3. Build the layer running **build.sh** (on Linux) or **build.ps1** (on windows). The build script will make file **layer.zip**
