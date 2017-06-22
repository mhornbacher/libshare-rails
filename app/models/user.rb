class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:github]

  has_many :reviews

  # validates :username, uniqueness: true #for some reasion this is validating presence as well  use next line
  validates_uniqueness_of :username, allow_nil: true, allow_blank: true

  # Instance methods
  def display_name
    !self.username.nil? ? self.username : self.email
  end

  # Class methods
  def self.from_github(user_hash)
    # if we get an email from github lets use that
    if user_hash[:info][:email]
      where(email: user_hash[:info][:email]).first_or_create{ |user| self.from_github_fill(user, user_hash) }
    else
      where(provider: user_hash[:provider], uid: user_hash[:uid]).first_or_create{ |user| self.from_github_fill(user, user_hash) }
    end
  end

  # seperate duplicate code for setting up user
  private
  def self.from_github_fill(user, user_hash)
    user.provider = user_hash[:provider]
    user.uid = user_hash[:uid]
    user.email = user_hash[:info][:email]
    user.username = user_hash[:info][:nickname]
    user.password = SecureRandom.hex
  end
end
