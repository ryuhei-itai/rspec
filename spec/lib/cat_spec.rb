require "rails_helper"
require "cat"

describe Cat do

  # インスタンスを生成する

  let(:tama) { Cat.new('tama', Cat::YOUNG) }
  let(:neko) { Cat.new(:neko, Cat::OLD) }

  # クラスメソッドの呼び出し

  # 内部的にインスタンスを生成する
  let(:zizi) { Cat.young("zizi") }
  # インスタンスを生成しない
  let(:kiki) { Cat.old("kiki") }

  describe "name" do
    it "is 'tama'" do
      expect(tama.name).to eq 'tama'
    end
    it "is 'neko'" do
      expect(neko.name.to_s).to eq 'neko'
    end
    it "is 'zizi'" do
      expect(zizi.name).to eq 'zizi'
    end
    it "is not 'kiki'" do
      # attr_accessorメソッドはインスタンス変数を定義するので読み込めない
      # 代わりにclass.nameは名前空間を取得する
      expect(kiki.name).to eq 'Cat'
    end
  end

  describe "older" do
    it "is not 'old'" do
      # attr_accessorメソッドはインスタンス変数を定義するので読み込めない
      expect{ kiki.older }.to raise_error(NoMethodError)
    end
  end

  describe "hello" do
    # contextはifに相当する
    context "is young" do
      it "by tama" do
        expect(tama.hello).to eq 'nyao!!'
      end
      it "by zizi" do
        expect(zizi.hello).to eq 'nyao!!'
      end
    end
    context "is old" do
      it "by neko" do
        expect(neko.hello).to eq 'nya'
      end
      it "by kiki" do
        # インスタンスを生成していないので、インスタンスメソッドは読み込めない
        expect{ kiki.hello }.to raise_error(NoMethodError)
      end
    end
  end
end
