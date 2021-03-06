require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  @@all = []
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @@all << self
  end
  def self.all
    @@all
  end
  def valid?
    if self.sender.valid? && self.receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
  # binding.pry
    if self.sender.balance > self.amount && self.sender.valid? && self.receiver.valid? && self.status == "pending"
    self.receiver.balance += self.amount
    self.sender.balance -= self.amount
    self.status = "complete"
   else
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
     end
  end
  def reverse_transfer
    if self.status == "complete"
      self.receiver.balance -= self.amount
      self.sender.balance += self.amount
      self.status = "reversed"
    end

  end
end