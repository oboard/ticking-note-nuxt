docker build --pull -t ticking-note-nuxt .
docker ps -a --filter "name=ticking-note-nuxt*" -q | xargs docker stop
docker ps -a --filter "name=ticking-note-nuxt*" -q | xargs docker rm
docker run --name ticking-note-nuxt --restart always -p 3000:3000 -d ticking-note-nuxt