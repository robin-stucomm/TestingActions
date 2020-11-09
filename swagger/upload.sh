#!/bin/bash
swagger=("private" "public")
projectVersion=$(./gradlew properties --no-daemon --console=plain -q | grep "^version:" | awk '{printf $2}')
echo "Generating the public swagger definition"
# ./gradlew generatePublic -q
echo "Generating the private swagger definition"
# ./gradlew generatePrivate -q
echo "Uploading versions: $projectVersion"
for job in "${swagger[@]}"; do
    tag="swagger-$job:$projectVersion"
    echo "$tag"
done