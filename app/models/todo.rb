class Todo < ActiveRecord::Base
  attr_accessible :description, :done, :limit_on, :title, :username, :user
  #attr_accessor :user
  belongs_to :user, :foreign_key => :username

  validates :title, presence: true
  validates :limit_on, presence: true


  scope :by_user, proc {|user| {conditions: {username: user.username}}}
  #scope :incomplete, proc { {conditions: {done: false}}}
  #scope :complete, proc { {conditions: {done: true}}}

  leapfrog :username
end
