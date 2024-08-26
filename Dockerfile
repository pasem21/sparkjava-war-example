FROM maven AS build
WORKDIR /app
COPY . .
RUN mvn package
FROM tomcat
COPY --from=build /app/target/sparkjava-hello-world-1.0.war /usr/local/tomcat/webapps
CMD ["startup.sh"]