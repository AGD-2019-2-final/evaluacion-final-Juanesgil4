import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == '__main__':
    lista = []
    curkey = None
    listanum = ''
    for line in sys.stdin:
        key, val = line.split("\t")
        
        for letter in val.split(','):
            lista.append([letter.strip(),int(key)])
    
    lista = sorted(lista, key=lambda x: (x[0],x[1]))
    for line in lista:
        
        if curkey is None:
            curkey = line[0]
        #print(str(line[1]) +'-' +  line[0] +'=='+ curkey)
        if line[0] == curkey:
            if line[1] not in listanum.split(','):
                if listanum == '':
                    listanum += str(line[1])
                else:
                    listanum += ',' + str(line[1])
        else:
            sys.stdout.write("{}\t{}\n".format(curkey, listanum))
            listanum = ''
            
            if listanum == '':
                listanum += str(line[1])
            else:
                listanum += ',' + str(line[1])
            
            curkey = line[0]
    
    sys.stdout.write("{}\t{}\n".format(curkey, listanum))
