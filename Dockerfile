FROM python:3.7
ARG WORKDIR=/code
RUN mkdir $WORKDIR
ADD ./examples/ $WORKDIR/examples
WORKDIR $WORKDIR
#RUN pip install pgsync
ADD ./pgsync/ $WORKDIR/pgsync
ADD ./requirements/ $WORKDIR/requirements

RUN pip install -r $WORKDIR/requirements/prod.txt

ADD ./bin/ $WORKDIR/bin

ENV PYTHONPATH=$WORKDIR

COPY ./docker/wait-for-it.sh wait-for-it.sh
COPY ./docker/runserver.sh runserver.sh
RUN chmod +x wait-for-it.sh
RUN chmod +x runserver.sh
