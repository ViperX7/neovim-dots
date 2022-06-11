with open("./lua/keymappings.lua") as file:
    data = file.readlines()


def sanitize(msg):
    return msg.strip("\n").strip("'").strip('"').strip(" ")


def dsan(msg):
    msg = sanitize(msg[::-1])
    msg = sanitize(msg[::-1])
    return msg


def dat_parse(line):
    line = line[line.find("map("):].split("map(")
    line = line[1].split(",")

    mode = line[0]
    key = line[1]
    cmd = line[2]

    mode = dsan(mode)
    key = dsan(key)
    cmd = dsan(cmd)

    modes = {"": "Universal", "i": "Insert", "n": "Normal", "v": "Nisual"}
    mode = modes[mode]
    # key = key.replace("<leader>", "⭐")

    # print("|`{:20}`|`{:25}`|\t\t`{}`|".format(mode, key, cmd))
    print("|{}|{}|{}|".format(mode, key, cmd))


print("|{}|{}|{}|".format("Mode", "Key", "cmd"))
print("| --- | --- | --- |")
for line in data:
    if "map(" in line:
        dat_parse(line)

