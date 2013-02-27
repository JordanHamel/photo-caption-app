class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # REV: do not use tabstops; you need to indent with spaces
  # REV: I wouldn't have stored the binary data in the `User`;
  # typically a photo is very large and should be stored in its own
  # table so that it isn't fetched with the rest of the object.
  attr_accessible :email, :password, :password_confirmation, :remember_me,
  								:name, :profile_pic

  validates :name, presence: true

  has_many :photos
end
