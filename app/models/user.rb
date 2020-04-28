class User < IdentityRecord
  # Note: you can include any module you want. If available,
  # token authentication will be performed before any other
  # Devise authentication method.
  #
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :invitable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable,
         :lockable, :confirmable, :timeoutable, :trackable,
         :jwt_authenticatable, :registerable,
         jwt_revocation_strategy: JwtBlacklist
         
  validates_uniqueness_of :email, :case_sensitive => false

  # Inject data into the JWT Token
  def jwt_payload
    super.merge({ user_id: id })
  end

  # Executed "when a token is dispatched" for a User
  def on_jwt_dispatch(token, payload)
    # do_something(token, payload)
  end

end

