#!/bin/bash

# This is parity aura validators parser, it will parse into spec.json
validators=[;
alloc=;
specfile=./aura-spec.json
chain_name=drrrr

for f in $(ls accounts);
do
  validator=$(cat accounts/$f);
  validators+=\"$validator\",;
  alloc=$alloc\"$validator\"": { \"balance\": \"1000000000000000000000000000\" },";
done;

validators=${validators::-1}]
alloc=${alloc::-1}

echo "$validators";
echo
echo "$alloc";

echo "I am fetching the specfile"

curl -v https://gist.githubusercontent.com/blazejkrzak/7f6f1289401050393658d08db53db25b/raw/efc8da86608e6be8959d29d4a4f3b42749a4606c/awsevmauthorityround.json -o $specfile
sed -i s/NAME_REPLACE_MARKER/$chain_name/ $specfile
sed -i s/LIST_REPLACE_MARKER/$validators/ $specfile
sed -i s/ACCOUNTS_REPLACE_MARKER/"$alloc"/ $specfile

