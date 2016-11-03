class Borrowing < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  validates :user_id, presence: true

  def overdue?
    due_back > 1.days.since
  end

  def overdue?(day=nil)
    if day == nil
      false
    else
      true
    end 
  end


end
