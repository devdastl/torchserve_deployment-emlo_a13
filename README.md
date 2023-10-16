# torchserve_deployment-emlo_a13
This project focuses on deploying model on torchserve and UI.

## Introduction
Here we are using UI, Fastapi backend and torchserve to create a stable diffusion deployment

## Getting started
##### 1. Build model:
We have to first download and package SD model. Below are the steps.
- Run `make downlaod-model`. This will download a stable diffusion large model.
- Run `make build-mar`. This will build a mar file in which requirements and handler will be package.

##### 2. Build and start service:
Now lets build our services and start it.
- Run `make build-service` to build docker images for the UI and FASTAPI backend.
- Run `make start-service` to start the service deployment.