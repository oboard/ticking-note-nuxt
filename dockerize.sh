docker build --pull -t ticking-note-nuxt .
docker run -p 3000:3000 -d ticking-note-nuxt