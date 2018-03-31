class Post < ApplicationRecord
	belongs_to :user
	validates_presence_of :rationale, :date
end
