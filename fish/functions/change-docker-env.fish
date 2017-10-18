function change-docker-env
    echo "changing docker env to $argv"
    eval (docker-machine env $argv)
    docker-machine ls
end
