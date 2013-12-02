# encoding: utf-8

class Board < ActiveRecord::Base
  validates :title, presence: true, length: { maximum: 100 }
end
