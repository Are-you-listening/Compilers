# uses libraries to create flame graph of our code
#curl -O https://raw.githubusercontent.com/brendangregg/FlameGraph/master/stackcollapse-perf.pl
#curl -O https://raw.githubusercontent.com/brendangregg/FlameGraph/master/flamegraph.pl
chmod 777 stackcollapse-perf.pl
chmod 777 flamegraph.pl
sudo apt install linux-tools-6.5.0-28-generic -y
sudo apt install linux-cloud-tools-6.5.0-28-generic -y
lli_pid=$(pgrep lli)
gcc_pid=$(pgrep gcc)


sudo perf record -o output/profile.perf -a -B -g python3 -m unittest discover -v
sudo chmod 777 output/profile.perf
# shellcheck disable=SC2094
#(perf script -i output/profile.perf | grep -v 'lli') > output/filtered_profile.perf
#chmod 777 output/filtered_profile.perf
perf script -i output/profile.perf | grep -v -E 'lli|gcc|G1' > output/perf.script
chmod 777 output/perf.script

grep '/path/to/src/' output/perf.script > output/perf.script

./stackcollapse-perf.pl output/perf.script > output/perf.folded



chmod 777 output/perf.folded
./flamegraph.pl --width 3000 output/perf.folded > output/output.svg