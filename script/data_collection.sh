#!/bin/bash

simpan_file="/home/kali/cron"
nama_file=$(date +"cron_%m%d%Y_%H.%M.csv")
lokasi_file="$simpan_file/$nama_file"

mkdir -p "$simpan_file"

#ubah sumber data sesuai dengan resource yang dituju
sumber_data="https://dummyjson.com/products"

echo "info : Pengumpulan data pada $(date)"   
echo "info : Data tersimpan pada $lokasi_file"

#ubah data apa saja yang ingin di ambil
curl -s "$sumber_data" | jq -r '["id", "title", "brand", "price"], (.products[] | [.id, .title, .brand, .price]) | @csv' > "$lokasi_file"

if [ $? -eq 0 ]; then
  echo "info : Data berhasil dikumpulan, tersimpan di $lokasi_file"
else
  echo "info : Gagal dalam mengumpulkan data"
  rm -f "$lokasi_file"
fi

echo "info : Pemrosesan selesai"
