01) What tools would you use to profile memory?
	CLRProfiler, Redgate Memory Profiler
02) How can you verify queries EF is generating under the hood?
	SQL Profiler, while debugging use ToTraceString(), you'll need to cast your IQueryable to ObjectQuery
03) What is IO bound and CPU bound mean?
	IO bound means read/write to disk or network read/write would go faster if IO subsystem is faster (SSD hard drive possibly)
	CPU bound means calculations would be faster if CPU were faster
04) What are anemic domain models
	Domain models that have no behavior. The behavior is usually in code-behind, click events, controllers, or helper classes such as manager, helper, service, processor, etc.
	A true domain model has data and behavior
05) What are invariants?
	Pieces of information that makes an object real or valid. A zebra without strips is not a zebra, it's a horse
	To implement a valid object, dump the default constructor and create one passing in all required fields
	Nail down your encapsulation, private setters, only allow clients to update fields they are allowed to update
06) How do you get rid of switch statements?
	You leverage polymorphism
07) What's the difference between http and https?
	http (Hypertext Transfer Protocol) for data communication between browser and server, request/response protocol
	https (Hypertext Transfer Protocol Secure) is http wrapped in SSL which encrypts communications between browser and server
08) Describe SSL and TLS, what's the difference?
	TLS (Transport Layer Security) protocol is the successor of SSL (Secure Sockets Layer) protocol, more secure. SSL is the predecessor of TLS
	Step 1: You purchase an SSL certificate (public/private key pair) from a Certificate Authority or CA (Comodo, Verisign) and install it on your web server. 
			Make sure you ask for SHA 256 (SHA 2), you create Certificate Signing Request (CSR) on your server. This process creates the private and public keys on your server.
			The CSR data file that you send to the SSL Certificate issuer (called a Certificate Authority or CA) contains the public key. The CA uses the CSR data 
			file to create a data structure to match your private key without compromising the key itself. The CA never sees the private key.
			The most important part of an SSL Certificate is that it is digitally signed by a trusted CA like DigiCert. Anyone can create a certificate, but browsers 
			only trust certificates that come from an organization on their list of trusted CAs. Browsers come with a pre-installed list of trusted CAs, known as the 
			Trusted Root CA store. In order to be added to the Trusted Root CA store and thus become a Certificate Authority, a company must comply with and be audited 
			against security and authentication standards established by the browsers. An SSL Certificate issued by a CA to an organization and its domain/website verifies 
			that a trusted third party has authenticated that organization’s identity. Since the browser trusts the CA, the browser now trusts that organization’s identity 
			too. The browser lets the user know that the website is secure, and the user can feel safe browsing the site and even entering their confidential information.
	Step 2: Browser connects to a web server (website) secured with SSL (https). Browser requests that the server identify itself.
	Step 3: Server sends a copy of its SSL Certificate, including the server’s public key.
	Step 4: Browser checks the certificate root against a list of trusted CAs and that the certificate is unexpired, unrevoked, and that its common name is valid for the website that it is connecting to. 
			If the browser trusts the certificate, it creates, encrypts, and sends back a symmetric session key using the server’s public key.
	Step 5: Server decrypts the symmetric session key using its private key and sends back an acknowledgement encrypted with the session key to start the encrypted session.
	Step 6: Server and Browser now encrypt all transmitted data with the session key.
09) How does digitally signing something work?
	Digital signatures are typically made in a two-step process. The first step is to use a secure hashing algorithm on the data. SHA-2 algorithms would be an example of that. 
	The second step is to encrypt the resulting output with the private signing key. Thus, when a signature is verified by the public key, it decrypts to a hash matching the message. 
	That hash can only be decrypted using the public key if it were encrypted with the private signing key. Public keys are created by the keypair owner. Certificate authorities 
	sign the public key's certificate. Server owners install that signed certificate. In SSL (which I assume you're referring to), the certificate including the key and signature 
	from the certificate authority is passed by the server you're connected to. You software checks that the site it's connecting to matches the data in the certificate, and 
	validates the certificate by checking its signature against the certificate authority's key. Certificate authorities use their keys for signing and servers use their keys for encryption.
	Step 1: Sender sends the original data, the encrypted data, the public key, and information about how to verify the signature (for example, what algorithm is being used)
	Step 2: Verifier performs the decrypt operation above and compares his output with the original data. If the two are the same, he knows that the message was not tampered with, because only
			the sender has the private key, and there is no reasonable way to determine the private key from the public key
10) What is TCP/IP? The de facto standard for modern data communications across all networks including the Internet. Two key TCP/IP features support decentralization: 1) End node verification: the
	two endpoints of any data transfer are responsible for making sure it was successful = no centralized control scheme. 2) Dynamic routing: End nodes can transfer data over multiple paths, and 
	the network chooses the best (fastest, most reliable) path for each individual data transfer. Application Layer > Transport Layer > Internet Layer > Net Access Layer. The applications you use
	forwards data to the application layer which uses HTTP, SMTP, FTP. Data is then transferred (ports) to the Transport Layer uses TCP or UDP (low latency, gaming). Once TCP gets the data,
	it chops it up into smaller chunks or packets where they can individually take the quickest route over the internet to get to wherever it is they are going. TCP slaps a header onto each packet
	that contains instructions on what order to reasemble the packets into as well as error checking information so that receiving computer knows whether the packet data arrived without any mishap.
	The packets are then pushed onto the Internet Layer which uses IP or Internet Protocol to attach both origin and destination IP address. Data is then sent Network Layer which handles things
	like mac addressing so packets go to the right physical machine.
	TCP/IP (Transmission Control Protocol, Internet Protocol) is a set of data transfer protocols used by modern data networks. 
	Data network: a group of computers and other devices that communicate over a shared medium
	Data & requests for data are transmitted between computers over the network
	Physical transmission mediums can be copper cables, fiber optics, or radio waves
	A network protocol is a set of rules for how applications intercommunicate. Common applications include SMTP, IMAP, and POP (email). HTTP (web). SSH (secure access). NFS and FTP (file transfer)


