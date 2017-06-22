class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:github]

  has_many :reviews

  # validates :username, uniqueness: true #for some reasion this is validating presence as well

  def self.from_github(user_hash)
    binding.pry
  end

end
