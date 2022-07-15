const { CONSTANTS, SOME_MAP } = ModuleImport;

const fieldName = CONSTANTS.A_VALUE;
const someOtherField = "FOO";
const validations = SOME_MAP[fieldName];

const validate = function() {
  const field = formData[fieldName];
  if (field !== undefined) {
    return ValidationManager.validateField(fieldName, field.value, validations);
  }
  const badField = formData[formData["foo"]];
  const goodField = formData[someOtherField];
  const someField = formData["bar"]
  const email = formData.split("@")[0];
  const email = formData.split("@")[0 + a];
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
