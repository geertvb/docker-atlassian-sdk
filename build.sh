#!/bin/sh

DIR=$( cd "$( dirname "$0" )" && pwd )
sudo docker build -t geertvb/atlassian-sdk $DIR
