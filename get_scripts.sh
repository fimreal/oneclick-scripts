#!/usr/bin/env sh

proxy=false

if ${proxy} ; then
    PROXY="https://cfdown.2fw.top/"
    echo use proxy: ${PROXY}
else 
    PROXY=""
fi

# c
wget ${PROXY}https://github.com/oldratlee/useful-scripts/raw/dev-2.x/bin/c -O public/c

# docker
wget ${PROXY}https://github.com/docker/docker-install/raw/master/install.sh -O public/docker

# acme.sh
wget ${PROXY}https://github.com/acmesh-official/get.acme.sh/raw/master/index.html -O public/acme

# shell 判断系统
GetOS() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        OS=$NAME
    elif [ -f /etc/lsb-release ]; then
        . /etc/lsb-release
        OS=$DISTRIB_ID
    else
        OS=$(uname -s)
    fi
    echo $OS
}

# shell 判断包管理器
# 判断包管理器
GetPakManager() {
    if command -v yum >/dev/null 2>&1; then
        PACKAGE_MANAGER=yum
    elif command -v dnf >/dev/null 2>&1; then
        PACKAGE_MANAGER=dnf
    elif command -v pacman >/dev/null 2>&1; then
        PACKAGE_MANAGER=brew
    elif command -v zypper >/dev/null 2>&1; then
        PACKAGE_MANAGER=brew
    elif command -v brew >/dev/null 2>&1; then
        PACKAGE_MANAGER=brew
    elif command -v apt-get >/dev/null 2>&1; then
        PACKAGE_MANAGER=apt-get
    else
        PACKAGE_MANAGER=""
    fi
    echo $PACKAGE_MANAGER
}
