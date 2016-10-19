#! /bin/bash

# Save state
echo -e "\n*** saving state ***"
createOutState() {
  STATEFILE_LOCATION=/build/state/
  cp terraform.tfstate $STATEFILE_LOCATION
}
createOutState
