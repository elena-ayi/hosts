
#!/bin/bash

cat /etc/hosts | while read -r linie; do

ip=$(echo "$linie" | awk '{print $1}')
nume=$(echo "$linie" | awk '{print $2}')
nslookupip=$(nslookup "$nume" | grep 'Address' | tail -n 1 | awk '{print $2}'})

if [ "$nslookupip" != "$ip" ]; then
	echo "Bogus IP for $nume in /etc/hosts!"
fi
done
 
