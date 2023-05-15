pkgs:
let
  redis = with pkgs;[
    redis
    redis-dump
    redli
  ];
in
redis
