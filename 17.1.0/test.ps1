$dir = (Get-Location).tostring() 

Remove-Item -LiteralPath "./layer" -Force -Recurse

unzip layer.zip -d ./layer

cd ./test

docker run -it --entrypoint=/bin/bash --rm -v {$dir}:/var/task -v {$dir}/../layer:/opt lambci/lambda:provided index.myFn

