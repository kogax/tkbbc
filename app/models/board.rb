# encoding: utf-8

class Board < ActiveRecord::Base
  has_many :posts
  validates :title, presence: true, length: { maximum: 100 }
end
