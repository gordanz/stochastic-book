import re
import sys

filename = "08-Stationary-Distributions.Rmd"

# if not len(sys.argv) == 2:
#     print("Need exactly one argument")
#     sys.exit(1)
# else:
#     filename = sys.argv[1] 

with open(filename , 'r') as file:
    content = file.read()

regex = re.compile(r'<div class="problem"\w*>(.*?)</div>', re.DOTALL)
content = re.sub(regex, r'::: {.exercise}\n\1\n:::\n\n', content)

regex = re.compile(r'<div class="problemec"\w*>(.*?)</div>', re.DOTALL)
content = re.sub(regex, r'::: {.exercise name="Extra Credit"}\n\1\n:::\n\n', content)


def replacer(match_obj):
    pre = "<details>\n<summary> Click for Solution </summary>\n"
    post = "\n</details>\n"
    if re.search("r child", match_obj.group(0)) is None:
        pre=""; post="";
    return pre+"::: {.solution}\n"+match_obj.group(1)+"\n:::"+post

regex = re.compile(r'<div class="solution"\w*>(.*?)</div>', re.DOTALL)
content = re.sub(regex, replacer, content)

# content = re.sub(regex, r'::: {.solution}\n\1\n:::\n\n', content)

# regex = re.compile(r':::...solution}(.*?child.*?):::', re.DOTALL)
# match = re.search(regex, content)
# print(match.group(0))

with open("repl.Rmd", 'w') as outfile:
    outfile.write(content)


