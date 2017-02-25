class Transaction < ApplicationRecord
  belongs_to :source_account, :class_name => 'Account', optional: true
  belongs_to :dest_account, :class_name => 'Account', optional: true
end
