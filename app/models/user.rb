class User < IdentityRecord
  validates_uniqueness_of :email, :case_sensitive => false
end

