from lxml import etree
import sys
import struct
import binascii

def get_field_name(f):
	if f.get("name") is not None:
		return f.get("name").replace(".","_")
	else:
		return "???"

def get_block_name(f):
	if f.get("show") is not None:
		return f.get("show")
	else:
		return "???"

# Here we try to identify the type of the field. If we fail we just fall back to Blob
def transform_field(f,root,depth):
	node=None
	#print field
	if len(f.get('name'))==0:
		node=etree.Element('Block')
		node.set("name",get_block_name(f))
		return node

	try:
		if int(f.get("value"),16)==int(f.get("show")):
			node=etree.Element('Number')
			node.set("size",len(f.get("value"))*4)
			node.set("value",f.get("show"))
			node.set("endian","big")
			node.set("name",get_field_name(f))
			return node
	except:
		pass

	try:
		parsed=False
		endian="little"
		show=0
		if f.get("show").startswith("0x"):
			show=int(f.get("show"),16)
		else:
			show=int(f.get("show"))
		if len(f.get("value"))==2 and show==int(f.get("value"),16):
			parsed=True
		if len(f.get("value"))==8 and (struct.unpack(">I",binascii.unhexlify(f.get("value")))[0]==show or struct.unpack(">i",binascii.unhexlify(f.get("value")))[0]==show):
			parsed=True
			endian="little"
		if len(f.get("value"))==4 and (struct.unpack(">H",binascii.unhexlify(f.get("value")))[0]==show or struct.unpack(">h",binascii.unhexlify(f.get("value")))[0]==show):
			parsed=True
			endian="little"
		if len(f.get("value"))==8 and (struct.unpack("<I",binascii.unhexlify(f.get("value")))[0]==show or struct.unpack("<i",binascii.unhexlify(f.get("value")))[0]==show):
			parsed=True
			endian="big"
		if len(f.get("value"))==4 and (struct.unpack("<H",binascii.unhexlify(f.get("value")))[0]==show or struct.unpack("<h",binascii.unhexlify(f.get("value")))[0]==show):
			parsed=True
			endian="big"
		if len(f.get("value"))==2 and (struct.unpack("<B",binascii.unhexlify(f.get("value")))[0]==show or struct.unpack("<b",binascii.unhexlify(f.get("value")))[0]==show):
			parsed=True
			endian="little"
		if parsed:
			node=etree.Element('Number')
			node.set("size",str(len(f.get("value"))*4))
			node.set("value",f.get("value"))
			node.set("valueType","hex")
			node.set("endian",endian)
			node.set("name",get_field_name(f))
			return node
	except Exception as e:
		print e
		pass

	try:
		if binascii.unhexlify(f.get("value"))==f.get("show"):
			node=etree.Element("String")
			node.set("length",f.get("size"))
			node.set("value",f.get("show"))
			node.set("name",get_field_name(f))
			return node
	except:
		pass
	node=etree.Element('Blob')
	node.set("valueType","hex")
	node.set("value",f.get("value"))
	node.set("name",get_field_name(f))
	node.set("size",str(len(f.get("value"))*4))
	return node


def parse_field(field,root,depth=0):
	# print "-"*depth, field.get("name")
	node=None
	if field.tag=="field":
		node=transform_field(field,root,depth)
		root.append(node)
	else:
		node=root
	for f in field.getchildren():
		parse_field(f,node,depth+1)


tree=etree.parse(open(sys.argv[1]))
field=tree.xpath('/pdml/packet/proto[@name=\'mq\']')[0]

root=etree.Element('DataModel')

parse_field(field,root)

print etree.tostring(root,pretty_print=True)
