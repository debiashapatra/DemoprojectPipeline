FROM maven as build 
WORKDIR /app
copy . .
RUN mvn install

FROM openjdk:11.0
WORKDIR /app
copy --from=build /app/target/Uber.jar /app/
EXPOSE 9090
CMD [ "java", "-jar" "Uber.jar" ]