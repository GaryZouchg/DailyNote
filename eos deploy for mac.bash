cat > ./wireguard/wg0.conf <<EOF
[Interface]
Address = 10.200.10.16/24 
ListenPort = 51820
PrivateKey = mHhFkAh/hfYIz0Wid05RrtQscL6yvq5eHOCDvJFg+V4=

[Peer]
PublicKey = ZoXuGpguyNu+t52qhBEGyEjeqhHCFeNAzsmMUYGSFlo=
AllowedIPs = 10.0.0.0/8,192.168.0.0/24
Endpoint = 118.25.236.218:51820
PersistentKeepalive = 25
EOF
