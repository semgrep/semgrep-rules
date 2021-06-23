const { CONSTANTS, SOME_MAP } = ModuleImport;

const fieldName = CONSTANTS.A_VALUE;
const someOtherField = "FOO";
const validations = SOME_MAP[fieldName];

const validate = function() {
  const field = formData[fieldName];
  if (field !== undefined) {
    return ValidationManager.validateField(fieldName, field.value, validations);
  }
  // ruleid:detect-bracket-object-injection
  const badField = formData[formData["foo"]];
  // ok:detect-bracket-object-injection
  const goodField = formData[someOtherField];
  // ok:detect-bracket-object-injection
  const someField = formData["bar"]
  // ok:detect-bracket-object-injection
  const email = formData.split("@")[0];
  // ruleid:detect-bracket-object-injection
  const email = formData.split("@")[0 + a];
  // ruleid:detect-bracket-object-injection
  const email = formData.split("@")[a + 0];
  return {
    name: fieldName,
    value: '',
    error: '',
  };
};

export default {
  validate,
};
