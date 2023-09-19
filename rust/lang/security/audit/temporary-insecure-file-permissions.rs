use tempfile::tempdir;
use std::fs::File;
use std::io::{self, Write};

/*
In the following code examples a temporary file is created and written to. After using the temporary file, the file is closed and deleted from the file system.
*/

fn main(){
// Create a directory inside of `std::env::temp_dir()`.
//ruleid: temporary-insecure-file-permissions
let dir = tempdir()?;

let file_path = dir.path().join("my-temporary-note.txt");
let mut file = File::create(file_path)?;
writeln!(file, "XYZ ZYZ XYZ")?;

// By closing the `TempDir` explicitly, we can check that it has
// been deleted successfully. If we don't close it explicitly,
// the directory will still be deleted when `dir` goes out
// of scope, but we won't know whether deleting the directory
// succeeded.
drop(file);
dir.close()?;
}
