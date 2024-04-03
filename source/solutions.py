#!/usr/bin/env python3

import argparse
import re
import sys
import os

def error(str):
    print("Error : "+str+" Exiting.")
    sys.exit(1)

# Parse arguments
parser = argparse.ArgumentParser(description = "A utility that inserts/removes solutions to problems.", 
                                 epilog = "At least one of -c, -u, as well as filename must be specified.")
parser.add_argument("filename", help="the file name")
parser.add_argument("-c", action="store_true", help="comment out all solutions")
parser.add_argument("-u", action="store_true", help="uncomment all solutions")

arg = parser.parse_args()
if not arg.c and not arg.u:
    parser.print_help()
    error("Need either -c or -u.")


# if not len(sys.argv) == 2:
#     print("Need exactly one argument")
#     sys.exit(1)
# else:
#     filename = sys.argv[1] 
try:

    with open(arg.filename , 'r') as file:
        lines = file.readlines()
except IOError:
    error("Cannot open \""+arg.filename+"\" for reading.")

try:
   outfile = open(arg.filename+".bak" , 'w')
except IOError:
    error("Cannot open \""+arg.filename+".bak\" for writing.")




def comment(line):
    return("<!-- "+line.rstrip()+" -->"+"\n")

def uncomment(line):
    aux = re.sub("<!--\\s*","",line, flags=re.DOTALL)
    return(re.sub("-->","",aux, flags=re.DOTALL))


inside = False

for num, line in enumerate(lines):
    if "<details>" in line:
        inside = True

    if inside:
        if arg.c:
            outline=comment(line)
        else:
            outline=uncomment(line)
    else:
        outline = line

    if "</details>" in line:
        inside = False

    outfile.write(outline)

tempfile = "temp311435234"
os.rename(arg.filename+".bak", tempfile)
os.rename(arg.filename, arg.filename+".bak")
os.rename(tempfile, arg.filename)

#
#
# regex = re.compile(r'<div class="problem"\w*>(.*?)</div>', re.DOTALL)
# content = re.sub(regex, r'::: {.exercise}\n\1\n:::\n\n', content)
#
# regex = re.compile(r'<div class="problemec"\w*>(.*?)</div>', re.DOTALL)
# content = re.sub(regex, r'::: {.exercise name="Extra Credit"}\n\1\n:::\n\n', content)
#
#
# def replacer(match_obj):
#     pre = "<details>\n<summary> Click for Solution </summary>\n"
#     post = "\n</details>\n"
#     if re.search("r child", match_obj.group(0)) is None:
#         pre=""; post="";
#     return pre+"::: {.solution}\n"+match_obj.group(1)+"\n:::"+post
#
# regex = re.compile(r'<div class="solution"\w*>(.*?)</div>', re.DOTALL)
# content = re.sub(regex, replacer, content)
#
# # content = re.sub(regex, r'::: {.solution}\n\1\n:::\n\n', content)
#
# # regex = re.compile(r':::...solution}(.*?child.*?):::', re.DOTALL)
# # match = re.search(regex, content)
# # print(match.group(0))
#
# with open("repl.Rmd", 'w') as outfile:
#     outfile.write(content)
#
#
