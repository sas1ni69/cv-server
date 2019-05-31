FROM alpine:latest

RUN apk add --no-cache python3-dev \
      && pip3 install --upgrade pip

WORKDIR /app

COPY . /app

RUN apk --no-cache --update-cache add gcc gfortran python python-dev py-pip build-base wget freetype-dev libpng-dev openblas-dev
RUN ln -s /usr/include/locale.h /usr/include/xlocale.h
RUN pip3 --no-cache-dir install numpy matplotlib
RUN pip3 --no-cache-dir install -r requirements.txt

EXPOSE 3000

ENTRYPOINT ["python3"]
CMD ["app.py"]
