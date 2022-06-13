class Article < ApplicationRecord
  #Inlude module Visible in Concern
  include Visible
  
  #ActiveRecord Association
  has_many :comments, dependent: :destroy
  
  #ActiveRecord Validation
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
