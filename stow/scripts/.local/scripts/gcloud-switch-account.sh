#!/bin/bash

# Get list of authenticated accounts
accounts=$(gcloud auth list --format="value(account)")

if [ -z "$accounts" ]; then
    echo "No authenticated accounts found. Please run 'gcloud auth login' first."
    exit 1
fi

echo "Available authenticated accounts:"
PS3="Select account > "
select account in $accounts; do
    if [ -n "$account" ]; then
        echo "Activating account: $account"
        gcloud config set account "$account"

        if [ "$account" = "josecordero.imagemaker@latam.com" ]; then
            echo "Select environment:"
            select env in "dev" "prod"; do
                case $env in
                dev)
                    gcloud config set project revenue-management-data-dev
                    break
                    ;;
                prod)
                    gcloud config set project revenue-management-data-prod
                    break
                    ;;
                *)
                    echo "Invalid selection."
                    ;;
                esac
            done
        else
            echo "Fetching available projects..."
            projects=$(gcloud projects list --format="value(projectId)")

            if [ -z "$projects" ]; then
                echo "No projects found for account $account"
                exit 1
            fi

            echo "Available projects:"
            select project in $projects; do
                if [ -n "$project" ]; then
                    gcloud config set project "$project"
                    break
                else
                    echo "Invalid selection."
                fi
            done
        fi

        echo "-----------------------------------"
        echo "Now using account: $(gcloud config get-value account)"
        echo "Now using project: $(gcloud config get-value project)"
        echo "-----------------------------------"

        break
    else
        echo "Invalid selection."
    fi
done
