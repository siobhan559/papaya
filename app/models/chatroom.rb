class Chatroom < ApplicationRecord
  has_many :messages
  belongs_to :owner, class_name: "User"
  belongs_to :invitee, class_name: "User"
end
