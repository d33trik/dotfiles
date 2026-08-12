if test -f /run/.toolboxenv
    set -gx CONTAINER_HOST "unix://$XDG_RUNTIME_DIR/podman/podman.sock"
    set -gx DOCKER_HOST "unix://$XDG_RUNTIME_DIR/podman/podman.sock"
end
