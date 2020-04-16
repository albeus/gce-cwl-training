.PHONY: help base_instance clean check_instance check_image_family configure build_all

help : Makefile
	@sed -n 's/^##//p' $<

## check_instance  	- Return details about the base instance if it's running.
check_instance:
	@gcloud compute instances list --filter="labels.vmrole:golden-image"

## check_image_family	- Show the latest status of the cwl-lab image family (current golden image).
check_image_family:
	@gcloud compute images describe-from-family  cwl-lab

## base_instance	- Create a standard instance (from official public image).
base_instance:
	@./create_golden_image.sh

## clean    	- Delete the base instance (not the image).
clean:
	@gcloud compute instances delete cwl-lab-golden --zone=europe-west2-b

## configure  	- Run ansible playbook on the base instance.
configure:
	cd ansible && ansible-playbook -i inventory.gcp.yml playbook.yml

## create_image  	- Create/update the golden image from the base instance.
create_image:
	gcloud compute instances stop cwl-lab-golden --zone=europe-west2-b
	gcloud compute images create cwl-lab-`date "+%Y-%m-%d-%H%M%S"` \
	                      --source-disk cwl-lab-golden \
	                      --source-disk-zone europe-west2-b \
                              --family cwl-lab	

## build_all     	- Build all: base instance provisioning, and packing the golden image.
build_all: base_instance configure create_image
