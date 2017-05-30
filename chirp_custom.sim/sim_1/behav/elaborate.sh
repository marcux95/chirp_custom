#!/bin/bash -f
xv_path="/mnt/685a0e98-5f99-486b-9723-51aed43b97b6/Vivado/Vivado/2016.4"
ExecStep()
{
"$@"
RETVAL=$?
if [ $RETVAL -ne 0 ]
then
exit $RETVAL
fi
}
ExecStep $xv_path/bin/xelab -wto 2a3a843ae2804f1a9cdb45297ed699b2 -m64 --debug typical --relax --mt 8 -L xil_defaultlib -L secureip -L xpm --snapshot dds_tb_behav xil_defaultlib.dds_tb -log elaborate.log
