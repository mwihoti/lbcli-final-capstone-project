# Which tx in block 216,351 spends the coinbase output of block 216,128?
COINBASE_TXID=$(bitcoin-cli -datadir=config getblock $(bitcoin-cli -datadir=config getblockhash 216128) 1 | jq -r '.tx[0]')
bitcoin-cli -datadir=config getblock $(bitcoin-cli -datadir=config getblockhash 216351) 2 | jq -r --arg cb "$COINBASE_TXID" '.tx[] | select(.vin[].txid == $cb) | .txid'
