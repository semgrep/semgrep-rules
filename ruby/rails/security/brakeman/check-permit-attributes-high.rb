  params = ActionController::Parameters.new({
  person: {
    name: "Francesco",
    age:  22,
    role: "admin"
  }
})

#ruleid: check-permit-attributes-high
params.permit(:admin)
#ok: check-permit-attributes-high
params.permit(:some_safe_property)