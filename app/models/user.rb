class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :gender, :provider, :uid, :fb_access_token
  # attr_accessible :title, :body
  validates :first_name, :last_name, :presence => true 

  def fullname
  	[first_name,last_name].join(" ")
  end

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    access_token = auth.credentials.token
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    puts "change 1"
	  unless user
	  	user = User.where(:email => auth.info.email).first
	  	if user
	  		user.provider = auth.provider
	  		user.uid = auth.uid
	  		user.save!
	  	else
	  		f_name = auth.extra.raw_info.name.split(" ").first if auth.extra.raw_info.name
	  		l_name = auth.extra.raw_info.name.split(" ").last if auth.extra.raw_info.name and auth.extra.raw_info.name.split(" ").size>1
	    	user = User.create(first_name:f_name,
	    					 last_name:l_name,
	                         provider:auth.provider,
	                         uid:auth.uid,
	                         email:auth.info.email,
	                         password:Devise.friendly_token[0,20]
	                         )
	    end
	  end
    user.update_attribute("fb_access_token", access_token)
	  user
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def method2
    puts "conflict"
  end
end
