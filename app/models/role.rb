class Role < ActiveRecord::Base
  attr_accessible :role_id, :name, :notice
  self.primary_key = :role_id
  has_many :users_roles #, foreign_key: 'role_id'
  has_many :users, through: :users_roles, foreign_key: :username
end
