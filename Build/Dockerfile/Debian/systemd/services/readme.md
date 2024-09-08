/usr/bin/websockify -D --web /usr/share/novnc 6080 localhost:5901

/usr/bin/vncserver --web=/usr/bin/websockify --target-config=chemin/vers/noVNC/utils/launch.sh --listen=localhost:6080 --target=localhost:5900
