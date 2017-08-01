Docker Motion MQTT
==================

Allows for publishing to MQTT when motion is detected using the following config values:

```
on_event_start mosquitto_pub -h test.mosquitto.org -u yourusername -P yourpassword -t "cam/office/motion" -m "on"
on_event_end mosquitto_pub -h test.mosquitto.org -u yourusername -P yourpassword -t "cam/office/motion" -m "off"
```

Recommended config values:

```
event_gap 5
output_pictures off
ffmpeg_output_movies off
```
