class RequestAccept < ApplicationRecord
	belongs_to :driver
	belongs_to :request
end
