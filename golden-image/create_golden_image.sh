#/bin/bash

# First step to create a base instance as a golden image for the CWL
# training laboratory. The image will be then configured adding the
# applications and the enviroment required for the tutorials.


gcloud compute instances create cwl-lab-golden \
    --zone=europe-west2-b \
    --machine-type=n1-standard-1 \
    --subnet=subnet1 \
    --network-tier=PREMIUM \
    --maintenance-policy=MIGRATE \
    --image-family=ubuntu-1804-lts\
    --image-project=ubuntu-os-cloud \
    --boot-disk-size=50GB \
    --boot-disk-type=pd-standard \
    --boot-disk-device-name=cwl-lab-golden \
    --tags=allow-ssh \
    --labels=vmrole=golden-image \
    --metadata-from-file=user-data=./cloud-init.cfg

echo -e "
Connecting to the machine as \"ubuntu\" user. This way the user will
be created and it will be available for further uses.
"
gcloud compute ssh ubuntu@cwl-lab-golden --zone=europe-west2-b --command="lsb_release -a"
