import os

def get_gmail_pass():
    return get_simple_pass("google_app_password")

def get_simple_pass(key):
    cmd = "gnome-keyring-get simple_name=%s" % key
    for k, v in os.popen(cmd).readline().strip().split(" ", 1):
        return v
