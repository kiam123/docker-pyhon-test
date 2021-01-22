FROM ubuntu:bionic-20191029

#================================================
# Customize sources for apt-get
#================================================
RUN  echo "deb http://archive.ubuntu.com/ubuntu bionic main universe\n" > /etc/apt/sources.list \
  && echo "deb http://archive.ubuntu.com/ubuntu bionic-updates main universe\n" >> /etc/apt/sources.list \
  && echo "deb http://security.ubuntu.com/ubuntu bionic-security main universe\n" >> /etc/apt/sources.list

# No interactive frontend during docker build
ENV DEBIAN_FRONTEND=noninteractive \
    DEBCONF_NONINTERACTIVE_SEEN=true

#========================
# Miscellaneous packages
# Includes minimal runtime used for executing non GUI Java programs
#========================
RUN apt-get -qqy update \
    && apt-get -qqy --no-install-recommends install \
        python install python-pip \
        software-properties-common apt-add-repository universe
        
# RUN apt-get -qqy update \
#     && apt-get -qqy --no-install-recommends install \ 
#     pip virtualenv \
#     && rm -rf /var/lib/apt/lists/* /var/cache/apt/*

RUN pip install virtualenv