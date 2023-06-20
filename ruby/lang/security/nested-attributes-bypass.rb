def bad_nested_attributes_bypass
    accepts_nested_attributes_for allow_destroy: false

    accepts_nested_attributes_for :avatar, :book, allow_destroy: false

    accepts_nested_attributes_for :avatar, :book, allow_destroy: false, :name
end

def ok_nested_attributes_bypass
    has_one :avatar
    accepts_nested_attributes_for :avatar, allow_destroy: true
end
