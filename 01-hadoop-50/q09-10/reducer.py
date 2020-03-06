import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
    resultados = {}
    for line in sys.stdin:
        splt = line.split("\t")
        (key, date, value) = (splt[0], splt[1], int(splt[2]))
        values = resultados.get(value, None)
        if values is None:
            resultados[value] = [[key, date]]
        else:
            resultados[value].append([key, date])

    counted_values = 0
    for (key, values) in sorted(resultados.items()):
        for value in values:
            sys.stdout.write("{}\t{}\t{}\n".format(value[0], value[1], key))
            counted_values += 1
        if counted_values == 6:
            break
