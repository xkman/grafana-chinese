#!/usr/bin/env bash

console() {
  content=$2
  case $1 in
  "br") echo -e "\033[36m------------------------------\033[0m" ;;
  "info") echo -e "\033[36m$content\033[0m" ;;
  "action") echo -e "\033[36m$content\033[0m" ;;
  "success") echo -e "\033[32m$content\033[0m" ;;
  "error") echo -e "\033[31m$content\033[0m" ;;
  "warning") echo -e "\033[33m$content\033[0m" ;;
  "danger") echo -e "\033[35m$content\033[0m" ;;
  esac
}

main() {
  console br
  console action 'Remove grafana-dev-server...'
  console action 'Stop dev-server...'
  docker stop grafana-dev-server

  console action 'Remove dev-server...'
  docker rm grafana-dev-server
  console action 'Remove dev-server data...'
  rm -rf `pwd`/tmp/grafana-dev-server
  console success 'Remove complete!'
}

main
