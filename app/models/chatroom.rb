class Chatroom < ApplicationRecord
  has_many :messages
  belongs_to :owner, class_name: "User"
  belongs_to :invitee, class_name: "User"
  validates :owner, :invitee, presence: true

  def exist_with?(user1, user2)
    (owner == user1 || invitee == user1) && (owner == user2 || invitee == user2)
  end

  def other(user)
    owner == user ? invitee : owner
  end
end
