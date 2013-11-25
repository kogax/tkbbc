# encoding: utf-8

class Post < ActiveRecord::Base
  validates :body, length: {maximum: 1000}, presence: true, uniqueness: true
end
