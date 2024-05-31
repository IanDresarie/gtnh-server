FROM eclipse-temurin:21

ARG modpackurl=https://downloads.gtnewhorizons.com/ServerPacks/GT_New_Horizons_2.6.1_Server_Java_17-21.zip

RUN wget ${modpackurl}

RUN unzip $(basename ${modpackurl}) -d /data

WORKDIR /data
RUN chmod +x startserver.sh
RUN sed -i 's;false;true;' eula.txt

EXPOSE 25565/tcp

CMD ["sh", "startserver.sh"]
