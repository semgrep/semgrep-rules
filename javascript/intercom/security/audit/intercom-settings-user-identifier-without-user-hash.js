// ok: intercom-settings-user-identifier-without-user-hash
window.intercomSettings = {
  app_id: appId,
  name: myUserName,
  email: myUserEmail,
  user_hash: "my-user-hash",
};

// ok: intercom-settings-user-identifier-without-user-hash
window.intercomSettings = {
  app_id: appId,
  name: myUserName,
  user_id: myUserID,
  user_hash: "my-user-hash",
};

// ruleid: intercom-settings-user-identifier-without-user-hash
window.intercomSettings = {
  app_id: appId,
  name: myUserName,
  email: myUserEmail,
};

// ruleid: intercom-settings-user-identifier-without-user-hash
window.intercomSettings = {
  app_id: appId,
  name: myUserName,
  user_id: myUserID,
};

// ruleid: intercom-settings-user-identifier-without-user-hash
Intercom('boot', {
    app_id: 'abc12345',
    email: 'john.doe@example.com',
    name: 'John Doe',
    user_id: '9876'
});

// ok: intercom-settings-user-identifier-without-user-hash
Intercom('boot', {
    app_id: 'abc12345',
    email: 'john.doe@example.com',
    name: 'John Doe',
    user_id: '9876',
    user_hash: 'my-user-hash'
});

// ruleid: intercom-settings-user-identifier-without-user-hash
Intercom('boot', {
    app_id: 'abc12345',
    email: 'john.doe@example.com',
    name: 'John Doe',
});

// ok: intercom-settings-user-identifier-without-user-hash
Intercom('boot', {
    app_id: 'abc12345',
    email: 'john.doe@example.com',
    name: 'John Doe',
    user_hash: 'my-user-hash'
});

// ruleid: intercom-settings-user-identifier-without-user-hash
Intercom('boot', {
    app_id: 'abc12345',
    name: 'John Doe',
    user_id: '9876'
});

// ok: intercom-settings-user-identifier-without-user-hash
Intercom('boot', {
    app_id: 'abc12345',
    name: 'John Doe',
    user_id: '9876',
    user_hash: 'my-user-hash'
});

// ruleid: intercom-settings-user-identifier-without-user-hash
myCustomSettings = {
  app_id: appId,
  name: myUserName,
  user_id: myUserID,
};

Intercom('boot', myCustomSettings);

// ok: intercom-settings-user-identifier-without-user-hash
myCustomSettingsWithHash = {
  app_id: appId,
  name: myUserName,
  user_id: myUserID,
  user_hash: 'my-user-hash'
};

Intercom('boot', myCustomSettingsWithHash);