class Rating < ActiveRecord::Base

  validates :value, presence: true , numericality: { only_integer: true }

  belongs_to :user
end
