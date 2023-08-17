class bad_use_attr_protected
  attr_protected :admin

  public :sanitize_for_mass_assignment
end

class ok_use_attr_protected
  include ActiveModel::MassAssignmentSecurity
  attr_accessible :name, :email
  attr_accessible :name, :email, :admin, :as => :admin

  public :sanitize_for_mass_assignment
end
