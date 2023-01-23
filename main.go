package bazel_gazelle_gh_1381

import "github.com/google/gopacket/pcap"

func main() {
	_, err := pcap.OpenLive("eth0", 10000, true, pcap.BlockForever)
	if err != nil {
		panic(err)
	}
}
