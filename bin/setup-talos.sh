#!/bin/bash

# ***** BEGIN LICENSE BLOCK *****
# Version: MPL 1.1/GPL 2.0/LGPL 2.1
#
# The contents of this file are subject to the Mozilla Public License Version
# 1.1 (the "License"); you may not use this file except in compliance with
# the License. You may obtain a copy of the License at
# http://www.mozilla.org/MPL/
#
# Software distributed under the License is distributed on an "AS IS" basis,
# WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
# for the specific language governing rights and limitations under the
# License.
#
# The Original Code is Mozilla Eideticker.
#
# The Initial Developer of the Original Code is
# Mozilla foundation
# Portions created by the Initial Developer are Copyright (C) 2011
# the Initial Developer. All Rights Reserved.
#
# Contributor(s):
#   William Lachance <wlachance@mozilla.com>
#
# Alternatively, the contents of this file may be used under the terms of
# either the GNU General Public License Version 2 or later (the "GPL"), or
# the GNU Lesser General Public License Version 2.1 or later (the "LGPL"),
# in which case the provisions of the GPL or the LGPL are applicable instead
# of those above. If you wish to allow use of your version of this file only
# under the terms of either the GPL or the LGPL, and not to allow others to
# use your version of this file under the terms of the MPL, indicate your
# decision by deleting the provisions above and replace them with the notice
# and other provisions required by the GPL or the LGPL. If you do not delete
# the provisions above, a recipient may use your version of this file under
# the terms of any one of the MPL, the GPL or the LGPL.
#
# ***** END LICENSE BLOCK *****

set -e

export PATH=$(dirname $0):$PATH

TALOS_DIR=$(dirname $0)/../src/talos

if [ $# -ne 3 ]
then
  echo "Usage: `basename $0` <device ip> <webserver path> <fennec appname>"
  exit 1
fi

DEVICE_IP=$1
WEBSERVER_ADDRESS=$2
FENNEC_APP=$3

cd $TALOS_DIR && python remotePerfConfigurator.py -v -e $FENNEC_APP \
    --activeTests ts --sampleConfig remote-videocapture.config --noChrome \
    --resultsServer ' ' --resultsLink ' ' \
    --videoCapture \
    --remoteDevice=$DEVICE_IP \
    --webServer $WEBSERVER_ADDRESS \
    --output eideticker.config
