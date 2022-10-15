import os
from PIL import Image

inputDir = '04_filter_images/'
outputDir = '05_B_generate_image/'

def readNext(file):
    line = file.readline()
    if (line):
        return int(line.strip())
    else:
        return -1

def generateImage(input):
    file = open(input, 'r')

    indexToColor = readNext(file)

    image = Image.new("RGB", (100, 100))
    pixels = image.load()

    loopIndex = 0
    for y in range(100):
        for x in range(100):
            if loopIndex == indexToColor:
                pixels[x,y] = (0,0,0)
                indexToColor = readNext(file)
            else:
                pixels[x,y] = (255,255,255)
            loopIndex += 1

    filename = os.path.splitext(os.path.basename(input))[0]
    image.save("%s%s.png"%(outputDir, filename), "PNG")
    file.close()

def main():
    for filename in os.listdir(inputDir):
        if filename.startswith('.'):
            continue

        input = os.path.join(inputDir, filename)
        print("processing image " + filename)
        generateImage(input)

if __name__ == "__main__":
    main()
