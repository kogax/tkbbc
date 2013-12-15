# encoding: utf-8

class Post < ActiveRecord::Base
  belongs_to :board

  validates :body, length: {maximum: 1000}, presence: true
  #validates :board_id, presence: true
end
