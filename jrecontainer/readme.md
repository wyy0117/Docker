oracle jre
```
FROM wyy349093330/jrecontainer:8u221 as jre

...
COPY --from=jre /jre/jre1.8.0_221 /usr/local/.
ENV JRE_HOME /usr/local/jre1.8.0_221
ENV CLASSPATH $JRE_HOME/lib/rt.jar:$JRE_HOME/lib/ext
ENV PATH $PATH:$JRE_HOME/bin
```
