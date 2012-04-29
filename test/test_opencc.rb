require 'test_helper'

class OpenccTest < Test::Unit::TestCase
  def test_opencc_open
    od = Opencc.open nil
    assert_not_nil od, "Opencc.open should return a handle"
  end
  def test_opencc_convert
    od = Opencc.open nil
    rs = Opencc.convert od, "新年快乐"
    assert_equal "新年快樂", rs
  end
end
