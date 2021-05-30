#OSM (Open Source Media) Server

##Basic Description

The concept of the OSM server can be summarized as a decentralized federated network of servers that contain song data (similar to storing code data on GitHub), allowing musicians across the world to collaborate with each other.

The song data will be stored in a message format that is based on [ActivityPub](https://activitypub.rocks), which itself is based off of JSON-LD.  The goal of the messages is to allow multiple Digital Audio Workstations (DAWs) to be updated to send and receive the messages back and forth, thus allowing for CROSS-DAW Collaboration.

As part of this project, I will be trying to patch some of the more popular Source DAWs by creating a library that does most of the work for the DAWs.

Note: I want the message format to be freely available to all, including commercial DAW makers.  The only reason they are out of scope is because we don't have access to their code and can't submit patches to them.  If those companies wish to use the message format and interface with our servers to collaborate with the open source servers as well, I'm 100% okay with that.


##High-Level Tasks

###Server Code
* Determine how messages will be stored on the backend
* Create a back-end API server to send/receive (push/pull?)messages
* Update back-end API server with federation functionality
* Create a front-end web server as a user interface


###DAW Code
* Create a library that can communicate with the API server
* Create patches for DAWs
  * Ardour
  * QTractor
  * Zrythm
* Work with DAW teams/submit patches for upstream maintenance

###Other Tasks
* Create message format
* Publish message format (Public Domain?)
* Set up server machines (my desktop can be a testing server to test federation)
