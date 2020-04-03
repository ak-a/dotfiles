#!/usr/bin/gawk -f

BEGIN {
    temp_pid_file = sprintf("%s.%s.%s", PID_FILE, PROCINFO["pid"],PROCINFO["uid"])

    system_mv_pid_file = sprintf("mv %s %s", temp_pid_file, PID_FILE)
}

function read_cmdline(proc_pid,   old_FS, cmdline, proc_cmdline) {
    old_FS = FS
    #FS = "\000"

    proc_cmdline = sprintf("/proc/%d/cmdline", proc_pid)
    getline < proc_cmdline
    gsub("\0", " ")
    FS=old_FS
    return $0
}

function write_pid() {
    print MAIN, ALIVE[MAIN] > temp_pid_file
    for (pid in ALIVE) {
        if (pid != MAIN)
            print pid, ALIVE[pid] >> temp_pid_file
    }
    close(temp_pid_file)
    system(system_mv_pid_file)
}

NR == 1 { MAIN=$1; ALIVE[MAIN]=read_cmdline(MAIN); write_pid() }
/^[0-9]{1,10} / && NR>1 && $1 != MAIN && !($1 in ALIVE) { ALIVE[$1] = read_cmdline($1); write_pid() }
#/exec[lv]p?e?(/ { EXEC=$2 }     # TODO: add what we have started mebbe
/ \+\+\+ exited with [0-9]+/ || / \+\+\+ killed by/ {
    if ($1 == MAIN)
        MAIN=""
    else
        delete ALIVE[$1];
    write_pid()
}
