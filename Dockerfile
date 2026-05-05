FROM eclipse-temurin:17

RUN useradd -ms /bin/bash user

RUN mkdir -p /home/user/app/ && chown -R user:user /home/user/app


WORKDIR /home/user/app

COPY *.java ./
COPY junit-* ./

USER user

RUN javac -cp "junit-4.10.jar:." *.java

COPY --chown=user:user . .

CMD ["java", "-cp", "junit-4.10.jar:.", "org.junit.runner.JUnitCore", "TestSub","TestAdd"]