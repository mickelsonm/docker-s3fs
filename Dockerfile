FROM ubuntu:14.04

# sets up our platform stuff
RUN lsb_release -a
RUN apt-get -qq update
RUN apt-get -qq install \
	build-essential \
	git \
	libfuse-dev \
	libcurl4-openssl-dev \
	libxml2-dev \
	mime-support \
	automake \
	libtool

# gets s3fs codebase
RUN git clone https://github.com/s3fs-fuse/s3fs-fuse.git /usr/src/s3fs-fuse

# builds and installs s3fs
RUN cd /usr/src/s3fs-fuse && ./autogen.sh && ./configure && make && make install

# cleans up...we're done with the code for it
RUN rm -rf /usr/src/s3fs-fuse

# sets up our mounting
ADD mount.sh /usr/local/mount.sh
RUN chmod +x /usr/local/mount.sh

ENTRYPOINT /usr/local/mount.sh
