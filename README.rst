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
      image_url: "https://mirror.csclub.uwaterloo.ca/fedora/linux/releases/33/Cloud/x86_64/images/Fedora-Cloud-Base-33-1.2.x86_64.qcow2"
      disk_size: "10G"
      ssh_port: 22
      memory_size: "1" # in GB
    - name: instance-2
      memory: "1"
      cpus: 1
      image_url: "https://mirror.csclub.uwaterloo.ca/fedora/linux/releases/33/Cloud/x86_64/images/Fedora-Cloud-Base-33-1.2.x86_64.qcow2"
      libvirt_host: "server.home.lan"
      libvirt_user: "james"
      bridge_name: "bridge0"
    - name: instance-3
      memory: "1"
      cpus: 1
      image_url: "https://mirror.csclub.uwaterloo.ca/fedora/linux/releases/33/Cloud/x86_64/images/Fedora-Cloud-Base-33-1.2.x86_64.qcow2"
      libvirt_host: "server.home.lan"
      libvirt_user: "james"
      bridge_name: "bridge0"
  provisioner:
    name: ansible
  verifier:
    name: ansible


All you need to do is fill in the remote host name, the remote user and
the bridge name  you want to create your test instance into.
Then run

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
