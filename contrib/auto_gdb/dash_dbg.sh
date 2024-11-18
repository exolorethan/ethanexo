#!/usr/bin/env bash
# use testnet settings,  if you need mainnet,  use ~/.ethanexocore/ethanexod.pid file instead
export LC_ALL=C

ethanexo_pid=$(<~/.ethanexocore/testnet3/ethanexod.pid)
sudo gdb -batch -ex "source debug.gdb" ethanexod ${ethanexo_pid}
