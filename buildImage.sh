#!bin/bash
set -e

imageName="webapp"

build(){
    tag=$1
    if [ -z $tag ]; then
        echo "Tag is required in order to build a docker image"
        exit 1
    fi
    
    imageNameWithTag="$imageName:$tag"

    echo "Build app...."
    docker-compose -f docker-compose-build.yml up

    echo "Building image $imageNameWithTag"
    docker build $(pwd)/publish/WebApp/ -t "$imageNameWithTag"
}

push(){
    tag=$1
    if [ -z $tag ]; then
        echo "Tag is required in order to build a docker image"
        exit 1
    fi

    imageNameWithTag="$imageName:$tag"

    docker push $imageNameWithTag
}

#Call all args
$@