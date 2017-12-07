sudo pip3 install shadowsocks

vim ~/ss.json


{
    "server":"45.78.53.139",
    "server_port":8337,
    "local_address": "127.0.0.1",
    "local_port":1080,
    "password":"djLYL8ZWr5",
    "timeout":300,
    "method":"aes-256-cfb"
}

sslocal -c ~/ss.json

git:
git config --global http.proxy 'socks5://127.0.0.1:1080'
git config --global https.proxy 'socks5://127.0.0.1:1080'

git config --global --unset http.proxy
git config --global --unset https.proxy


git config -l 查看配置
