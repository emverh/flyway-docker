FROM java:8

RUN apt-get update && apt-get install -y tar

ENV FLYWAY_VERSION="4.0.1"

RUN curl -O "https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/${FLYWAY_VERSION}/flyway-commandline-${FLYWAY_VERSION}-linux-x64.tar.gz"

RUN tar -xf flyway-commandline-${FLYWAY_VERSION}-linux-x64.tar.gz -C /opt

WORKDIR /opt/flyway-${FLYWAY_VERSION}

CMD ./flyway -placeholderReplacement=false migrate -url=$DATABASE_URL -user=$DATABASE_USER -password=$DATABASE_PW -locations=filesystem:/opt/migrations -validateOnMigrate=false -baselineOnMigrate=true



