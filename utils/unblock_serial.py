#!/usr/bin/env python3
import serial
from argparse import ArgumentParser


if __name__ == "__main__":
    parser = ArgumentParser()
    parser.add_argument(
        "port",
        help="The serial port to connect to (eg. /dev/ttyS3)",
    )

    args = parser.parse_args()

    # Just open the serial port and close it. This will reset it
    try:
        with serial.Serial(args.port):
            pass
    except:
        print("Could not open port: %s" % (args.port))
