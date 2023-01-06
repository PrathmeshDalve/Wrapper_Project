FROM python:3

COPY . .
RUN apt update && apt install python3-pip
RUN pip3 install -r requirement.txt
ADD njmon_installation.sh /

RUN bash -c "/njmon_installtion.sh"
ADD njmon_collect.sh /
RUN bash -c "/njmon_collect.sh"
EXPOSE 8080

ENTRYPOINT ["python3"]
CMD ["wrapper.py"]
