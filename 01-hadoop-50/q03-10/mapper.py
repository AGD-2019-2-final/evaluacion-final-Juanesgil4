import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
    for linea in sys.stdin:
        linea_split = linea.split(",")
        print("{}\t{}".format(linea_split[1].strip(),linea_split[0].strip()))
