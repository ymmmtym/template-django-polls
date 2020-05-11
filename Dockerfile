FROM python:3.7-alpine
LABEL Maintainer="ymmmtym"
ENV HOSTNAME="django-polls" \
    APP="/opt/app" \
    PS1="[\u@\h \W]# "

COPY [".", "${APP}"]
WORKDIR ${APP}
RUN apk update && \
    pip install --upgrade pip && \
    pip install --upgrade setuptools && \
    pip install -r requirements.txt

EXPOSE 8000
CMD [ "python", "manage.py", "runserver", "0:8000" ]