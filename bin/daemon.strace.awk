#!/usr/bin/gawk -f

BEGIN {
    temp_pid_file = sprintf("%s.%s.%s", PID_FILE, PROCINFO["pid"],PROCINFO["uid"])

    system_mv_pid_file = sprintf("mv %s %s", temp_pid_file, PID_FILE)
}

function write_pid() {
    print MAIN > temp_pid_file
    for (pid in ALIVE) {
        print pid >> temp_pid_file
    }
    close(temp_pid_file)
    system(system_mv_pid_file)
}

NR == 1 { MAIN=$1; write_pid() }
/^[0-9]{1,10} / && NR>1 && $1 != MAIN && !($1 in ALIVE) { ALIVE[$1] = 1; write_pid() }
#/exec[lv]p?e?(/ { EXEC=$2 }     # TODO: add what we have started mebbe
/ \+\+\+ exited with [0-9]+/ || / \+\+\+ killed by/ {
    if ($1 == MAIN)
        MAIN=""
    else
        delete ALIVE[$1];
    write_pid()
}
