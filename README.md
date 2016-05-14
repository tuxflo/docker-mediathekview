# docker-mediathekview
X11rdp Version of Mediathekview
## About
Using this container allows you to run Mediathekview as a Service and control it via webbrowser like firefox or chrome.
The x11rdp feature is copied from https://github.com/sparklyballs/desktop-dockers.
I'm running this on a NAS to add Videos out of the Mediathek directly to my Multimedia Collection.

## Installation
### Manual

1. download Dockerfile or clone the repository
2. run `docker build .` to create the docker image
3. wait until build process is finished

### Automatic

* run `docker pull tuxflo/docker-mediathekview` to download the image from dockerhub

## Run
The container can be started using `docker run -p <PORT>:8080 -v <PATH_TO_FOLDER>:/nobody/MediathekView <IMAGE_ID_OF_DOCKER_BUILD>` if installed manually or `docker run -p <PORT>:8080 -v <PATH_TO_FOLDER>:/nobody/MediathekView tuxflo/docker-mediathekview` if pulled from dockerhub. Replace <PORT> by a free port you want to use to access the container. Replace <PATH_TO_FOLDER> with your Multimedia location of the host system.
Now you can access the webgui by locating your browser to serverpath:<PORT> for example localhost:8080 if running locally. Choose MediathekView listed under "ALL CONNECTIONS" and hit OK in the xrdp window.

## Issues
* For some reason the content of the initialisation Wizzard gets only renderd in the browserwindow if hovered by the mousepointer, so move the mouse across the window to make the buttons visible.
* The configuration file is not stored persitently, so if you restart the container you have to click through the initialisation wizzard again or have to commit your changes to the docker image.
