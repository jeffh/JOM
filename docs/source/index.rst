====================================
Welcome to the Hydrant Documentation
====================================

Hydrant is a simple object serializer and data mapper library. Its goal is to
parse JSON into value objects that you can safely use throughout your
application. All the input validation and error checking can be done through
Hydrant.

**New?** :doc:`Install Hydrant <installation>` and then jump in with
:doc:`getting started <getting_started>`.

Topical guides after getting started
    - Learn how Hydrant's :doc:`error handling <error_handling>` system works
    - Read up on :doc:`mapping techniques <mapping_techniques>` for some parsing
      scenarios that Hydrant can handle.
    - Understand :doc:`Hydrant's design <design>`
    - Learn how to :doc:`write your own mappers <writing_mappers>`.

Hydrant's Public API reference
    - :doc:`HYDMappers <mapper_reference>`
    - :doc:`HYDAccessors <accessor_reference>`
    - :doc:`NSFormatters <formatter_reference>`
    - :doc:`NSValueTransformers <value_transformer_reference>`

About Hydrant's Development
    - Review :doc:`what's changed <changelog>` between versions.
    - Read the :doc:`Contributor's Guide <contributing>`.
    - Bugs? `File bugs on GitHub <hydrant_issues>`_.
      Don't know the best way? Read :ref:`filing bugs <bugs>`.

.. _hydrant_issues: https://github.com/jeffh/Hydrant/issues


Table of Contents
=================

.. toctree::
   :maxdepth: 3

   installation
   getting_started
   error_handling
   mapping_techniques
   writing_mappers
   design
   mapper_reference
   accessor_reference
   formatter_reference
   value_transformer_reference
   contributing
   changelog
