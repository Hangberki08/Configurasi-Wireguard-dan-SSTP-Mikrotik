# jan/09/2024 12:07:22 by RouterOS 7.8
# software id = STYT-25ZN
#
# model = RB2011UAS-2HnD
# serial number = 3F06022A99D7
/interface wireless
set [ find default-name=wlan1 ] ssid=MikroTik
/interface wireguard
add listen-port=13231 mtu=1420 name=wireguard1
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip pool
add name=dhcp_pool0 ranges=30.30.1.2-30.30.1.254
add name=dhcp_pool1 ranges=30.30.1.2-30.30.1.254
add name=dhcp_pool2 ranges=30.30.1.2-30.30.1.254
add name=dhcp_pool3 ranges=30.30.1.2-30.30.1.254
/ip dhcp-server
add address-pool=dhcp_pool3 interface=ether2 name=dhcp2
/port
set 0 name=serial0
/interface bridge port
add bridge=*E interface=ether2
add bridge=*E interface=ether3
/interface wireguard peers
add allowed-address=172.28.20.2/32,20.20.1.0/24 interface=wireguard1 \
    public-key="mCRDVvdunSHr7EgBuXzV/I/pomdKFxuk0MtRAftdBw8="
/ip address
add address=30.30.1.1/24 interface=ether2 network=30.30.1.0
add address=172.28.20.1 interface=wireguard1 network=172.28.20.2
/ip dhcp-client
add interface=ether1
/ip dhcp-server
add address-pool=dhcp_pool2 disabled=yes interface=*E name=dhcp1
/ip dhcp-server network
add address=30.30.1.0/24 dns-server=192.168.22.12,8.8.8.8 gateway=30.30.1.1
/ip firewall nat
add action=masquerade chain=srcnat out-interface=ether1
/ip route
add disabled=no dst-address=20.20.1.0/24 gateway=172.28.20.2 routing-table=\
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
