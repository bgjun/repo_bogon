#+++Must env
export TERM=xterm
export SHELL=/bin/bash
#---Must env

#+++Must env or not. 
export ARMBIN_ARMSD=/pkg/qct/software/arm/RVDS/2.2BLD593/RDI/armsd/1.3.1/66/linux-pentium/armsd
export ARMCONF=/pkg/qct/software/arm/RVDS/2.2BLD593/RDI/armperip/1.3/50:/pkg/qct/software/arm/RVDS/2.2BLD593/RVARMulator/v6ARMulator/1.4.1/261/linux-pentium:/pkg/qct/software/arm/RVDS/2.2BLD593/RVARMulator/ARMulator/1.4.1/253/linux-pentium
export RVCT22BIN=/pkg/qct/software/arm/RVDS/2.2BLD593/RVCT/Programs/2.2/503/linux-pentium
export PATH=/bin:/pkg/qct/software/arm/RVDS/2.2BLD593/bin/linux-pentium:/pkg/qct/software/arm/RVDS/2.2BLD593/RVD/Core/1.8.1/464/linux-pentium/bin:/opt/rational/clearcase/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/pkg/CodeSourcery/Sourcery_G++_Lite/bin:/pkg/bin:/pkg/qct/software/arm/RVDS/2.2BLD593/RVCT/Programs/2.2/503/linux-pentium:/pkg/qct/software/arm/RVDS/2.2BLD593/Utilities/FLEXlm/9.2/release/linux-pentium:.:/opt/rational/clearcase/bin:/opt/rational/clearcase/etc/utils
export HLPPATH=/pkg/qct/software/arm/RVDS/2.2BLD593/Documentation/RVD/1.8.1/release/unix/onlinehelp
export JAVA_HOME=/pkg/jdk/jdk1.6.0_23
export ARMDLL=/pkg/qct/software/arm/RVDS/2.2BLD593/RVARMulator/v6ARMulator/1.4.1/261/linux-pentium:/pkg/qct/software/arm/RVDS/2.2BLD593/RDI/rdimsvr/1.3.1/91/linux-pentium:/pkg/qct/software/arm/RVDS/2.2BLD593/RDI/Targets/Remote_A/1.3.1/98/linux-pentium:/pkg/qct/software/arm/RVDS/2.2BLD593/RVARMulator/ARMulator/1.4.1/253/linux-pentium
export RVDS_TOPDIR=/pkg/qct/software/arm/RVDS/2.2BLD593
export RVDEBUG_WEB_BROWSER=/usr/bin/htmlview
export RVDEBUG_INSTALL=/pkg/qct/software/arm/RVDS/2.2BLD593/RVD/Core/1.8.1/464/linux-pentium
export RVDEBUG_HLPPATH=/pkg/qct/software/arm/RVDS/2.2BLD593/Documentation/RVD/1.8.1/release/unix/onlinehelp
export ARMROOT=/pkg/qct/software/arm/RVDS/2.2BLD593
export RVCT22LIB=/pkg/qct/software/arm/RVDS/2.2BLD593/RVCT/Data/2.2/503/lib
export HHHOME=/pkg/qct/software/arm/RVDS/2.2BLD593/Documentation/HyperHelp/5.2.0/release/linux-pentium/
export RVCT22INC=/pkg/qct/software/arm/RVDS/2.2BLD593/RVCT/Data/2.2/503/include/unix
#---Must env or not

# customize path
MODEL=57K_EF
WORKSPACE=~/workspace
PROJECT=$WORKSPACE/57K
BUILE_SCRIPT_PATH=$PROJECT/MSM8974_JB
LOG_DIR=~/log
PDL_DIR=~/pdl
PDL_MODEL_DIR=~/pdl/$MODEL
LOG_FILE=$LOG_DIR/57k_result.txt
PDL_PATH=$BUILE_SCRIPT_PATH/TOOLS/PDL

cd ~
mkdir $LOG_DIR
mkdir $PDL_DIR
mkdir $PDL_MODEL_DIR

# Optional, move pdl & log
mv -f $PDL_PATH/*.pdl $PDL_MODEL_DIR/
rm -f $LOG_FILE

echo "#############################################" >> $LOG_FILE
echo "auto build script start" >> $LOG_FILE
date >> $LOG_FILE
echo "---------------------------------------------" >> $LOG_FILE
cd ~

cd $PROJECT

echo "Update workspace start" >> $LOG_FILE
date >> $LOG_FILE
echo "---------------------------------------------" >> $LOG_FILE

# customize pscm command or option
cm update . --override >> $LOG_FILE

# Remove private files
find ./ -name *.private.* -exec rm -f {} \; >>$LOG_FILE

echo "---------------------------------------------" >> $LOG_FILE
echo "Update workspace end" >> $LOG_FILE
date >> $LOG_FILE

echo "---------------------------------------------" >> $LOG_FILE
cd $BUILE_SCRIPT_PATH

echo "---------------------------------------------" >> $LOG_FILE
echo "update api start" >> $LOG_FILE
date >> $LOG_FILE
echo "---------------------------------------------" >> $LOG_FILE

# customize build option(update api)
./BUILD.sh u >> $LOG_FILE

echo "---------------------------------------------" >> $LOG_FILE
echo "update api end" >> $LOG_FILE
date >> $LOG_FILE
echo "---------------------------------------------" >> $LOG_FILE

echo "clean build start" >> $LOG_FILE
date >> $LOG_FILE
echo "---------------------------------------------" >> $LOG_FILE

# customize build option(clean& build all)
./BUILD.sh 81 >> $LOG_FILE

# customize move pdl
mv -f  $PDL_PATH/*.pdl $PDL_MODEL_DIR/

echo "---------------------------------------------" >> $LOG_FILE
echo "clean build end" >> $LOG_FILE
date >> $LOG_FILE
echo "---------------------------------------------" >> $LOG_FILE
echo "auto build script end" >> $LOG_FILE
date >> $LOG_FILE
echo "#############################################" >> $LOG_FILE