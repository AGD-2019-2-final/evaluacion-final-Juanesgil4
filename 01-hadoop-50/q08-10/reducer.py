import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == '__main__':

    curkey = None
    suma = 0
    n=0
    promedio=0

    ##
    ## cada linea de texto recibida es una
    ## entrada clave \tabulador valor
    ##
    for line in sys.stdin:
        key, val = line.split("\t")
        val=float(val)

        if key==curkey:
            suma=suma + val
            n+=1
            prom=suma/n

        else:
            if curkey is None:
            	curkey=key
            	suma=val
            	n=1
            	prom=suma/n
            else:
	            sys.stdout.write("{}\t{}\t{}\n".format(curkey,suma,prom))
	            curkey=key
	            suma=val
	            n = 1
	            prom=suma/n

    sys.stdout.write("{}\t{}\t{}\n".format(curkey,suma,prom))
