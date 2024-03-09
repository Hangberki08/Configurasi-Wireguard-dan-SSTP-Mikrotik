# jan/02/1970 00:30:04 by RouterOS 7.8
# software id = FPKW-U4RL
#
# model = RB952Ui-5ac2nD
# serial number = 924909652811
/interface wireless
set [ find default-name=wlan1 ] ssid=MikroTik
set [ find default-name=wlan2 ] ssid=MikroTik
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip hotspot profile
set [ find default=yes ] html-directory=hotspot
/ip pool
add name=dhcp_pool0 ranges=20.20.1.2-20.20.1.254
/ip dhcp-server
add address-pool=dhcp_pool0 interface=ether2 name=dhcp1
/interface sstp-client
add connect-to=10.10.102.50 disabled=no name=sstp-pusat profile=\
    default-encryption user=officeB verify-server-address-from-certificate=no
/ip address
add address=20.20.1.1/24 comment=LAN interface=ether2 network=20.20.1.0
/ip dhcp-client
add interface=ether1
/ip dhcp-server network
add address=20.20.1.0/24 dns-server=192.168.22.12,8.8.8.8 gateway=20.20.1.1
/ip firewall nat
add action=masquerade chain=srcnat out-interface=ether1
/ip route
add disabled=no dst-address=30.30.1.0/24 gateway=10.2.2.1 routing-table=main \
    suppress-hw-offload=no
/system identity
set name=OfficeB
/tool graphing interface
add
/tool graphing queue
add
/tool graphing resource
add
