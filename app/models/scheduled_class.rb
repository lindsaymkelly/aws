class ScheduledClass < ApplicationRecord
  validates_presence_of :day, :time, :active?, :name, :about, :instructor

  scope :active, -> { where(active?: true) }
end
