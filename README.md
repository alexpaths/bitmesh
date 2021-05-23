# bitmesh
WiFi mesh networking for the Umbrel Bitcoin Node

**Disclaimer:** I'm not a software dev. This code is forever alpha. Please contribute, fork and refine. Thanks!

**USA FCC Compliance:** Using the built-in WiFi or any commercial dongle complies with Part 15 rules. Please verify with your jurisdiction as to the limitations of WiFi devices. Contributors are not responsible for modifications which allow high power transmissions. 

**Risks:** Operating any radio leaves you open to radio direction finding. If you are in a Bitcoin hostile environment, use your own judgement.

## Why 

The Bitcoin network operates on the Internet. This leaves it open to censorship and other attacks. While services such as [Blockstream Satellite](https://blockstream.com/satellite/) allow for remote nodes to remain up-to-date with the blockchain, there is no way yet to send transactions in an off-grid scenario.

Mesh technology allows stranded networks (across firewalled borders) to create RF links hill top to hill top. 

Because this limits the need for additional items for Internet connections (routers, NAT, etc), the reduced electricity usage could reduce carbon footprint. 

The goal is to blend [High Speed Multimedia Mesh (HSMM)](http://www.olsr.org/mediawiki/index.php/OLSR_network_deployments) technology I use in the [amateur radio hobby](https://www.arednmesh.org/) with the [Umbrel](https://getumbrel.com/) node. 

## Concept of Operation

Umbrel Nodes running this app will use the built-in WiFi device to create a mesh network between other nodes. The Bitcoin, Lightning and Sphinx Ports are open on this mesh[^1]. To the Umbrel, this looks just like another IP link. Transactions and other data flow as they would over any other network. 

Nodes can upgrade  WiFi devices to the legal limits allowing for longer ranges. In a suburban or urban environment, this mesh technology should allow the circular economy to function.

Any number of nodes can be connected to the Internet as usual. Nodes which are stranded from the Internet will send transactions through these connected nodes. 





[^1]: No other ports are open on the mesh. 