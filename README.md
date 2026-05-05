# Nationwide Semi Trailer Hire & Equipments

Western Australia's heavy duty semi trailer hire website. Perth-based, servicing all of WA.

## Pages

- **Home** (`index.html`) — Hero, services overview, fleet preview
- **About** (`about.html`) — Company story, mission, values, hire vs buy
- **Services** (`services.html`) — Hire terms, 24/7 support, maintenance, delivery
- **Fleet** (`fleet.html`) — All 10 trailer categories with photos
- **Contact** (`contact.html`) — Quote form, locations, service areas
- **FAQ** (`faq.html`) — Common questions

## Stack

Plain HTML / CSS / vanilla JS — no build step required.

## Run Locally

```bash
python3 server.py
```

Then open http://localhost:8080

The included `server.py` is a Python HTTP server that auto-resolves clean URLs (`/about` → `/about.html`).

## Structure

```
.
├── index.html, about.html, services.html, fleet.html, contact.html, faq.html
├── style.css
├── server.py
└── images/         # All trailer photos
```

## Branding

- Yellow: `#FFCD11`
- Dark: `#1a1a1a`
- Style: CAT-inspired industrial / corporate
