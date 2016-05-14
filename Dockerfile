FROM hurricane/dockergui:x11rdp

# set variables
# User/Group Id gui app will be executed as default are 99 and 100
ENV USER_ID=99 GROUP_ID=100 APP_NAME="Mediathekview" WIDTH=1420 HEIGHT=840 TERM=xterm

# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

# Add local files
ADD src/ /
# start files and config etc....
RUN mv /rc.xml /nobody/.config/openbox/rc.xml && \

# repositories
echo 'deb http://archive.ubuntu.com/ubuntu trusty main universe restricted' > /etc/apt/sources.list && \
echo 'deb http://archive.ubuntu.com/ubuntu trusty-updates main universe restricted' >> /etc/apt/sources.list && \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer && \

# update apt and install dependencies
apt-get install -qy \
vlc \
flvstreamer \
mplayer && \

# download Mediathekview
wget http://heanet.dl.sourceforge.net/project/zdfmediathk/Mediathek/Mediathek%2011/MediathekView_11.zip -P /opt/ && \
unzip /opt/MediathekView_11.zip -d /opt/

ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
