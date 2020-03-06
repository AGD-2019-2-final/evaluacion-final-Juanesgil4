import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#

if __name__=="__main__":
	for line in sys.stdin:
		charac=line.split("   ")[0]
		valor=line.split("   ")[2]
		val=float(valor)

		sys.stdout.write("{}\t{}\n".format(charac,val))
