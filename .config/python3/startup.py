import atexit
import os
import readline

# histfile = os.path.join(os.getenv("XDG_STATE_HOME"), "python3", "history")
histfile = os.getenv("PYTHONHISTFILE")
# readline.set_auto_history(False)

try:
    readline.read_history_file(histfile)
    # default history len is -1 (infinite), which may grow unruly
    readline.set_history_length(1000)
except FileNotFoundError:
    pass

atexit.register(readline.write_history_file, histfile)

# try:
#     readline.read_history_file(histfile)
#     h_len = readline.get_current_history_length()
# except FileNotFoundError:
#     open(histfile, 'wb').close()
#     h_len = 0

# def save(prev_h_len, histfile):
#     new_h_len = readline.get_current_history_length()
#     readline.set_history_length(1000)
#     readline.append_history_file(new_h_len - prev_h_len, histfile)

# atexit.register(save, h_len, histfile)
