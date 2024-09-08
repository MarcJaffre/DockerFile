### tightvncserver.service
```
[Unit]
Description=TightVNC Server
After=network.target

[Service]
User=root
ExecStart=/usr/bin/tightvncserver :1
Restart=always
RestartSec=5
#StartLimitInterval=5min
#StartLimitBurst=10

[Install]
WantedBy=multi-user.target
```

### websockify.service
```
[Unit]
Description=Websockify Server
After=network.target

[Service]
User=root
ExecStart=/usr/bin/websockify 6080 localhost:5900
#ExecStart=/usr/bin/websockify -D --web=/usr/share/novnc/ 6080 localhost:5900
Restart=always

[Install]
WantedBy=multi-user.target
```


### novnc.service
```
[Unit]
Description=NoVNC Server
After=network.target

[Service]
User=root
ExecStart=/usr/share/novnc 6080
#ExecStart=/usr/bin/novnc --listen 8080 --vnc localhost:5900
Restart=always

[Install]
WantedBy=multi-user.target
```
