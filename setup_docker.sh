function build () {
    podman build -t ssh_enabled .
    podman run -it -d -P --name ssh_enabled ssh_enabled /bin/bash
    return 0
}

function remove () {
    podman container rm ssh_enabled --force
    podman image rm localhost/ssh_enabled --force
    return 0
}

echo "Build docker or remove it?"
select answer in "Build" "Remove"; do
    case $answer in
        "Build" ) build; break;;
        "Remove" ) remove; break;;
    esac
done
