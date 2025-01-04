#!/bin/bash

# Get list of authenticated accounts
accounts=$(gcloud auth list --format="value(account)")

# Check if any accounts exist
if [ -z "$accounts" ]; then
    echo "No authenticated accounts found. Please run 'gcloud auth login' first."
    exit 1
fi

# Display accounts and let the user select one
echo "Available authenticated accounts:"
PS3="> "
select account in $accounts; do
    if [ -n "$account" ]; then
        echo "Activating account: $account"
        gcloud config set account "$account"
        echo "Now using account: $(gcloud config get-value account)"

        # Check if this is the special account
        if [ "$account" = "josecordero.imagemaker@latam.com" ]; then
            echo "Setting project to revenue-management-data-dev..."
            gcloud config set project revenue-management-data-dev
            echo "Now using project: $(gcloud config get-value project)"
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
                    echo "Setting project to: $project"
                    gcloud config set project "$project"
                    echo "Now using project: $(gcloud config get-value project)"
                    break
                else
                    echo "Invalid selection. Please try again."
                fi
            done
        fi
        break
    else
        echo "Invalid selection. Please try again."
    fi
done
