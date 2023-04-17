# create a redis image
docker load < $(nix-build docker/images/redis/default.nix)
