class Kind < ApplicationRecord
  belongs_to :user
  validates :message, length: { minimum: 2}
end
