import os
import shutil
import subprocess

os.chdir(os.path.dirname(os.path.abspath(__file__)))
print(os.getcwd())

dir_list = next(os.walk('../ASTTests'))[1]

for subdir in dir_list:
    if subdir.startswith("__"):
        continue

    os.chdir(f"{subdir}")
    os.chdir(f"tests")
    test_files = [x for x in next(os.walk('../ASTTests'))[2] if x.endswith(".c")]

    for test_file in test_files:
        print(f"{os.getcwd()} {subdir} {test_file}")
        shutil.copy(test_file, "../createTests/read_file.c")
        os.chdir("..")
        os.chdir("createTests")

        out = subprocess.run(["python3", "testCaseCreator.py"])
        os.chdir("..")

        test_files2 = [x for x in next(os.walk('./createTests'))[2]]

        shutil.copy("./createTests/file_read_json.json", f"./tests/{test_file[:-2]}.json")
        shutil.copy("./createTests/file_read_json_result.json", f"./tests/{test_file[:-2]}_result.json")

        os.chdir(f"tests")

    os.chdir("..")

    os.chdir("..")
