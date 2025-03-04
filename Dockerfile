# Uygulamanın çalışması için JDK lazım
#FROM amazoncorretto:17
FROM openjdk:17

# Prokemizin jar dosyası konumu
ARG JAR_FILE=target/*.jar

# Projenin jar halini dockerin içine şu isimle kopyala
COPY ${JAR_FILE} my-application.jar

# Terminalden çalıştırmak istediğin komutları CMD ile kullanıyorsun
CMD apt-get update
# CMD apt-get upgrade -y

# İç portu sabitlemek için
EXPOSE 8081

# Uygulamanın çalışacağı komut
ENTRYPOINT ["java", "-jar", "my-application.jar"]