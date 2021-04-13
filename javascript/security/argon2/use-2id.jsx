const argon2 = require("argon2");

const hashSettings = {
  type: argon2.argon2i,
  memoryCost: 2 ** 16,
  parallelism: os.cpus().length || 8,
};

const prepareSaving = (user) => {
  if (!user.Password) return Promise.resolve(user);

  return argon2
    .hash(user.Password, hashSettings)
    .then((hash) => ({ ...user, Password: hash }))
    .catch((err) => console.error(`Error during hashing: ${err}`));
};