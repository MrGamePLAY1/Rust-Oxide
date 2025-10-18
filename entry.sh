echo "Starting Rust Dedicated Server with Oxide..."
./RustDedicated -batchmode -nographics \
    +server.port 28015 \
    +server.queryport 28016 \
    +server.hostname "${SERVER_NAME:-My Oxide Rust Server}" \
    +server.identity "${SERVER_IDENTITY:-oxide_server}" \
    +rcon.port ${RCON_PORT:-28017} \
    +rcon.password "${RCON_PASSWORD:-changeme}" \
    +rcon.web 1