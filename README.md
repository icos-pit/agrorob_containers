# Agrorob deployment using containers 
![ICOS UC1 Alpha validation strategy](description.png)
## agrorob_emulator 


### Prerequisites

Make sure you have Docker and Docker Compose installed on your machine. You can download them from the [official Docker website](https://www.docker.com/get-started).

### Clone the Repository
you can clone the repo using this command 
```bash
git clone https://github.com/icos-pit/agrorob_containers
cd agrorob_containers/agrorob_emulator/

```
it is possible to change the environment variables and add the router address in environment.env file 

### Build the Docker Image

```bash
docker compose build --no-cache

```

### Run the Docker Container

-d helps you to run the Docker Container on background 

```bash
docker compose up -d 

```

## Zenoh router:

[Instruction here](cloud_zenoh_router/README.md)

## Robot Panel:

[Instruction here]()


## agrorob_driver:

#### In a directory with DockerFile build a docker image:

```docker build -t agrorob_driver .```


#### Allow for connections for GUI

```xhost +``` 

#### Run docker image with command:

```docker run --net=host --cap-add SYS_NICE -e DISPLAY=$DISPLAY -v /tmp/.X11-unix -it agrorob_driver```


#### validation:
After connecting to docker, run below command to verify packages are installed

```ros2 pkg list ```


