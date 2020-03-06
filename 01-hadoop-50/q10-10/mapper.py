import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#

if __name__ == "__main__":
    for linea in sys.stdin:
      key_col=linea.split('\t')[0]
      val_col=linea.split('\t')[1].strip()
      sys.stdout.write("{}\t{}\n".format(key_col,val_col))
