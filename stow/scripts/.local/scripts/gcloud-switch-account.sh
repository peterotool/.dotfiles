#!/bin/bash

echo "Fetching authenticated accounts..."

# Get list of authenticated accounts
accounts=$(gcloud auth list --format="value(account)")

# Check if any accounts exist
if [ -z "$accounts" ]; then
    echo "No authenticated accounts found. Please run 'gcloud auth login' first."
    exit 1
fi

# Display accounts and let the user select one
echo "Available authenticated accounts:"
select account in $accounts; do
    if [ -n "$account" ]; then
        echo "Activating account: $account"
        gcloud config set account "$account"
        echo "Now using account: $(gcloud config get-value account)"
        break
    else
        echo "Invalid selection. Please try again."
    fi
done
