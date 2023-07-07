## cp-pihole

This guide will help you create a Pi-hole instance in a container on a Cradlepoint router.

## Pre-requisites

1. Container support enabled in NCM.
2. Cradlepoint router with ARM64 architecture (E-Series or R-Series) and an advanced license.

## Example compose

Use the following example compose to set up the Pi-hole container:

```yaml
version: '2.4'
services:
  pihole:
    image: jgaudu/cp-pihole
    restart: unless-stopped
    environment:
      - TZ=America/NewYork #change to your timezone
      - WEBPASSWORD=password
      - PIHOLE_UID=0
    networks:
      lannet:
        ipv4_address: 192.168.0.100 #change to your desired IP
networks:
  lannet:
    driver: bridge
    driver_opts:
      com.cradlepoint.network.bridge.uuid: 00000000-0d93-319d-8220-4a1fb0372b51 #Default Primary LAN uuid
    ipam:
      driver: default
      config:
        - subnet: 192.168.0.0/24 #change to your desired subnet
          gateway: 192.168.0.1 #change to your desired gateway
```

## Accessing the Pi-hole Admin Interface

After setting up the Pi-hole container, you can access the Pi-hole admin interface by following these steps:

1. Determine the IP address of the Pi-hole container. (Defined in the compose above)
2. Open a web browser and enter the following URL: `http://{container_IP}`. ex. http://192.168.0.100
3. You should now see the Pi-hole admin interface.
