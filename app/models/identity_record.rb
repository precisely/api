# Models which inherit from this class will be stored in the identity database
class IdentityRecord < ActiveRecord::Base
  self.abstract_class = true
  connects_to database: { writing: :identity, reading: :identity }
end
