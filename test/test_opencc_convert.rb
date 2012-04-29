require 'test_helper'

class OpenccConvertTest < Test::Unit::TestCase
  def test_opencc
    opencc = Opencc::Convert.new
    rs = opencc.convert "新年快乐"
    assert_equal "新年快樂", rs
  end
end

