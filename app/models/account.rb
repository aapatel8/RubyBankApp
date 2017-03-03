class Account < ApplicationRecord
  belongs_to :user

  validates_length_of :AccountNumber, :is => 9
  has_many :losses, :class_name => 'Transaction', :foreign_key => 'source_account_id'
  has_many :gains, :class_name => 'Transaction', :foreign_key => 'dest_account_id'
end
