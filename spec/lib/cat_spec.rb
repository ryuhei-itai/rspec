require "rails_helper"
require "cat"

describe Cat do

  before(:all) do
    # インスタンスを生成する

    @tama = Cat.new("tama", Cat::YOUNG)
    @neko = Cat.new(:neko, Cat::OLD)

    # クラスメソッドの呼び出し

    # 内部的にインスタンスを生成する
    @zizi = Cat.young("zizi")
    # インスタンスを生成しない
    @kiki = Cat.old("kiki")
  end

  describe "name" do
    it "is 'tama'" do
      expect(@tama.name).to eq 'tama'
    end
    it "is 'neko'" do
      expect(@neko.name.to_s).to eq 'neko'
    end
    it "is 'zizi'" do
      expect(@zizi.name).to eq 'zizi'
    end
    it "is 'kiki'" do
      # attr_accessorメソッドはインスタンス変数を定義するので読み込めない
      expect{ @kiki.name }.to raise_error(NoMethodError)
    end
  end

  describe "hello" do
    context "is 'nyao!!'" do
      it "by tama" do
        expect(@tama.hello).to eq 'nyao!!'
      end
      it "by zizi" do
        expect(@zizi.hello).to eq 'nyao!!'
      end
    end
    context "is 'nya'" do
      it "by neko" do
        expect(@neko.hello).to eq 'nya'
      end
      it "by kiki" do
        # インスタンスを生成していないので、インスタンスメソッドは読み込めない
        expect{ @kiki.hello }.to raise_error(NoMethodError)
      end
    end
  end
end