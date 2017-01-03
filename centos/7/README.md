# CentOS 7 Templates

Multiple templates are available for CentOS 7 that support the creation of a Vagrant
box and AMI in Amazon Web Services.

## Requirements

1. [AWS Command Line Interface](https://aws.amazon.com/cli/)

## Usage

Both the vagrant.json and amazon-import.json templates are built off of an OVA.
The ova-base.json template will create an OVA that can be used, but a custom-built
OVA from another source can also be supplied. Commands are executed from the project
root.

To create the OVA
```Shell
packer build -var-file=variables/common.json centos/7/ova-base.json
```

To build a Vagrant box from an OVA
```Shell
packer build -var "ova_path=path/to/OVA" centos/7/vagrant.json
```

Note that use of the amazon-import.json template is __ADVANCED__ and will require
additional setup in AWS. Details are available [here](http://docs.aws.amazon.com/vm-import/latest/userguide/import-vm-image.html).
```Shell
packer build -var-file=variables/aws.json -var "ova_path=path/to/OVA" centos/7/amazon-import.json
```
