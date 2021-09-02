class Chatroom < ApplicationRecord
  has_many :messages
  has_many :users, through: :messages

  def other_user(current)
    both = users.uniq
    other = both.reject { |user| user == current }.first
    other ? (other.first_name || other.company_name) : 'New Message'
  end
end
