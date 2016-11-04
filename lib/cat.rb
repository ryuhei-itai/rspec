class Cat
  attr_accessor :name, :older, :mew
  YOUNG = :young
  OLD   = :old

  # コンストラクタ
  def initialize(name, older)
    @name, @older  = name, older
    set_mew
  end

  # クラスメソッド
  def self.young(name)
    new(name, YOUNG)
  end

  # クラスメソッド
  def self.old(name)
    @name, @older  = name, OLD
    self
  end

  # インスタンスメソッド
  def hello
    @mew
  end

  private
  # インスタンスメソッド
  def set_mew
    if @older == YOUNG
      @mew = "nyao!!"
    else
      @mew = "nya"
    end
  end
end
