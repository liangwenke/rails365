class Group < ActiveRecord::Base
  has_many :articles, dependent: :nullify
  validates :name, presence: true
end
