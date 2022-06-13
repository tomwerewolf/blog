class Comment < ApplicationRecord
  #Inlude module Visible in Concern
  include Visible
  
  #ActiveRecord Assosiation
  belongs_to :article

end
