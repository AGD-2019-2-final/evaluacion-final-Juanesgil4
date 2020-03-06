import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#

if __name__ == '__main__':

    curkey=None
    val_max=0
    date_max=''
    key_max=''
    val_min=0
    date_min=''
    key_min=''
    ##
    ## cada linea de texto recibida es una
    ## entrada clave \tabulador valor
    ##
    for line in sys.stdin:

        key,val,date= line.split("\t")
        val=int(val)
        
        if curkey is None:
            key_max=key
            date_max=date
            val=int(val)
            val_max=val

        if key == key_max:
            if val_max <= val:
                key_min=key_max
                date_min=date_max
                val_min=val_max

                key_max=key
                date_max=date
                val_max=val

                curkey=key

                sys.stdout.write("{}\t{}\t{}".format(key_min, date_min ,val_min))

    sys.stdout.write("{}\t{}\t{}\n".format(key_min, date_min ,val_min))
