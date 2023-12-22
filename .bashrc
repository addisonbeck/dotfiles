source ~/.profile

if [ $(which bw) ]; then 
  alias bw-p="BITWARDENCLI_APPDATA_DIR=~/.config/bw-p && $(which bw) $@"
  alias bw-w="BITWARDENCLI_APPDATA_DIR=~/.config/bw-w && $(which bw) $@"
fi
