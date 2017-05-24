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
ExecStep $xv_path/bin/xsim dds_tb_behav -key {Behavioral:sim_1:Functional:dds_tb} -tclbatch dds_tb.tcl -view /home/marco/chirp_custom/lut_tb_behav.wcfg -log simulate.log
