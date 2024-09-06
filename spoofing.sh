#!/bin/bash

: '
$ cat os-release

NAME="Fedora Linux"
VERSION="40 (Workstation Edition)"
ID=fedora
VERSION_ID=40
VERSION_CODENAME=""
PLATFORM_ID="platform:f40"
PRETTY_NAME="Fedora Linux 40 (Workstation Edition)"
ANSI_COLOR="0;38;2;60;110;180"
LOGO=fedora-logo-icon
CPE_NAME="cpe:/o:fedoraproject:fedora:40"
DEFAULT_HOSTNAME="fedora"
HOME_URL="https://fedoraproject.org/"
DOCUMENTATION_URL="https://docs.fedoraproject.org/en-US/fedora/f40/system-administrators-guide/"
SUPPORT_URL="https://ask.fedoraproject.org/"
BUG_REPORT_URL="https://bugzilla.redhat.com/"
REDHAT_BUGZILLA_PRODUCT="Fedora"
REDHAT_BUGZILLA_PRODUCT_VERSION=40
REDHAT_SUPPORT_PRODUCT="Fedora"
REDHAT_SUPPORT_PRODUCT_VERSION=40
SUPPORT_END=2025-05-13
VARIANT="Workstation Edition"
VARIANT_ID=workstation

$ ./os_spoofing.sh

echo "Spoofing version f32 in /etc/os-release..."k

$ ./os_spoofing.sh
echo "Restoring original /etc/os-release..."
'

# checks for 
if [[ `grep "VERSION_ID=40" /etc/os-release` ]]
then
    sudo cp /etc/os-release /etc/os-release.backup
    # searches for 40 in os-release and replaces all occurrences with 32
    sudo sed -i 's/40/32/g' /etc/os-release
    echo "Spoofing version f32 in /etc/os-release..."
else
    if [ -e /etc/os-release.backup ]
    then
        sudo cp /etc/os-release.backup /etc/os-release
        echo "Restoring original /etc/os-release..."
    else
        echo "Error - does not appear to be f40."
    fi
fi
