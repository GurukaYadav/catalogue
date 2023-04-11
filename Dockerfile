FROM node
RUN  useradd roboshop
RUN mkdir app
WORKDIR app
RUN chown roboshop /app
USER roboshop
ADD https://s3.amazonaws.com/rds-downloads/rds-combined-ca-bundle.pem /app/rds-combined-ca-bundle.pem
COPY server.js /app
COPY node_modules/ /app/node_modules

ENTRYPOINT ["node","server.js"]
