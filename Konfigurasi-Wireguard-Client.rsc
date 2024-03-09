# jan/09/2024 12:08:02 by RouterOS 7.8
# software id = FPKW-U4RL
#
# model = RB952Ui-5ac2nD
# serial number = 924909652811
/interface wireless
set [ find default-name=wlan1 ] ssid=MikroTik
set [ find default-name=wlan2 ] ssid=MikroTik
/interface wireguard
add listen-port=13231 mtu=1420 name=wireguard1
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip hotspot profile
set [ find default=yes ] html-directory=hotspot
/ip pool
add name=dhcp_pool0 ranges=20.20.1.2-20.20.1.254
add name=dhcp_pool1 ranges=20.20.1.2-20.20.1.254
add name=dhcp_pool2 ranges=20.20.1.2-20.20.1.254
add name=dhcp_pool3 ranges=20.20.1.2-20.20.1.254
/ip dhcp-server
add address-pool=dhcp_pool3 interface=ether2 name=dhcp2
/interface bridge port
add bridge=*9 interface=ether3
add bridge=*9 interface=ether4
add bridge=*9 interface=ether2
/interface wireguard peers
add allowed-address=172.28.20.1/32,30.30.1.0/24 endpoint-address=10.10.102.50 \
    endpoint-port=13231 interface=wireguard1 persistent-keepalive=1s \
    public-key="Negex1+N+wkordhyzREjhU94avW1DdTOo35Qq7XkMgM="
/ip address
add address=20.20.1.1/24 interface=ether2 network=20.20.1.0
add address=172.28.20.2 interface=wireguard1 network=172.28.20.1
/ip dhcp-client
add interface=ether1
/ip dhcp-server network
add address=20.20.1.0/24 gateway=20.20.1.1
/ip firewall nat
add action=masquerade chain=srcnat out-interface=ether1
/ip route
add disabled=no dst-address=30.30.1.0/24 gateway=172.28.20.1 routing-table=\
    main suppress-hw-offload=no
/system clock
set time-zone-autodetect=no time-zone-name=Asia/Makassar
/system ntp client
set enabled=yes
/system ntp client servers
add address=0.id.pool.ntp.org
add address=1.id.pool.ntp.org
/tool graphing interface
add
/tool graphing queue
add
/tool graphing resource
add
