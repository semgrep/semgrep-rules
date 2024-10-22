use env_logger;
use log;

// A mock structure containing personl information
struct PersonalInfomration {
    username: String,
    password: String,
    social_security_number: String,
    account_id: u64,
    location: (f64, f64),
}

impl PersonalInfomration {
    pub fn get_username(&self) -> &String {
        &self.username
    }

    pub fn get_password(&self) -> &String {
        &self.password
    }

    pub fn get_social_security_number(&self) -> &String {
        &self.social_security_number
    }

    pub fn get_account_id(&self) -> u64 {
        self.account_id
    }

    pub fn get_location(&self) -> (f64, f64) {
        self.location
    }
}

fn get_user_info() -> PersonalInfomration {
    let username = "JohnDoe79".to_string();
    let password = "passw0rd1234".to_string();
    let social_security_number = "999999999".to_string();
    let account_id = 12345;
    let location = (38.8974, -77.0366);

    PersonalInfomration {
        username,
        password,
        social_security_number,
        account_id,
        location,
    }
}

fn main() {
    env_logger::init();

    // Leak sensitive info via log statement
    //todoruleid: exposure-of-private-info
    let user = get_user_info();
    log::debug!("user account_id = {:?}", user.get_account_id());

    // Leak sensitive info via print statement
    //todoruleid: exposure-of-private-info
    let pwd = user.get_password();
    println!("user password = {:?}", pwd);
}
