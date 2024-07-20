# Openvpn config 

- Source: 
    - [https://ravenhawktech.com/index.php/2021/01/27/openvpn-install-on-fedora-server-part-2/]

- install 
    - dnf install openvpn easy-rsa
    - cd /etc/openvpn
    - cp /usr/share/doc/packages/openvpn ./ -rf

- Source: [https://fedoraproject.org/wiki/OpenVPN] >>
    - mkdir /etc/openvpn/easy-rsa
    - cp -rai /usr/share/easy-rsa/3/* /etc/openvpn/easy-rsa/

- // create the vars file
    - `./easyrsa init-pki`

- // creates the pki/ca.crt [this one] and the pki/private/ca.key
./easyrsa build-ca
keyphr: `mom-oli-21`
host: `krausF38`

- // creates the reqs/krausF38.req file and private/krausF38.key 
    - // creates the issued/krausF38.crt (certificate)
    - // creates the inline/krausF38.inline file
        - `./easyrsa build-server-full $( hostname | cut -d. -f1 )`
        - `keyphr: `mom-ol-21``

    ```
        (
            can also be ./easyrsa build-server-full server nopass
            generates: ./pki/reqs/server.req and ./pki/private/server.key

            can also be ./easyrsa build-server-full client nopass
            generates: 
            ./pki/reqs/client.req 
            ./pki/private/client.key
            ./pki/issued/client.crt
            ./pki/inline/client.inline
        )
    ```

- // creates the dh.pem
    - `./easyrsa gen-dh`

- // invalidate a previously generated certificate
    - `./easyrsa gen-crl`

- `mkdir /etc/openvpn/keys/`
    ```
    cp -ai pki/issued/$( hostname | cut -d. -f1 ).{crt,key} \
    pki/private/$( hostname | cut -d. -f1 ).{crt,key} pki/ca.crt keys/dh*.pem /etc/openvpn/keys/
    ```

- the network part:

- mkdir /var/log/openvpn/
- echo "net.ipv4.ip_forward = 1" >> /etc/sysctl.conf
- sysctl --system
- firewall-cmd --add-port=1194/udp --permanent
- firewall-cmd --add-masquerade --permanent
- ip route get 8.8.8.8
- 8.8.8.8 via 192.168.43.1 dev enp0s3 src 192.168.43.23
- firewall-cmd --permanent --direct --passthrough ipv4 -t nat -A POSTROUTING -s 172.16.0.0/24 -o enp0s8 -j MASQUERADE
- firewall-cmd --reload
    - `systemctl status openvpn-server@serverudp.service`
    - `systemctl enable openvpn-server@serverudp.service`
    - `systemctl start openvpn-server@serverudp.service`
- ip add show tun0
- server ip is 172.16.0.1
- client ip will be assigned 172.16.0.2 and so on



- `cp -ai /usr/share/doc/openvpn*/sample/sample-config-files/roadwarrior-server.conf /etc/` in `openvpn/serverudp.conf`
edit:
- `ca keys/ca.crt`
- `cert keys/kraus.crt`
- `key keys/krays.key`
- `dh keys/dh.pem`

- `restorecon -Rv /etc/openvpn`

    - `systemctl status openvpn-server@serverudp.service`
    - `systemctl enable openvpn-server@serverudp.service`
    - `systemctl start openvpn-server@serverudp.service`

- // clean all
    - `./easyrsa clean-all`


## firewall

- `firewall-cmd --permanent --add-service openvpn`
- `firewall-cmd --reload`



## list all ports

    - `netstat -lntu`
- verify sockets listening
    - `ss -lntu`

- open ports:
    - Source: [https://www.digitalocean.com/community/tutorials/opening-a-port-on-linux]
    - `firewall-cmd --add-port=4000/tcp`
    - `firewall-cmd --add-port=22/udp`


## ports
- 22
- 80
- 443
- 943
- 1194/udp

- check the selinux status:
    - sestatus
    - // deactivate
    - setenforce 0

## Create the .ovpn file:

- [https://serverfault.com/questions/483941/generate-an-openvpn-profile-for-client-user-to-import]

- seting it up in ubuntu: [https://www.digitalocean.com/community/tutorials/how-to-set-up-and-configure-an-openvpn-server-on-ubuntu-20-04]

- use the `generateOvpnFile.sh` file to generate the .ovpn file with the following templates

### ovpn file templates
- example 1
    ```
    client
    dev tun
    proto udp
    remote 198.162.100.99 22249
    resolv-retry infinite
    nobind
    remote-cert-tls server
    tls-version-min 1.2
    verify-x509-name Rpi-4-SSD_326fe99d-9fad-472d-9647-ecbece473627 name
    cipher AES-256-CBC
    auth SHA256
    auth-nocache
    verb 3
    <ca>
    </ca>
    <cert>
    </cert>
    <key>
    </key>
    <tls-crypt>
    </tls-crypt>
    ```

- example 2
    ```
    client
    dev tun
    proto udp
    remote 172.16.0.2 1194
    resolv-retry infinite
    nobind
    persist-key
    persist-tun
    mute-replay-warnings
    remote-cert-tls server
    cipher AES-256-CBC
    comp-lzo
    verb 3
    ;mute 20
    <ca>
    </ca>
    <cert>
    </cert>
    <key>
    </key>
    <tls-crypt>
    </tls-crypt>
    ```


