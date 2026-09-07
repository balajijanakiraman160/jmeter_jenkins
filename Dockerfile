FROM alpine/jmeter:5.6.3
WORKDIR /test
COPY ["blazedemo Performance Test.jmx","/test/blazedemo Performance Test.jmx"]
ENTRYPOINT ["jmeter"]
