#!/bin/sh

set -e

# Get All Submodule Paths
git config -f .gitmodules --get-regexp '^submodule\..*\.path$' |
    # Loop Through Each Submodule
    while read path_key local_path
    do
        # Construct URL Key for Submodule
        url_key=$(echo $path_key | sed 's/\.path/.url/')
        # Retrieve the Submodule's URL
        url=$(git config -f .gitmodules --get "$url_key")
        # Add the Submodule
        git submodule add $url $local_path
    done