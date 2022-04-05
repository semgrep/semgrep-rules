  params = ActionController::Parameters.new({
  person: {
    name: "Francesco",
    age:  22,
    role_id: "admin"
  }
})

# ruleid: check-permit-attributes-medium
params.permit(:role_id)
#ok: check-permit-attributes-medium
params.permit(:some_safe_property)