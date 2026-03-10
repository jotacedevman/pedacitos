#!/bin/sh

# This work is marked CC0 1.0 Universal.
# To view a copy of this mark,
# visit https://creativecommons.org/publicdomain/zero/1.0/

# Safe mode
set -euo pipefail

option=0
in_file=""
out_dir=""

main() {
  
  echo ""
  echo "1. Montar uma imagem"
  echo "2. Desmontar uma imagem"
  echo -n "Digite a opção de sua escolha [1 ou 2]: "
  read option
  
  if [ $option -eq 1 ]; then
    echo -n "Digite o caminho completo do arquivo que deseja montar: "
    read in_file
    echo -n "Digite o diretório para a montagem: "
    read out_dir
    mkdir "/mnt/$out_dir"
    mount -o loop "$in_file" "/mnt/$out_dir"
  elif [ $option -eq 2 ]; then
    echo -n "Digite o diretório que deseja desmontar: "
    read out_dir
    umount "/mnt/$out_dir"
    rmdir "/mnt/$out_dir"
  fi
  
}

# Execute the script
main
