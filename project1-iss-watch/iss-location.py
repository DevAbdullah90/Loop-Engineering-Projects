#!/usr/bin/env python3
"""Fetch the current location of the International Space Station."""

import json
import urllib.request
from datetime import datetime

def get_iss_location():
    url = "http://api.open-notify.org/iss-now.json"
    try:
        with urllib.request.urlopen(url, timeout=10) as response:
            data = json.loads(response.read().decode())
            
            latitude = data["iss_position"]["latitude"]
            longitude = data["iss_position"]["longitude"]
            timestamp = datetime.fromtimestamp(data["timestamp"]).strftime("%Y-%m-%d %H:%M:%S UTC")
            
            print(f"ISS Location at {timestamp}:")
            print(f"  Latitude:  {latitude}")
            print(f"  Longitude: {longitude}")
            print(f"  Map: https://www.google.com/maps?q={latitude},{longitude}")
            return True
    except Exception as e:
        print(f"Error fetching ISS location: {e}")
        return False

if __name__ == "__main__":
    get_iss_location()
