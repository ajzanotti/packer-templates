# ajzanotti-packer-templates

This project contains Packer templates for building and provisioning base VM boxes.

## Requirements

* [Vagrant](https://www.vagrantup.com/) - "creates and configures lightweight, reproducible, and portable development environments"
* [Packer](https://www.packer.io/) - "creates machine and container images for multiple platforms from a single source configuration"
* [VirtualBox](https://www.virtualbox.org/) - "a general-purpose full virtualizer for x86 hardware"

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
vagrant box add my_name/box_name <NAME>.box

mkdir test
cd test
vagrant init my_name/box_name
vagrant up
```

For more information on Vagrant commands see the [documentation](https://docs.vagrantup.com).

## Disclaimer

The templates and scripts provided in this project build and provision basic VMs for general use. They are intended to serve as a useful
starting point for further customization. Therefore, it should not be expected that they will fully satisfy the needs of your particular
situation without an investment on your part.

## Contributing

For instructions on contributing to this project please see the information in CONTRIBUTORS.md.

## License

This project is distributed under the Apache License, Version 2.0. A copy of the license should be included with the original source
material at the project root as LICENSE. If the license file is not present a copy can be obtained
[here](http://www.apache.org/licenses/LICENSE-2.0.txt).
