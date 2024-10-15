fn dangerous_exec_command_sh() {
    use std::process::Command;
    //ruleid: dangerous-exec-command
    let _ = Command::new("sh");
    //ruleid: dangerous-exec-command
    let _ = Command::new("sh")
        .arg("-c")
        .arg("echo hello")
        .output()
        .expect("failed to execute process");
    //ruleid: dangerous-exec-command
    let mut ls = Command::new("ls");
}

fn dangerous_exec_command_bash() {
    use std::process::Command;
    //ruleid: dangerous-exec-command
    let _ = Command::new("bash");
    //ruleid: dangerous-exec-command
    let _ = Command::new("bash")
        .arg("-c")
        .arg("echo hello")
        .output()
        .expect("failed to execute process");
    //ruleid: dangerous-exec-command
    let mut ls = Command::new("ls");
}

fn dangerous_exec_command_csh() {
    use std::process::Command;
    //ruleid: dangerous-exec-command
    let _ = Command::new("csh");
    //ruleid: dangerous-exec-command
    let _ = Command::new("csh")
        .arg("-c")
        .arg("echo hello")
        .output()
        .expect("failed to execute process");
    //ruleid: dangerous-exec-command
    let mut ls = Command::new("ls");
}

fn dangerous_exec_command_ksh() {
    use std::process::Command;
    //ruleid: dangerous-exec-command
    let _ = Command::new("ksh");
    //ruleid: dangerous-exec-command
    let _ = Command::new("ksh")
        .arg("-c")
        .arg("echo hello")
        .output()
        .expect("failed to execute process");
    //ruleid: dangerous-exec-command
    let mut ls = Command::new("ls");
}

fn dangerous_exec_command_tcsh() {
    use std::process::Command;
    //ruleid: dangerous-exec-command
    let _ = Command::new("tcsh");
    //ruleid: dangerous-exec-command
    let _ = Command::new("tcsh")
        .arg("-c")
        .arg("echo hello")
        .output()
        .expect("failed to execute process");
    //ruleid: dangerous-exec-command
    let mut ls = Command::new("ls");
}

fn dangerous_exec_command_zsh() {
    use std::process::Command;
    //ruleid: dangerous-exec-command
    let _ = Command::new("zsh");
    //ruleid: dangerous-exec-command
    let _ = Command::new("zsh")
        .arg("-c")
        .arg("echo hello")
        .output()
        .expect("failed to execute process");
    //ruleid: dangerous-exec-command
    let mut ls = Command::new("ls");
}
