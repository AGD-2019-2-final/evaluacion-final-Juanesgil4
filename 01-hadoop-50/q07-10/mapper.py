import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__=="__main__":
	for line in sys.stdin:
		charac=line.split("   ")[0]
		date=line.split("   ")[1]
		val=line.split("   ")[2]
		val=int(val)
		
		sys.stdout.write("{}\t{}\t{}\n".format(charac,val,date))
