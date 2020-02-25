# How to build apllambda.dws

If this git a project is cloned to *C:\gitrepos* then dws can be build from Dyalog APL session with: 
```apl
 )clear
 ]dbuild 'C:\gitrepos\apl-lambda\18.0.0\apllambdaload'
 )save
```
```apl
 )clear
 ]dbuild 'C:\gitrepos\apl-lambda\18.0.0\apllambda'
 )save
```
The build file is defined at *apllambda.dyalogbuild* and *apllambdaload.dyalogbuild*.