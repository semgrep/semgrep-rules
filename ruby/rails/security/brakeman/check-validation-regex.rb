class Account < ActiveRecord::Base
  #ruleid: check-validation-regex
  validates :username, :length => 6..20, :format => /([a-z][0-9])+/i
  #ruleid: check-validation-regex
  validates :phone, :format => { :with => /(\d{3})-(\d{3})-(\d{4})/, :on => :create }, :presence => true 
  #ruleid: check-validation-regex
  validates :first_name, :format => /\w+/
  serialize :cc_info #safe from CVE-2013-0277
  attr_accessible :blah_admin_blah
end

class Account < ActiveRecord::Base
  #ruleid: check-validation-regex
  validates_format_of :name, :with => /^[a-zA-Z]+$/
  #ruleid: check-validation-regex
  validates_format_of :blah, :with => /\A[a-zA-Z]+$/
  #ruleid: check-validation-regex
  validates_format_of :blah2, :with => /^[a-zA-Z]+\Z/
  #ruleid: check-validation-regex
  validates_format_of :something, :with => /[a-zA-Z]\z/
  #ok: check-validation-regex
  validates_format_of :good_valid, :with => /\A[a-zA-Z]\z/ #No warning
  #ok: check-validation-regex
  validates_format_of :not_bad, :with => /\A[a-zA-Z]\Z/ #No warning

  def mass_assign_it
    Account.new(params[:account_info]).some_other_method
  end

  def test_class_eval
    #Should not raise a warning
    User.class_eval do
      attr_reader :some_private_thing
    end
  end
end
