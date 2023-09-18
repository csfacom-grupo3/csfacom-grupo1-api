class User < ApplicationRecord
  extend Enumerize
  include TokenAuthenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  serialize :permission, Array
  enumerize :permission, in: [:projects, :news, :admin], multiple: true, predicates: true

end
