import os, platform, subprocess, re
from controllers.cpu import CPU


def get_processor_name():
    if platform.system() == "Windows":
        return platform.processor()
    elif platform.system() == "Darwin":
        command = "/usr/sbin/sysctl -n machdep.cpu.brand_string"
        return subprocess.check_output(command , shell=True).strip()
    elif platform.system() == "Linux":
        command = "cat/proc/cpuinfo"
        all_info = subprocess.check_output(command , shell=True).strip()
        for line in all_info.split("\n"):
            if "model name" in line:
                return re.sub(".*model name.*:", "", line, 1)
    return "cannot find cpuinfo"

def cpu_get() -> str:
    return CPU(get_processor_name()).__dict__

