import os, shutil, subprocess
from libqtile import hook


def __clean_up(path):
    shutil.rmtree(os.path.expanduser(path))


@hook.subscribe.shutdown
def shutdown_hook():
    for path in ["~/.config/qtile/__pycache__", "~/.config/qtile/modules/__pycache__"]:
        __clean_up(path)
    subprocess.Popen("killall", "picom")


@hook.subscribe.restart
def restart_hook():
    for path in ["~/.config/qtile/__pycache__", "~/.config/qtile/modules/__pycache__"]:
        __clean_up(path)


@hook.subscribe.startup_once
def startup_hook():
    home = os.path.expanduser("~")
    subprocess.call([home + "/.config/qtile/autostart.sh"])
