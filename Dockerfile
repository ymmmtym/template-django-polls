FROM python:3.7-alpine
LABEL maintainer "ymmmtym"
ENV HOSTNAME="studb-container" \
    APP_PATH="/app" \
    PS1="[\u@\h \W]# "

COPY ["requirements.txt", "/tmp"]
COPY ["app", "$APP_PATH"]
WORKDIR /tmp
RUN apk update && \
    pip install --upgrade pip && \
    pip install --upgrade setuptools && \
    pip install -r requirements.txt
WORKDIR $APP_PATH
CMD [ "python", "manage.py", "runserver", "0:8000" ]