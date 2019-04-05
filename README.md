Screeps Container
=================
This is the standard build of Screeps in a container.

Screeps is required to have an API key to execute. The API key is
imported into the container through the STREAM_KEY environmental
variable.

The Screep server sources all configuration, map and mods from
`/screeps`. This directory can be customized and then be mounted
into the container.
