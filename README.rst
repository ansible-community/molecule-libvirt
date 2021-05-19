***********************
Molecule libvirt Plugin
***********************

.. image:: https://badge.fury.io/py/molecule-libvirt.svg
   :target: https://badge.fury.io/py/molecule-libvirt
   :alt: PyPI Package

.. image:: https://zuul-ci.org/gated.svg
   :target: https://dashboard.zuul.ansible.com/t/ansible/builds?project=ansible-community/molecule

.. image:: https://img.shields.io/badge/code%20style-black-000000.svg
   :target: https://github.com/python/black
   :alt: Python Black Code Style

.. image:: https://img.shields.io/badge/Code%20of%20Conduct-Ansible-silver.svg
   :target: https://docs.ansible.com/ansible/latest/community/code_of_conduct.html
   :alt: Ansible Code of Conduct

.. image:: https://img.shields.io/badge/Mailing%20lists-Ansible-orange.svg
   :target: https://docs.ansible.com/ansible/latest/community/communication.html#mailing-list-information
   :alt: Ansible mailing lists

.. image:: https://img.shields.io/badge/license-MIT-brightgreen.svg
   :target: LICENSE
   :alt: Repository License

Molecule libvirt is designed to allow use of libvirt for provisioning test
resources.

Please note that this driver is currently in its early stage of development,
do not even try to install or use it until this message is removed.

.. _quickstart:

Quickstart
==========

Installation
------------
.. code-block:: bash

   pip install molecule-libvirt

Create a scenario
-----------------

With a new role
^^^^^^^^^^^^^^^

.. code-block:: bash

   molecule init role -d libvirt my-role

This will create a new folder *my-role* containing a bare-bone generated
role like you would do with ``ansible-galaxy init`` command.

It will also contain a molecule folder with a default scenario
using the libvirt driver (using ansible community.libvirt collection).

Install the collection using:

``ansible-galaxy install -r test_requirements.yml``.

Example
-------
This is a `molecule.yml` example file

.. code-block:: yaml

  dependency:
  name: galaxy
  driver:
    name: libvirt
  platforms:
    - name: instance-1
      cpu: 1
      cpu_model: "qemu64"
      image_url: "https://download.fedoraproject.org/pub/fedora/linux/releases/34/Cloud/x86_64/images/Fedora-Cloud-Base-34-1.2.x86_64.qcow2"
      disk_size: "10G"
      ssh_port: 22
      memory_size: "1" # in GB
    - name: instance-2
      memory: "1"
      cpus: 1
      image_url: "https://download.fedoraproject.org/pub/fedora/linux/releases/34/Cloud/x86_64/images/Fedora-Cloud-Base-34-1.2.x86_64.qcow2"
      libvirt_host: "server.home.lan"
      libvirt_user: "james"
      bridge_name: "bridge0"
    - name: instance-3
      memory: "1"
      cpus: 1
      image_url: "https://download.fedoraproject.org/pub/fedora/linux/releases/34/Cloud/x86_64/images/Fedora-Cloud-Base-34-1.2.x86_64.qcow2"
      libvirt_host: "server.home.lan"
      libvirt_user: "james"
      bridge_name: "bridge0"
  provisioner:
    name: ansible
  verifier:
    name: ansible

Optional parameters
-------------------

``molecule_bridge``: existing bridge on local host. Can be useful if you
want to set network interface name created for molecule.
default value is: **molecule-br0**.

``molecule_network_cidr``: ip address range that should be bind to molecule
virtual network.
default value is: **10.10.10.0/24**.

``qemu_user``: qemu process user. On RHEL like system qemu user is **qemu**.
On Debian like, qemu user is **libvirt-qemu**.
default value is: **qemu**.

``cpu_model``: specifies CPU model requested by the guest virtual machine.
default is : **qemu64**.

``arch``: specifying the CPU architecture to virtualization. default is
**x86_64**.

``timezone``: vm's timezone. default is **America/Toronto**.

``bridge_name``: existing bridge on remote host. This bridge should allow VM
being reachable with an ip address.

``libvirt_host`` and ``libvirt_user``: remote host parameters. **libvirt_user**
should belongs to *libvirt* group.

Once set, you will have to run:

.. code-block:: bash

   molecule test


Documentation
=============

Read the documentation and more at https://molecule.readthedocs.io/.

.. _get-involved:

Get Involved
============

* Join us in the ``#ansible-molecule`` channel on `Freenode`_.
* Join the discussion in `molecule-users Forum`_.
* Join the community working group by checking the `wiki`_.
* Want to know about releases, subscribe to `ansible-announce list`_.
* For the full list of Ansible email Lists, IRC channels see the
  `communication page`_.

.. _`Freenode`: https://freenode.net
.. _`molecule-users Forum`: https://groups.google.com/forum/#!forum/molecule-users
.. _`wiki`: https://github.com/ansible/community/wiki/Molecule
.. _`ansible-announce list`: https://groups.google.com/group/ansible-announce
.. _`communication page`: https://docs.ansible.com/ansible/latest/community/communication.html

.. _authors:

Authors
=======

* James Regis
* Gaëtan Trellu
* Gariele Cerami
* Sorin Sbarnea

.. _license:

License
=======

The `MIT`_ License.

.. _`MIT`: https://github.com/ansible/molecule/blob/master/LICENSE

The logo is licensed under the `Creative Commons NoDerivatives 4.0 License`_.

If you have some other use in mind, contact us.

.. _`Creative Commons NoDerivatives 4.0 License`: https://creativecommons.org/licenses/by-nd/4.0/
