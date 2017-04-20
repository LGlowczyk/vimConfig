import vim

import os
import sys
import shutil
import readline

from pathlib import Path

def CopyAndFillProjCmakeList(projName):
    pathToCMakeTemplate = os.path.expanduser("~/.vim/vimConfig/fileTemplates/proj_CMakeLists.txt")
    pathToNewCmakeLists = os.path.abspath("./CMakeLists.txt")
    with open(pathToCMakeTemplate) as cmakeTemplate:
        with open(pathToNewCmakeLists, "w") as projCmakeLists:
            for line in cmakeTemplate:
                if "should be updated" in line:
                    # skipping template line
                    pass
                elif "project(" in line:
                    projCmakeLists.write(line.replace("proj_name", projName))
                elif "add_executable(" in line:
                    projCmakeLists.write(line.replace("exe_name", projName))
                else: 
                    projCmakeLists.write(line)
    
def CopyAndFillProjConfFile():
    pathToVimrcTemplate = os.path.expanduser("~/.vim/vimConfig/fileTemplates/proj_vimrc")
    pathToNewVimrc = os.path.abspath("./.vimrc")
    shutil.copyfile(pathToVimrcTemplate, pathToNewVimrc)

def CopySourceFiles():
    pathToStartSourceTemplate = os.path.expanduser("~/.vim/vimConfig/fileTemplates/main.cpp")
    projDir = os.path.abspath("./main.cpp")
    shutil.copyfile(pathToStartSourceTemplate, projDir)

def CreateProject(projName):
    projectCnfFile = Path("./.vimrc")
     
    if projectCnfFile.is_file():
        print ("Current directory already contain project. Aborting")
        return

    print ("Creating directory for project " + projName)
    newProjPath = os.path.join(os.getcwd(), projName)
    os.mkdir(newProjPath)
    buildDirPath = os.path.join(newProjPath, "build")
    os.mkdir(buildDirPath)

    print ("Switching to new project directory")
    os.chdir(newProjPath)

    print ("Copying template of CMakeList.txt and updating it")
    CopyAndFillProjCmakeList(projName) 

    print ("Copying template of project conf file and updating it")
    CopyAndFillProjConfFile()

    print ("Copying default source files")
    CopySourceFiles()

CreateProject(vim.eval("a:projectName"))
