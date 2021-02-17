FROM ubuntu:18.04
WORKDIR /MehdiApp
COPY app/app.py /MehdiApp
RUN apt-get update && apt-get upgrade -y && apt-get clean
# Python package management and basic dependencies
RUN apt-get install -y curl python3.7 python3.7-dev python3.7-distutils
#CMD ["python3","/MehdiApp/app.py"]