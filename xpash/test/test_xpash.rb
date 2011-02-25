require File.dirname(__FILE__) + '/test_helper.rb'

class TestXPash < Test::Unit::TestCase

  def setup
    @xpash = XPash.new("#{File.dirname($0)}/test.html")
  end
  
  def test_truth
    assert true
  end

  def test_cd
    asserts_cd("h3", 5, "//h3")
  end

  def test_cd_multiple
    asserts_cd("div", 3, "//div")
    asserts_cd("article", 1, "//div/article")
    asserts_cd("..", 3, "//div")
  end

  def test_cd_abspath
    asserts_cd("/html/head/link", 3, "/html/head/link")
    
    asserts_cd("//div//li", 3, "//div//li")
  end

  def asserts_cd(input, expect_return, expect_query)
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
