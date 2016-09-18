FROM ubuntu:14.04
MAINTAINER Seth Fitzsimmons <seth@mojodna.net>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y --no-install-recommends \
  gdal-bin \
  jhead \
  libatlas3-base \
  libboost-chrono1.54.0 \
  libboost-date-time1.54.0 \
  libboost-filesystem1.54.0 \
  libboost-iostreams1.54.0 \
  libboost-python1.54.0 \
  libboost-regex1.54.0 \
  libboost-serialization1.54.0 \
  libboost-system1.54.0 \
  libboost-thread1.54.0 \
  libgdal1h \
  libgeotiff2 \
  libgomp1 \
  libgoogle-glog0 \
  libpython2.7 \
  libproj0 \
  libspqr1.3.1 \
  libvtk5.8 \
  python \
  python-networkx \
  python-numpy \
  python-pip \
  python-pyexiv2 \
  python-pyside \
  python-scipy \
  python-yaml && \
  apt-get clean

RUN pip install -U \
  exifread \
  xmltodict

COPY staging/code/build/bin /code/build/bin/
COPY staging/code/ccd_defs_check.py /code/ccd_defs_check.py
COPY staging/code/opendm/ /code/opendm/
COPY staging/code/run.py /code/run.py
COPY staging/code/scripts/ /code/scripts/
COPY staging/code/SuperBuild/build/pdal/bin/ /code/SuperBuild/build/pdal/bin/
COPY staging/code/SuperBuild/install/ /code/SuperBuild/install/
COPY staging/code/SuperBuild/src/opensfm/ /code/SuperBuild/src/opensfm/

WORKDIR /code

ENV LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/code/SuperBuild/install/lib"
ENV PYTHONPATH="$PYTHONPATH:/code/SuperBuild/install/lib/python2.7/dist-packages:/code/SuperBuild/src/opensfm"

ENTRYPOINT ["python", "/code/run.py", "--project-path", "/code/"]
