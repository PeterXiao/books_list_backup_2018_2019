# dot1x-peachpits

This is a collection for PeachPits for Peach Fuzzer to facilitate the fuzzing of EAP, IEEE 802.1x and RADIUS. 

The PeachPits themselves are useful, however the real power is in the Fuzzer XMLs. They  bind the DataModels into full sessions that can be directed towards the target of choice. That being said, they are complex and can be hackish at times, so be prepared to understand whats going on before you venture on :)
	
## DataModels
The DataModels are often linked together and are meant to be imported/combined by a fuzzer XML. These DataModels are essentially rolled up into two all-encompassing ones: Radius.xml and Ieee802.1x.xml. Radius.xml should be the only reference to a non-bridged Radius Fuzzer. Radius.xml imports Eap.xml only for Request/Response Identity, then Radius.xml relies on the individual EAP-Type data models to build its Access-Requests and Challenges.

### Eap.xml
This DataModel is used heavily by other EAP-Types.

Applicable RFC(s): 
* http://tools.ietf.org/html/rfc3748 

### EapFast.xml 
DataModel for EAP-FAST, which is mostly a wrapper around TLS. EAP-FAST Supports a specialized version of EAP-GTC, which is not included in this DataModel. 

Applicable RFC(s): 
* http://tools.ietf.org/search/rfc4851
* http://tools.ietf.org/search/rfc5422 

### EapGtc.xml
DataModel for EAP-GTC. Note this is not the EAP-FAST version of EAP-GTC. 

Applicable RFC(s): 
* http://tools.ietf.org/html/rfc3748  

### EapLeap.xml
Applicable RFC(s): 
* http://freeradius.org/rfc/leap.txt

### EapMd5.xml
Applicable RFC(s): 
* http://tools.ietf.org/html/rfc3748

### EapMschapv2.xml
DataModel for EAP-MSCHAPv2. This is mostly just the EAP Encapsulation around Mschapv2.xml

### EapPeap.xml
DataModel for PEAP. This is mostly just an encapsulation around EAP-TLS. 

### EapTls.xml
DataModel for EAP-TLS. This is mostly just the EAP Encapsulation around Tls.xml 

Applicable RFC(s): 
* http://tools.ietf.org/html/rfc5216 

### EapTlv.xml
Applicable RFC(s): 
* http://tools.ietf.org/html/draft-hiller-eap-tlv-00

### Ieee802.1x.xml
This DataModel is meant to encapsulate the other EAP-Type and derivative DataModels to be used by a RawEthernetPublisher or Raw 802.11 Publisher

### Mschapv2.xml
This is a supporting DataModel to EAP-MSCHAPv2, EAP-FAST, PEAP, and others. 

Applicable RFC(s): 
* http://tools.ietf.org/html/rfc2759


### Radius.xml
RADIUS Authentication DataModel and is meant to encapsulate the other EAP-Type and derivative DataModels to be used by a UDP Publisher. 

Applicable RFC(s): 
* https://tools.ietf.org/html/rfc2865

### Tls.xml
 This is a supporting DataModel. Very basic TLS DataModel for all EAP-Types which support it (e.g. EAP-FAST, EAP-PEAP, EAP-TLS, EAP-TTLS).
    
### Utils.xml
Various utility Models such as the Domain/Username one and Cisco State. This is a supporting DataModel to the EAP DataModels. 

## Fuzzers
Many RADIUS servers act slightly different from one another, so a Fuzzer XML was created for each RADIUS server. That being said, there is heavy overlap between them. You'll want to manually look at the fuzzers and the Configuration XML file to ensure the Fuzzer is set up appropriately with your set up. 

### Bootstrap Scripts
Most fuzzers come with a bootstrap script that is meant to just show how to invoke the fuzzer using them. This are really hackish and should be used mostly as a reference. 


