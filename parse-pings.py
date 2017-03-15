import os

parseMod = 18

fileDir = "logs/pings"
for parseFile in os.listdir(fileDir):
    if parseFile.endswith(".log"):
        print parseFile

        parsedFile = "parsed-%s" % parseFile
        with open(fileDir+"/"+parseFile,'r') as rHandle:
            with open(fileDir+"/parsed/"+parsedFile,'w') as wHandle:
                index = 1
                newLine = ""
                for line in rHandle:
                    if index % parseMod == 1 or index % parseMod == 2:
                        newLine = newLine + str(line).rstrip('\n') + "\t"
                    elif index % parseMod == 7 or index % parseMod == 12 or index % parseMod == 17:
                        if line == "\n":
                            newLine = newLine + "REDO" + "\t"
                        else:
                            rttArray = line.split("/")
                            newLine = newLine + rttArray[4] + "\t"
                    if index % parseMod == 0:
                        newLine = newLine + str(line).rstrip('\n') + '\n'
                        wHandle.write(newLine)
                        newLine = ""
                    index += 1
