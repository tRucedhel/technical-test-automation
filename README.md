##fitur :
1. Pengumpulan data (data_collection.sh)
2. Penghapusan data > 30 hari (data_clean.sh)

##syarat :
1. Sistem yang digunakan berbasi Linux
2. cron : daemon terinstall
3. curl : curl terinstall, untuk mengambil data dari URL
4. jq : jq terinstall untuk memproses data berupa JSON

apabila belum terinstall syarat dari curl dan jq
(sudo apt-get install curl jq -y)

##cara menjalankan :
1. masuk ke terminal/bash 
2. git clone "https://github.com/tRucedhel/technical-test-automation.git"
3. chmod +x script/data_clean.sh
4. chmod +x script/data_collection.sh
5. crontab -e
6. setelah menampilakn editor nano dari crontab, masukkan script berikut 
```
0 8,12,15 * * * "lokasi_file_data_collection.sh"  >> /home/cron/data_collection.log 2>&1
0 2 * * * "lokasi_file_data_clean.sh" >> /home/cron/data_clean.log 2>&1
```
8. simpan dan tutup editor nano dari crontab

##informasi
1. setelah jam 08:00, atau 12:00, atau 15:00 periksa direktori pada home/cron
2. dan juga terdapat file log untuk melihat output dari eksekusi skrip
