FROM node
RUN  useradd roboshop
RUN mkdir app
WORKDIR app
ADD https://s3.amazonaws.com/rds-downloads/rds-combined-ca-bundle.pem /app/rds-combined-ca-bundle.pem
COPY server.js /app
COPY node_modules/ /app/node_modules
RUN chown roboshop:roboshop -R /app
USER roboshop
ENTRYPOINT ["node","server.js"]
