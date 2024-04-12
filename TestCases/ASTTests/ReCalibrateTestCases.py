import os
import shutil
import subprocess

os.chdir(os.path.dirname(os.path.abspath(__file__)))
print(os.getcwd())

dir_list = next(os.walk('.'))[1]

for subdir in dir_list:
    if subdir.startswith("__"):
        continue

    if subdir == "SyntaxErrorTests":
        continue

    os.chdir(f"{subdir}")
    os.chdir(f"tests")
    test_files = [x for x in next(os.walk('.'))[2] if x.endswith(".c")]

    for test_file in test_files:
        print(f"{os.getcwd()} {subdir} {test_file}")
        shutil.copy(test_file, "../CreateTests/read_file")
        os.chdir("..")
        os.chdir("CreateTests")

        out = subprocess.run(["python3", "TestcaseCreator.py"])
        os.chdir("..")

        test_files2 = [x for x in next(os.walk('./CreateTests'))[2]]

        shutil.copy("./CreateTests/file_read_json.json", f"./tests/{test_file[:-2]}.json")
        shutil.copy("./CreateTests/file_read_json_result.json", f"./tests/{test_file[:-2]}_result.json")

        os.chdir(f"tests")

    os.chdir("..")

    os.chdir("..")
