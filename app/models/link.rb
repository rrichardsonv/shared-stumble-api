class Link < ApplicationRecord
  belongs_to :digger, class_name: 'User', foreign_key: :digger_id
  validates :title, :url, presence: true
  validates :url, uniqueness: true
end
