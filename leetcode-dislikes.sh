#!/bin/bash

# Check if a title slug is provided as an argument ($1 is the first argument passed to the script)
if [ -z "$1" ]; then
  # If no argument is provided, print usage information and exit with status code 1
  echo "Incorrect question name syntax. Make sure the question name is smallcase and if there is space in the question name, replace it with '-'. Example: leetcode-dislikes two-sum."
  exit 1
fi

# Assign the first argument to TITLE_SLUG
TITLE_SLUG=$1

# Construct the JSON payload for the GraphQL request using a here document (EOF)
# This payload contains the query and the variable with the provided title slug
JSON_PAYLOAD=$(cat <<EOF
{
  "query": "query getQuestion(\$titleSlug: String!) { question(titleSlug: \$titleSlug) { likes, dislikes } }",
  "variables": {
    "titleSlug": "$TITLE_SLUG"
  }
}
EOF
)

# Send a POST request to the LeetCode GraphQL API using cURL
# -s: Silent mode (no progress or error messages)
# -X POST: Specifies the request method as POST
# -H "Content-Type: application/json": Sets the request header to indicate JSON content
# -H "Accept: application/json": Sets the request header to accept JSON responses
# -H "User-Agent: Mozilla/5.0": Adds a User-Agent header to simulate a web browser
# -d "$JSON_PAYLOAD": Sends the JSON payload in the request body
RESPONSE=$(curl -s -X POST https://leetcode.com/graphql \
  -H "Content-Type: application/json" \
  -H "Accept: application/json" \
  -H "User-Agent: Mozilla/5.0" \
  -d "$JSON_PAYLOAD")

# Use jq to parse the JSON response and extract the likes and dislikes count
# .data.question.likes: Navigates the JSON structure to get the likes value
# .data.question.dislikes: Navigates the JSON structure to get the dislikes value
LIKES=$(echo $RESPONSE | jq '.data.question.likes')
DISLIKES=$(echo $RESPONSE | jq '.data.question.dislikes')

# Calculate the total votes and dislike percentage
TOTAL_VOTES=$((LIKES + DISLIKES))
if [ "$TOTAL_VOTES" -gt 0 ]; then
  DISLIKE_PERCENTAGE=$(echo "scale=2; ($DISLIKES / $TOTAL_VOTES) * 100" | bc)
else
  DISLIKE_PERCENTAGE=0
fi

# Check if the likes or dislikes count was found 
if [ "$LIKES" == "null" ] || [ "$DISLIKES" == "null" ]; then
  # If likes or dislikes is null, it likely means the title slug is incorrect or not found
  echo "No likes or dislikes found for the problem '$TITLE_SLUG'. Check if the problem title slug is correct."
else
  # Otherwise, print the number of likes and dislikes, and the dislike percentage
  echo "Dislikes for '$TITLE_SLUG': $DISLIKES"
  echo "Likes for '$TITLE_SLUG': $LIKES"
  echo "Dislike Percentage for '$TITLE_SLUG': $DISLIKE_PERCENTAGE%"
fi