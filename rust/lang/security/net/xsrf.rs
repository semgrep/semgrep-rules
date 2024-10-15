use reqwest::{self};

//ruleid: XSRF_URL
fn get(my_url: String){
  let res = reqwest::get(my_url).send().unwrap();
}

//ruleid: XSRF_URL
fn post(my_url: String){
  let res = reqwest::post(my_url).send().unwrap();
}

//ruleid: XSRF_URL
fn put(my_url: String){
  let res = reqwest::put(my_url).send().unwrap();
}

//ruleid: XSRF_URL
fn patch(my_url: String){
  let res = reqwest::patch(my_url).send().unwrap();
}

//ruleid: XSRF_URL
fn head(my_url: String){
  let res = reqwest::head(my_url).send().unwrap();
}

//ruleid: XSRF_URL
fn head_no_method(my_url: String){
  let res = reqwest::head(my_url);
}



