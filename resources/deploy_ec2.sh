#!/bin/bash
cd /home/ec2-user/dice
git pull origin AWS
sudo systemctl restart diceapp
