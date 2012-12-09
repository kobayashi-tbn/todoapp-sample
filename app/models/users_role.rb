class UsersRole < ActiveRecord::Base
  attr_accessible :role_id, :username
  belongs_to :user, foreign_key: :username
  belongs_to :role #, foreign_key: 'role_id'
end
