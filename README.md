## OVeview

Container that runs calibre-server to expose a 
[Calibre](https://calibre-ebook.com/) library as a web page.

The Dockerfile is available at [https://github.com/adamay909/calibre-docker](https://github.com/adamay909/calibre-docker).

A prebuilt image is available on Docker Hub:
	
	docker pull adamaymas/calibre


When you start the container with

	docker run <OPTIONS> adamaymas/calibre <CALIBRE_SERVER_OPTS>

Inside the container this will run

	calibre-server <CALIBRE_SERVER_OPTS>

So you can simply consult the [Calibre 
ducumentations](https://manual.calibre-ebook.com/generated/en/calibre-server.html) 
for the possible options for calibre-server. The only thing to keep in mind is 
that the paths you give to calibre-server are those inside the container. If 
you want to give access to files on the host system, you need to do that with 
volumes and bind mounts through docker in the usual ways.


## Basic Usage

You can start the server with something like 


	docker run -v <LOCATION OF LIBRARY>:/calibre \
		   -p 8080:8080\
		   adamaymas/calibre /calibre

Note that the default UID:GID for calibre-server is set to 1001:1001. Change it 
to suit your needs with the --user option for docker run (or change the 
permissions for host files that you want calibre-server to access).

The above will start the content server available on your host machine at port 
8080.  There is no authentication or SSL, so use with caution. Consult the 
[documentation](https://manual.calibre-ebook.com/server.html) on how to enable 
user authentication and how to run it behind a reverse proxy.   

## Notes

The entrypoint of the container is kept deliberately simple so you only have to 
consult the Calibre documentations and just keep in mind to 'map' the host 
paths to paths inside the container with appropriate bind mounts through docker 
run -v options.

The container has the whole of Calibre installed so you can use [all the 
command line 
tools](https://manual.calibre-ebook.com/generated/en/cli-index.html) listed in 
the Calibre documentations. Some of them are not useful without access to a GUI 
but others can be handy. You can use those other tools by replacing the 
entrypoint by doing something like:

	docker run --entrypoint COMMAND \
		   <OPTIONS> \
		   adamaymas/calibre <OPTIONS_TO_COMMAND>

 
