#!/usr/bin/env sh

################################################################################
# JTAG Setup Script
#
# Author: Quinn Yockey
# Date:   27 January 2025
#
# When programming FPGAs using Quartus on Linux, the upload process can often
# fail without explanation.  Restarting the JTAG daemon process as the root user
# fixes this issue.  
################################################################################

# Path to jtagconfig executable
JTAGCONFIG_PATH=$(which jtagconfig)

# Ensure jtagconfig is installed and available
if [ -z "$JTAGCONFIG_PATH" ]; then
    echo "Error: jtagconfig executable not found in PATH."
    echo "Check Quartus installation and ensure it is in your PATH."
    exit 1
fi

# Acquire superuser privileges.
echo "Requesting superuser privileges..."
sudo -v
if [ $? -ne 0 ]; then
    echo "Superuser authentication failed."
    exit 1
fi

# Terminate any running jtagd instances
echo "Terminating any running jtagd processes..."
sudo pkill -9 -f jtagd > /dev/null 2>&1
if [ $? -eq 0 ]; then
    # Reset terminal; pkill messes up output
    stty sane
    echo "jtagd processes terminated successfully."
else
    # Reset terminal; pkill messes up output
    stty sane
    echo "No jtagd processes were running."
fi

# Restart the jtagd process using the Quartus jtagconfig utility
echo "Restarting jtagd using jtagconfig..."
sudo $JTAGCONFIG_PATH
if [ $? -eq 0 ]; then
    echo "JTAG daemon restarted successfully."
else
    echo "Failed to restart jtagd. Check Quartus installation and permissions."
    exit 1
fi

exit 0

