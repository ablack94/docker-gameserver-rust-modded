FROM cm2network/steamcmd:latest

ENV OXIDE_RELEASE=2.0.6380

ENV RUST_BINARY="/home/steam/rust/RustDedicated"
ENV RUST_IP=0.0.0.0
ENV RUST_PORT=28015
ENV RUST_RCON_PORT=28016
ENV RUST_RCON_PASSWORD=root
ENV RUST_MAX_PLAYERS=75
ENV RUST_SERVER_NAME="rust-world"
ENV RUST_SERVER_IDENTITY="rust_world"
ENV RUST_LEVEL="Procedural Map"
ENV RUST_SEED=12345
ENV RUST_WORLDSIZE=3000
ENV RUST_SAVE_INTERVAL=300
ENV RUST_GLOBAL_CHAT=true
ENV RUST_DESCRIPTION="my rust server"

USER root

RUN apt-get update -y \
 && apt-get install -y unzip

USER steam

# Install the rust dedicated server
#RUN ./steamcmd.sh +force_install_dir /home/steam/rust +login anonymous +app_update 258550 +quit
COPY --from=ab/games/rust:latest --chown=steam:steam /home/steam/rust /home/steam/rust
# Install Oxide mods
RUN mkdir -p /home/steam/downloads \
 && cd /home/steam/downloads \
 && curl -LJO https://github.com/OxideMod/Oxide.Rust/releases/download/${OXIDE_RELEASE}/Oxide.Rust-linux.zip \
 && cd /home/steam/rust \
 && unzip -o /home/steam/downloads/Oxide.Rust-linux.zip

COPY --chmod=0755 start.sh /home/steam/start.sh

WORKDIR /home/steam/rust
CMD ["/home/steam/start.sh"]

