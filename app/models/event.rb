class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :participations, foreign_key: "attended_event_id"
  has_many :attendees, through: :participations

  validates :date, presence: true
  validates :location, presence: true

  class << self
    def past
      where(date: (...Date.today))
    end

    def upcoming
      where(date: (Date.today..))
    end
  end

  def to_s
    "#{location} at #{date}, created by #{creator}"
  end
end
