# Quartus JTAG Setup

*A simple shell script to fix issues programming FPGAs running Quartus Prime on
Linux.*  

## Problem Addressed

This script was created for the Oregon State University course ECE 272: Digital
Logic Design.  In lab, Quartus Prime software is used to upload hardware designs
to Altera Max 10 DE10-Lite FPGAs.  For students running Linux, the process of
programming the FPGA can fail.  This is because the USB blaster JTAG daemon is
running as the standard user.  

## Overview

A quick fix is to kill any existing JTAG processes and restart them as the root
user.  Note that this is not a secure solution, but it will be perfectly fine
for students in lab.  

## Disclaimer

I understand that running mystery scripts from the internet, especially ones
that require root privileges, can be sketchy.  Please feel free to inspect it to
verify it is safe.

## Script Usage

To use this script, first download it anywhere on your machine (ideally
somewhere you'll remember since you'll likely need it every week of the term).
Next, make sure that your user has execution permissions for the script.
Finally, execute the script.

In a terminal, run the following commands:

```sh
# Download script
wget https://raw.githubusercontent.com/qyockey/quartus_jtag_setup/refs/heads/main/jtag_setup.sh

# Allow execution
chmod +x jtag_setup.sh

# Execute script
./jtag_setup.sh
```

In theory, you should now be able to program your FPGA in Quartus.  If for some
reason the script doesn't work, please file a pull request or send me an email
at <[yockeyq@oregonstate.edu](mailto:yockeyq@oregonstate.edu)> (Active until my
graduation in June 2027).

