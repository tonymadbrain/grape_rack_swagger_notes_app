class Note < ActiveRecord::Base
  validates :author, :title, :body, presence: true
end
