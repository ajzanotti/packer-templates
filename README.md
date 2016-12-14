# ajzanotti-packer-templates

This project contains Packer templates for building and provisioning base VM images.

## Requirements

1. [Packer](https://www.packer.io/)
2. [Vagrant](https://www.vagrantup.com/)
3. [VirtualBox](https://www.virtualbox.org/)

## Usage

Position yourself in the project root. The provisioning scripts in the templates
are referenced relative to this location, so commands must be executed there or
they will fail.

To verify a template
```Shell
packer validate centos-7/template.json
```

To perform a build
```Shell
packer build -var-file=variables.json centos-7/template.json
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

## Known Issues

* The centos-5 template will not build on VirtualBox 5.1

## License

This project is distributed under the Apache License, Version 2.0. A copy of the
license should be included with the original source material at the project root
as LICENSE. If the license file is not present a copy can be obtained [here](http://www.apache.org/licenses/LICENSE-2.0.txt).
