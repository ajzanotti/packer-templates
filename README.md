# ajzanotti-packer-templates

This project contains Packer templates for building and provisioning base VM images.

## Requirements

1. [Packer](https://www.packer.io/)
2. [Vagrant](https://www.vagrantup.com/)
3. [VirtualBox](https://www.virtualbox.org/)

## Usage

Download the project, open a terminal, and position yourself in the project root. The provisioning scripts in the Packer templates are
referenced relative to this location, so commands must be executed at the project root or they will fail. The sample commands provided
below are for a Linux terminal but are similar for Windows.

To verify a template
```Shell
packer validate -var-file=centos-7/variables.json centos-7/template.json

packer validate centos-7/template.json
```

To perform a build
```Shell
packer build -var-file=centos-7/variables.json centos-7/template.json
```

Importing and launching the build output
```Shell
vagrant box add my_name/box_name output_name.box

mkdir test
cd test
vagrant init my_name/box_name
vagrant up
```

For more information on Vagrant commands see the [documentation](https://docs.vagrantup.com).

## License

This project is distributed under the Apache License, Version 2.0. A copy of the license should be included with the original source
material at the project root as LICENSE. If the license file is not present a copy can be obtained
[here](http://www.apache.org/licenses/LICENSE-2.0.txt).
