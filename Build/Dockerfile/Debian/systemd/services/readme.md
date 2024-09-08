### NOVNC
```
- Tightvncserver : Sera utilisé pour partager votre bureau et le rendre accessible via le protocole VNC.
- Websockify     : Sera utilisé pour convertir le flux VNC en un flux WebSocket, ce qui permettra à novnc de communiquer avec le serveur VNC.
- NoVNC          : Sera utilisé pour fournir une interface web pour accéder à votre bureau à distance via un navigateur web.
```

```
/usr/bin/websockify -D --web /usr/share/novnc 6080 localhost:5901
/usr/bin/vncserver --web=/usr/bin/websockify --target-config=chemin/vers/noVNC/utils/launch.sh --listen=localhost:6080 --target=localhost:5900
``` 
