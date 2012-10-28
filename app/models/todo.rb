class Todo < ActiveRecord::Base
  attr_accessible :description, :done, :limit_on, :title
end
