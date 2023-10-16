#setup make commands
help:
	@echo "Makefile supported commands:"
	@echo "1. build-images: Build required images"
	@echo "2. push-images: Push images to docker registery"
	@echo "3. create-eks-cluster: create EKS cluster on AWS"
	@echo "4. set-hpa-ca: Set policy and account for Pod scaling and Cluster scaling"
	@echo "5. helm-deployment: Start deployment using helm on EKS cluster"
	@echo "6. kill-helm-deployment: Uninstall helm deployment from EKS cluster"

download-model:
	@echo "Downloading Stable Diffusion, make sure you have python env activated with torch and diffuser installed"
	python torchserve_artifacts/download_sd_model.py	
	zip -0 -r torchserve_artifacts/sdxl-1.0-model.zip torchserve_artifacts/sdxl-1.0-model/*

build-mar:
	docker run -it --rm --shm-size=1g \
		--ulimit memlock=-1 --ulimit stack=67108864 --gpus all \
		-v ${PWD}/torchserve_artifacts/:/opt/src pytorch/torchserve:0.8.1-gpu torchserve bash \
		torch-model-archiver --model-name sdxl --version 1.0 --handler handler.py --extra-files sdxl-1.0-model.zip -r requirements.txt

start-service:
	docker compose up
