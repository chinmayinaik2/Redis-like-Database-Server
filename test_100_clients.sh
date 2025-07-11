#!/usr/bin/env fish

echo "Spawning 100 concurrent Clients..."

for i in (seq 1 100)
	echo "Spawning Client $i"
	./client set key_$i value_$i &
end

#Wait for all background jobs to finish
wait

echo "All clients finished"
