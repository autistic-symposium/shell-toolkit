#!/usr/bin/env python

import os
import subprocess
import json
import socket
import logging

LOG_PATH = "/var/log/logname.log"
FORWARD_PATH = "/etc/logstash-forwarder.conf"
LOG_LEVEL = logging.DEBUG


# Set up logpath
if not os.path.isfile(LOG_PATH):

    logging.info("No {0} file. Calling: sudo touch {1}".format(LOG_PATH, LOG_PATH))
    subprocess.call("sudo touch {0}".format(LOG_PATH), shell=True)

    logging.info("Setting perms. Calling: sudo chmod 666 {0}".format(LOG_PATH))
    subprocess.call("sudo chmod 666 {0}".format(LOG_PATH), shell=True)

# Set up forwarding
if os.path.isfile(FORWARD_PATH):

    logging.info("Forwarding {0} to logstash...".format(FORWARD_PATH))
    try:
        with open(FORWARD_PATH, "r+") as f:
        data = json.load(jsonFile)

        try:
            if LOG_PATH not in data['files'][0]['paths']:
                data['files'][0]['paths'].append(LOG_PATH)
                jsonFile = open("/etc/logstash-forwarder.conf", "w+")
                jsonFile.write(json.dumps(data))

        except KeyError:
            logging.error("Could not set logstash: {0} is not well formated.".format(FORWARD_PATH))

    except IOError:
        logging.error("Could not open {0}".format(FORWARD_PATH))

else:
    hostname = socket.gethostname()

    #Search for logstash-forwarder locations per each host
    if "prodvpn" in hostname:
        logging.warning("Forwarder should be in {0}. Please set up a forwarder and try again.".format(FORWARD_PATH))

