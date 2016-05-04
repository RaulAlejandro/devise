class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable #:recoverable, :rememberable #, #:trackable, :validatable #, :lockable

  # Setup accessible (or protected) attributes for your model
  #attr_accessible :email, :password

  #devise :encryptable, :encryptor => :md5

  

#  def valid_password?(password)
 # 	return false if encrypted_password.blank?
  #	Devise.secure_compare(Devise::Encryptable::Encryptors::Md5.digest(password, nil, nil, nil), self.encrypted_password)
 # end

	#def role?(role)
	 #   return !!self.user.find_by_profile(profile.to_i)
	#end

	def admin?
	  self.profile == "admin"
	end

	def username?
	  self.profile == "username"
	end

end