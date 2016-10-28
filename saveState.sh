#! /bin/bash

# Save state
echo -e "\n*** saving state ***"
createOutState() {
  STATEFILES_TO_SAVE=( terraform.tfstate )
  STATEFILE_SAVE_LOCATION=/build/state/
  for f in "${STATEFILES_TO_SAVE[@]}"; do
   cp $f $STATEFILE_SAVE_LOCATION
  done
}
createOutState
