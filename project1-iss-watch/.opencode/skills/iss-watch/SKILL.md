---
name: iss-watch
description: Shows the current location of the International Space Station (ISS). Use when asked about the ISS position or location.
allowed-tools: [Bash, Read]
---

# ISS Watch

Fetch and display the current location of the International Space Station.

## Steps

1. Run the ISS location script:
   ```bash
   python iss-location.py
   ```

2. Display the output to the user, including:
   - The timestamp of the reading
   - Latitude and longitude
   - A clickable map link

## Notes

- The ISS orbits Earth at about 28,000 km/h (17,500 mph)
- The API returns real-time position data
- The map link opens Google Maps centered on the ISS location
