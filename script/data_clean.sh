#!/bin/bash

lokasi_target="/home/kali/cron"

echo "info : Pembersihan data di $lokasi_target pada $(date)"

if [ ! -d "$lokasi_target" ]; then
  echo "info : Lokasi $lokasi_target tidak ditemukanm. Proses dibatalkan"
  exit 1
fi

find "$lokasi_target" -type f -name "cron_*.csv" -mtime +30 -print -delete

echo "info : Pembersihan data telah selesai."
