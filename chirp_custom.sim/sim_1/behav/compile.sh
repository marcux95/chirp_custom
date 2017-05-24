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
echo "xvhdl -m64 --relax -prj dds_tb_vhdl.prj"
ExecStep $xv_path/bin/xvhdl -m64 --relax -prj dds_tb_vhdl.prj 2>&1 | tee -a compile.log
