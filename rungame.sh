#!/bin/bash
 
function msg {
  # Description:
  #   This function echoes-with-colors the arguments passed in
  # Usage:
  #   msg 'whatever you want to print :)'
  echo -e '\033[33m\033[44m'$@'\033[0m'
}
 
function wait_until_pid_finishes {
  # Description:
  #   This function will block and wait untill the process with <pid> terminates
  # Usage:
  #       wait_until_pid_finishes <pid>
  _PID=$1
  while [ "$(kill -0 $_PID ; echo $?)" == "0" ]; do
    sleep 5
  done
}
 
if [ "$1" == "RECALLED_WITH_OPTIRUN" ]; then
  #we are being run with optirun :)
  msg "$0 starting"
 
  msg "Starting up Launcher.exe through wine"
  wine Launcher.exe
 
  # breathing to let hl2.exe start-up...
  sleep 5
  HL2_PID=$(pidof hl2.exe)
  msg "hl2.exe has PID=$HL2_PID"
 
  #wait while hl2.exe is running, until it terminates
  wait_until_pid_finishes $HL2_PID
  msg "hl2.exe has terminated"
 
  msg "$0 terminating"
  exit 0
else
  #This scripts needs to be called through optirun.
  #In order to garantee it, we re-execute using optirun
  exec optirun $0 RECALLED_WITH_OPTIRUN
fi
