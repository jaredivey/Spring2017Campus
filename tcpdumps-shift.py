import os

fileDir = "logs/tcpdumps/parsed"

fileTrials = ["python-fws", "python-ns-bfs", "python-ns-ucs","java-fl-def"]
flows = ["1", "2", "3"]

for fileTrial in fileTrials:
    for flow in flows:
        fileOut = "parsed-tcpdumps-%s-%s" % (fileTrial, flow)
        shiftedFile = "shifted-%s.log" % fileOut
        lineArray = dict()
        for parseFile in os.listdir(fileDir):
            if parseFile.startswith(fileOut):
                print parseFile

                with open(fileDir+"/"+parseFile,'r') as rHandle:
                    lineArray[parseFile] = []
                    for line in rHandle:
                        lineArray[parseFile].append(line.split())

        with open("logs/condensed/"+shiftedFile,'w') as wHandle:
            for num in range(20):
                newLine = []
                for key,value in lineArray.iteritems():
                    print value[num+1][0]
                    if len(value) > 1:
                        newLine += [value[num+1][0]] + ['']
                strLine = " ".join(newLine)
                strLine += "\n"
                wHandle.write(strLine)
