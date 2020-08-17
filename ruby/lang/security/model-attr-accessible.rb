class bad_attr_accessible
   include  ActiveModel::MassAssignmentSecurity
   
   # rule-id: model-attr-accessible
   attr_accessible :name, :admin, 
                   :telephone, as: :create_params
   # rule-id: model-attr-accessible
   attr_accessible :name, :banned, 
                   as: :create_params
   # rule-id: model-attr-accessible
   attr_accessible :role, 
                   :telephone, as: :create_params
   # rule-id: model-attr-accessible
   attr_accessible :name, 
                   :account_id, as: :create_params

   # rule-id: model-attr-accessible
   User.new(params.permit(:name, :admin))
   # rule-id: model-attr-accessible
   params_with_conditional_require(ctrl.params).permit(:name, :age, :admin)

   # rule-id: model-attr-accessible
   User.new(params.permit(:role))
   # rule-id: model-attr-accessible
   params_with_conditional_require(ctrl.params).permit(:name, :age, :role)

   # rule-id: model-attr-accessible
   User.new(params.permit(:banned, :name))
   # rule-id: model-attr-accessible
   params_with_conditional_require(ctrl.params).permit(:banned, :name, :age)

   # rule-id: model-attr-accessible
   User.new(params.permit(:address, :account_id, :age))
   # rule-id: model-attr-accessible
   params_with_conditional_require(ctrl.params).permit(:name, :account_id, :age)
   
   # rule-id: model-attr-accessible   
   params.permit!
end

class ok_attr_accessible
   # ok
   attr_accessible :name, :address, :age, 
                   :telephone, as: :create_params
   # ok
   User.new(params.permit(:address, :acc, :age))
   # ok
   params_with_conditional_require(ctrl.params).permit(:name, :address, :age)
end
