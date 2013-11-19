# encoding: utf-8

class Post < ActiveRecord::Base
  validates :body, length: {maximum: 1000}
end
