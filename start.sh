#!/bin/bash

"${RUST_BINARY}" \
  -batchmode \
  -nographics \
  -server.ip ${RUST_IP} \
  -server.port ${RUST_PORT} \
  -rcon.ip ${RUST_IP} \
  -rcon.port ${RUST_RCON_PORT} \
  -rcon.password "${RUST_RCON_PASSWORD}" \
  -server.maxplayers ${RUST_MAX_PLAYERS} \
  -server.hostname "${RUST_SERVER_NAME}" \
  -server.identity "${RUST_SERVER_IDENTITY}" \
  -server.level "${RUST_LEVEL}" \
  -server.seed "${RUST_SEED}" \
  -server.worldsize ${RUST_WORLDSIZE} \
  -server.saveinterval ${RUST_SAVE_INTERVAL} \
  -server.globalchat ${RUST_GLOBAL_CHAT} \
  -server.description "${RUST_DESCRIPTION}" \

