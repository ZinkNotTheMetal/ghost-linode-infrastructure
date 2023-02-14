#!/bin/bash
TOKEN=$1

# Currently only works for one single nodebalancer - but IMO better than forgetting about it

NODEBALANCERID=$(curl -H "Authorization: Bearer $TOKEN" \
    https://api.linode.com/v4/nodebalancers | grep -Po '"id": \K[0-9]{1,20}')

if [ -z "$NODEBALANCERID" ]
then
      echo "No existing Node balancer found in linode..."
      echo "Node balancers successfully cleaned up"
      exit 0
else
      echo "Node balancer found in linode! - $NODEBALANCERID"
      echo "Removing Node balancer..."

      curl -H "Authorization: Bearer $TOKEN" \
        -X DELETE \
        https://api.linode.com/v4/nodebalancers/$NODEBALANCERID

      echo "Successfully removed $NODEBALANCERID"
      exit 0
fi