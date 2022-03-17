FROM tiangolo/uwsgi-nginx-flask:python3.9
RUN apt-get update && apt-get install -y gcc unixodbc-dev

ENV STATIC_URL /static
ENV STATIC_PATH /var/www/webapp/static
ENV STATIC_PATH /var/www/webapi/static

COPY ./requirements.txt /var/www/requirements.txt
RUN pip install --no-cache-dir -r /var/www/requirements.txt

COPY ./webapp/ /var/www/webapp/
COPY ./webapi /var/www/webapi/

WORKDIR /var/www/

EXPOSE 80

CMD ["python3","main.py"]
