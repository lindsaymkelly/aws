class ClassDescription < ApplicationRecord
  validates_presence_of :classification, :title, :description, :fees
  
end
