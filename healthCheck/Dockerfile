FROM mdock.daumkakao.io/eclipse-temurin:17-jdk AS builder
COPY . .
COPY src src
RUN chmod +x ./gradlew
ARG PROXY
RUN ./gradlew ${PROXY} build -x test

FROM mdock.daumkakao.io/eclipse-temurin:17-jdk

RUN mkdir -p /opt/app
COPY --from=builder build/libs/*.jar /opt/app/spring-boot-application.jar

CMD java -jar /opt/app/spring-boot-application.jar
