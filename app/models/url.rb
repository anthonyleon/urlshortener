class Url < ActiveRecord::Base
  validates :original_url, presence: true
end
