ORG=khanlab
NAME=freesurfer
VERSION=v6.0.1-subfields-freeview

DOCKER_NAME=$(ORG)/$(NAME):$(VERSION)
SINGULARITY_NAME=$(ORG)_$(NAME)_$(VERSION)

BUILD_DIR=~/singularity
LOG_DIR=build_logs


fromlocal:
	rm -f $(BUILD_DIR)/$(SINGULARITY_NAME).img
	sudo singularity build $(BUILD_DIR)/$(SINGULARITY_NAME).img local.Singularity.$(VERSION) | tee $(LOG_DIR)/build_$(SINGULARITY_NAME).log


build:
	rm -f $(BUILD_DIR)/$(SINGULARITY_NAME).img
	sudo singularity build $(BUILD_DIR)/$(SINGULARITY_NAME).img Singularity.$(VERSION) | tee $(LOG_DIR)/build_$(SINGULARITY_NAME).log
	


sandbox:
	sudo singularity build --sandbox sandbox_$(SINGULARITY_NAME) Singularity | tee -a $(LOG_DIR)/sandbox_$(SINGULARITY_NAME).log
	
docker_build: 
	docker build -t $(DOCKER_NAME) --rm .


