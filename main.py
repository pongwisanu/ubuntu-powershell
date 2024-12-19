import subprocess,os

PATH = os.path.join(os.path.curdir, "hello.ps1")

CMD = ["pwsh", PATH]

res = subprocess.run(CMD, stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True)

if res.stderr:
    print(res.stderr, end="")
else:
    print(res.stdout, end="")

