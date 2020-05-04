class User < IdentityRecord
  # Note: you can include any module you want. If available,
  # token authentication will be performed before any other
  # Devise authentication method.
  #
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :invitable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :trackable, :validatable,
         :lockable, :confirmable, :trackable,
         :jwt_authenticatable, :registerable,
         jwt_revocation_strategy: JwtBlacklist
         
  validates_uniqueness_of :email, :case_sensitive => false

  # Inject data into the JWT Token
  def jwt_payload 
    { email: email } # user_id already provided as 'sub' key
  end

  # Executed after a token is generated for a User
  def on_jwt_dispatch(token, payload)
    # do_something(token, payload)
  end

end

