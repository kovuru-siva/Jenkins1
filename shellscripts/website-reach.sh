
#!/bin/bash

# Variables
URL="http://localhost:8081" # URL to check
TIMEOUT=30                # Timeout in seconds
INTERVAL=5                # Interval between checks in seconds

# Function to check website
check_website() {
    if curl -s --head --request GET "$URL" | grep "200 OK" > /dev/null; then
        echo "Website $URL is reachable."
        return 0
    else
        echo "Website $URL is not reachable."
        return 1
    fi
}

# Main Logic
START_TIME=$(date +%s)
while true; do
    check_website
    if [ $? -eq 0 ]; then
        echo "Exiting as the website is reachable."
        exit 0
    fi

    CURRENT_TIME=$(date +%s)
    ELAPSED_TIME=$((CURRENT_TIME - START_TIME))

    if [ $ELAPSED_TIME -ge $TIMEOUT ]; then
        echo "Timeout reached ($TIMEOUT seconds). Stopping execution."
        exit 1
    fi

    echo "Retrying in $INTERVAL seconds..."
    sleep $INTERVAL
done
