class Note < ActiveRecord::Base
  validates :author, :title, :content, presence: true
end
