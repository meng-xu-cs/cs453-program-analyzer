#!/bin/bash -e

# sanity check
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <path-to-package-directory>"
    exit 1
fi

# configuration
PKG=$(readlink -f $1)
WKS=output-symcc
CMD=$(cat <<END
    rm -rf ${WKS} && mkdir ${WKS} &&
    /afl/afl-clang main.c -o ${WKS}/main-afl &&
    symcc main.c -o ${WKS}/main-sym &&
    sysctl -w kernel.core_pattern=core.%e.%p &&
    screen -dmS afl-0 -- \
        /afl/afl-fuzz -M afl-0 -i input -o ${WKS}/output -- ${WKS}/main-afl &&
    screen -dmS afl-1 -- \
        /afl/afl-fuzz -S afl-1 -i input -o ${WKS}/output -- ${WKS}/main-afl &&
    sleep 10 &&
    symcc_fuzzing_helper -o ${WKS}/output -a afl-1 -n symcc -- ${WKS}/main-sym &&
    screen -r afl-0
END
)

# entrypoint
docker run \
    --tty --interactive \
    --volume ${PKG}:/test \
    --workdir /test \
    --rm symcc \
    bash -c "${CMD}"
