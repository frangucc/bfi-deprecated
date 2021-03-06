require "open-uri"

class User < ActiveRecord::Base
  validates :first_name, :last_name, :presence => true
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :provider, :uid ,:level, :city, :state, :avatar_updated_at, :avatar_updated_at, :avatar_updated_at, :avatar_updated_at, :avatar_updated_at,  :avatar_file_size,:avatar_file_name,:avatar_content_type, :bio,:provider, :uid,:cause_ids, :usercause_ids,:avatar,:email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :encrypted_password, :remember_created_at, :current_sign_in_at, :last_sign_in_at, :last_sign_in_ip, :reset_password_token, :reset_password_sent_at, :current_sign_in_ip, :reset_password_sent_at, :current_sign_in_at, :last_sign_in_at, :img_name, :current_sign_in_at, :last_sign_in_at

  has_many :usercauses
  has_many :causes, :through => :usercauses
  has_one :game

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/missing.jpeg"

  has_and_belongs_to_many :badges, :join_table=>:badges_users

  after_create do
    $customerio.identify(
      :id => self.id,
      :email => self.email,
      :created_at => self.created_at.to_i,
      :first_name => self.first_name
    )

    $customerio.track(self.id, "New user") 
  end

  after_destroy do
    $customerio.delete(self.id)
  end

  def display_name
    name=''
    if first_name
      name +=first_name
    end
    if last_name
      name +=' '+last_name
    end

    name
  end

  def location
    location = ""
    if city
      location = city
    end

    if state
      location = state
    end

    if city and state
      location = "#{city}, #{state}"
    end

    location
  end

  def picture_from_url(url)
    self.avatar = open(url)
  end

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    logger.info auth.info.to_yaml
    if user
      
      locationArray=auth.info.location.split(',')
      user.update_attributes({:first_name => auth.info.first_name,
                          :last_name => auth.info.last_name,
                          :city => locationArray[0] ||='',
                          :state => locationArray[1] ||=''
                          })

      #user.picture_from_url "https://graph.facebook.com/#{auth.info.id}/picture"
      #user.save
    else
      user = User.create(  :provider => auth.provider,
                           :uid => auth.uid,
                           :email => auth.info.email,
                           :password => Devise.friendly_token[0,20]
                           )
      
    end
    user
  end
end
