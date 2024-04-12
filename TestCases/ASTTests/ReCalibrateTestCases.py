import os

os.chdir(os.path.dirname(os.path.abspath(__file__)))
print(os.getcwd())

dir_list = next(os.walk('.'))[1]

for subdir in dir_list:
    if subdir.startswith("__"):
        continue


    print(subdir)