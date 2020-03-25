FROM python:3.7-alpine
LABEL Maintainer="ymmmtym"
ENV HOSTNAME="django-polls" \
    APP="/root/app" \
    PS1="[\u@\h \W]# "

COPY ["requirements.txt", "/tmp"]
COPY ["app", "${APP}"]
WORKDIR /tmp
RUN apk update && \
    pip install --upgrade pip && \
    pip install --upgrade setuptools && \
    pip install -r requirements.txt
WORKDIR ${APP}
EXPOSE 8000
CMD [ "python", "manage.py", "runserver", "0:8000" ]