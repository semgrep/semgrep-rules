  use std::num::ParseIntError;

  fn main() -> Result<(), ParseIntError> {
    let mut number_str = "10";

  //ruleid: log-neutralization
    let number = match number_str.parse::<i32>() {
    Ok(number)  => number,
    Err(e) => info!(Err(e)),
  };

  //ruleid: log-neutralization
    let number = match number_str.parse::<i32>() {
    Ok(number)  => number,
    Err(e) => debug!(Err(e)),
  };

  //ruleid: log-neutralization
    let number = match number_str.parse::<i32>() {
    Ok(number)  => number,
    Err(e) => println!(Err(e)),
  };

  //ruleid: log-neutralization
    let number = match number_str.parse::<i32>() {
    Ok(number)  => number,
    Err(e) => warn!(Err(e)),
  };

  //ruleid: log-neutralization
    let number = match number_str.parse::<i32>() {
    Ok(number)  => number,
    Err(e) => error!(Err(e)),
  };
  //ruleid: log-neutralization
    let number = match number_str.parse::<i32>() {
    Ok(number)  => number,
    Err(e) => trace!(Err(e)),
  };

  }