# How to get Dyalog Linux binaries from Dyalog image

Dyalog binaries can be extracted  from Dyalog APL Linux image.

Prerequisite is to have Docker (community editing) installed on PC.

Given example are executed in Powershell, however any shell will work with few changes.

At the first get docker image from Docker hub:

```powershell
docker pull dyalog/dyalog:latest
```

Start a docker image in (power)shell:
```powershell
docker run -it --rm --entrypoint /bin/bash dyalog/dyalog:latest
```

Open new (power)shell window and see running containers adn find Dyalog one:

```powershell
docker ps
CONTAINER ID        IMAGE                  COMMAND             CREATED             STATUS              PORTS               NAMES
3e2ad05ef758        dyalog/dyalog:latest   "/bin/bash"         15 hours ago        Up 15 hours         4502/tcp            dyalog-image-bash
```

Open new (power)shell and change directory to folder where the files should be copied. After copy the files from container which is in this case 3e2ad05ef758 .

```powershell
mkdir dyalog/opt/
docker cp 8440a4a9f327:/opt/mdyalog ./dyalog/opt/
```
And APL interpreter is */dyalog/opt/mdyalog* folder