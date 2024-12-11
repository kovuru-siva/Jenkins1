
#!/bin/bash

log_file="/var/log/xrdp.log"

while IFS= read -r line; do
    echo "$line"
done

