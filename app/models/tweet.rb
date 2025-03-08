class Tweet < ApplicationRecord
	validates :content, presence: true
	validates :content, length: { maximum: 280 }
end
