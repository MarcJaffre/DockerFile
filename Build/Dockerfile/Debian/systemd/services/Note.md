### tightvncserver.service
```
[Unit]
Description=TightVNC Server
After=network.target

[Service]
User=vnc
ExecStart=/usr/bin/tightvncserver :1
Restart=always

[Install]
WantedBy=multi-user.target
```

### websockify.service
```
[Unit]
Description=Websockify Server
After=network.target

[Service]
User=vnc
ExecStart=/usr/bin/websockify 6080 localhost:5900
Restart=always

[Install]
WantedBy=multi-user.target
```


novnc.service
```
[Unit]
Description=NoVNC Server
After=network.target

[Service]
User=vnc
ExecStart=/usr/share/novnc 6080
Restart=always

[Install]
WantedBy=multi-user.target
```
