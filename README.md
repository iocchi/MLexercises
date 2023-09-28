# Environment for ML exercises

This repository contains scripts to setup an environment for exercises of Machine Learning course held by Prof. Iocchi. 

The repo has been developed with the contributions of ML tutors: Ermanno Bartoli and Francesco Frattolillo.


## Install Docker

In order to have a ready environment without installing manually all the libraries and dependencies, we use docker.

- [docker](http://www.docker.com)

In order to install docker on your PC, you can follow the following guide:

- [Install docker for Ubuntu](https://docs.docker.com/engine/install/ubuntu/)
- [Post-installation steps for Linux](https://docs.docker.com/install/linux/linux-postinstall/)

**NB**: It's important that you add your user to the `docker` group and log out and in again, before proceeding.

## Nvidia GPU driver installation

Note: skip this section if you do not have an NVidia GPU

In order to run the tensorflow-gpu container you need to have an NVIDIA GPU and the host machine requires the NVIDIA driver (you don't need the NVIDIA CUDA Toolkit). Follow the 
- [NVIDIA Driver Installation Guide](https://docs.nvidia.com/datacenter/tesla/tesla-installation-notes/index.html)

Follow the remaining steps described on the [tensorflow website](https://www.tensorflow.org/install/docker#gpu_support). 
In particular, Install the [Nvidia Container Toolkit](https://github.com/NVIDIA/nvidia-docker/tree/master) by following the 
- [Nvidia container toolkit installation guide](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#setting-up-nvidia-container-toolkit)


## Tensorflow

The standard docker image used in this course is [**tensorflow 2.13.0-gpu-jupyter**](https://hub.docker.com/layers/tensorflow/tensorflow/2.13.0-gpu-jupyter/images/sha256-64bfb25fd3f85e1b0af1757ef8ff25fb96a261d1e572a4105e3037d0a27cdf67?context=explore) with both GPU support and jupyter notebook pre installed. 

This docker image works also on CPU.



## Installation

You'll need to follow this few steps:

- Clone the repository with the following command:

```bash
git clone https://github.com/iocchi/MLexercises.git
```
- go inside the repository and create a folder called notebooks

```bash
cd MLexercises
```

- Build the docker image by running the script:
```bash
bash build.bash
```



## Usage

Once that you're ready, if in the previous step you have built the image with the `build.bash` script, you can run the image 

**with GPU support** 

```bash
bash rungpu.bash
```

**without GPU support**

```bash
bash run.bash
```

## Custom build and run

You can build and run the images with direct commands instead of using scripts.
 
Build an image

```bash
docker built -t NAME_OF_IMAGE .
```
Run the image with GPU support

```bash
nvidia-docker run --name NAME_OF_IMAGE --rm -p 8888:8888  NAME_OF_IMAGE
```
or without GPU support

```bash
docker run --name NAME_OF_IMAGE --rm -p 8888:8888  NAME_OF_IMAGE
```
**NB**: -p 8888:8888 should be always the same because it's for the port




## Connect Colab to local Notebook

Since [Google Colab](https://colab.research.google.com/) has some [limitations](https://research.google.com/colaboratory/faq.html#limitations-and-restrictions) but a well structured interface, you can decide to connect colab to a local runtime and use the computational power of your machine.
1. First of all upload your local ipynb file to colab
![upload file on colab](/images/colab_upload.png)
2. Once you have uploaded your file the first time, colab will automatically save and update (CTRL+S) it on your drive. Next time you want to work on this file just open it from google drive
![open from google drive](/images/google_drive.png)
3. Connect google colab to local runtime (after running the docker container):
![local runtime](/images/local_runtime.png)
4. Write http://localhost:8888/?token= as  showed below:
![connection](/images/localhost.png)
5. Add the token showed when executing the command in the [**Usage** section](#Usage)
![token](/images/get_token.png)

To test your image, use the `first_notebook.ipynb` available in the `test` directory.


## Stop the container

To stop the container, you can press `CTRL-c` in the terminal where you launched it,
or issue in another terminal the command

```bash
docker stop mlnotebook
```

## Mount local folders

If you want to develop and run code locally (without Colab), you should mount a local folder to the container, write your Python code there and run the Python script from the container.


## Commit the docker

Although not recommended, if you change something inside the docker and you want to keep the changes don't forget to commit the image by doing the following command:
```bash
docker commit ID_IMAGE NAME_OF_IMAGE
```
**NB**: you can see the id of the image by doing the command:
```bash
docker ps
```


