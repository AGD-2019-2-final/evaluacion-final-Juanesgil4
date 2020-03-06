import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == '__main__':

    curkey = None
    val_max = None
    val_min = None

    for line in sys.stdin:
        key, val = line.split("\t")
        val = float(val)
        
        if val_max is None:
          val_max = val
        if val_min is None:
          val_min = val

        if key == curkey:
              val_max = max(val_max,val)
              val_min = min(val_min,val)
        else:
            if curkey is not None:
                sys.stdout.write("{}\t{}\t{}\n".format(curkey, val_max,val_min))

            curkey = key
            val_max = val
            val_min = val
    sys.stdout.write("{}\t{}\t{}\n".format(curkey, val_max,minimo_valor))
