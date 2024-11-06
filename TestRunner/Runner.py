import os
from pathlib import Path
from robot import run

targetDirectory = os.path.dirname(Path.cwd())
pathToTests = targetDirectory + "/FunctionalTests/TestCases"
pathToResultFiles = targetDirectory + "/TestReport/"
pathToDownloadsFolder = targetDirectory + "/Downloads/"

for filename in os.listdir(pathToResultFiles):
    file_path = os.path.join(pathToResultFiles, filename)
    if os.path.isfile(file_path):
        os.remove(file_path)

for filename in os.listdir(pathToDownloadsFolder):
    file_path = os.path.join(pathToDownloadsFolder, filename)
    if os.path.isfile(file_path):
        os.remove(file_path)

run(pathToTests, outputdir=pathToResultFiles)
