class Request < ApplicationRecord
	belongs_to :user
	has_many :request_accepts, dependent: :destroy
end
