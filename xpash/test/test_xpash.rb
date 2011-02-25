require File.dirname(__FILE__) + '/test_helper.rb'

class TestXPash < Test::Unit::TestCase

  def setup
    @xpash = XPash.new("#{File.dirname($0)}/test.html")
  end
  
  def test_truth
    assert true
  end

  def test_cd
    cd_common("h3", 5, "//h3")
  end

  def test_cd_plural
    cd_common("div", 3, "//div")
    cd_common("article", 1, "//div/article")
    cd_common("..", 3, "//div")
  end

  def test_cd_abspath
    cd_common("/html/head/link", 3, "/html/head/link")
    
    cd_common("//div//li", 3, "//div//li")
  end

  def cd_common(input, expect_return, expect_query)
    assert_equal(expect_return, @xpash.cd(input))
    assert_equal(expect_query, @xpash.query)
    if /^.+?:\d+(?::in `(.*)')?/ =~ caller.first
      puts
      puts "#{$1}:"
      @xpash.list
      puts
    end
  end
end
