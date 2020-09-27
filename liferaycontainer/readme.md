liferay
```
FROM wyy349093330/liferay:6.2.5 as liferay

...
COPY --from=liferay /liferay/liferay-portal-6.2-ce-ga6 /opt/.
```



