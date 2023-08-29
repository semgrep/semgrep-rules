class Bad_use_nested_attrs
  has_one :author
  has_many :pages

  accepts_nested_attributes_for :author, :pages
end

class Ok_use_nested_attrs
  has_one :author
  has_many :pages
end
