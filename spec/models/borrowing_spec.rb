require 'rails_helper'

RSpec.describe Borrowing, :type => :model do
  # Borrowingはuser_idなしでバリデーションに失敗する
  context 'without user' do
    it 'is not valid' do
      borrowing = Borrowing.new
      borrowing.user = nil
      expect(borrowing).not_to be_valid
    end
  end

  describe '#overdue?' do
  context 'due_back is tomorrow' do
    # beforeフック
    before do
      @borrowing = Borrowing.new(due_back: 1.days.since)
    end

    it "returns false when attribute is default(today)" do
      expect(@borrowing.overdue?).to be(false)
    end

    it "returns true when attribute is 2 days later" do
      expect(@borrowing.overdue?(2.days.since)).to be(true)
    end
  end
end

  # ブロックなしで呼び出すと、保留のサンプルとして出力
  # もしくはブロック内にskipを記述してもいい
  it "will be deleted when user deleted"
end
