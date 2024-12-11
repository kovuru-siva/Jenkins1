
#!/bin/bash


while true; do
	REGION=("ap-south-1" "us-east-1")
    read -p "Enter a number between 1 and 10: " user_input
    if [[ "${REGION[@]}" =~ "${user_input}" ]]; then
        echo "Valid input: $user_input"
        break
    else
        echo "Invalid input. Please try again."
    fi
done

