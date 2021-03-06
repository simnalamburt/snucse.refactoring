require_relative 'DateCalculator'
require 'minitest/autorun'

class TestDateCalculator < Minitest::Test
  def helper_leapyear(year)
    calc = DateCalculator.new 0
    calc.year = year
    calc.leap_year?
  end

  def test_leapyear
    assert helper_leapyear(2004)
    assert !helper_leapyear(1900)
    assert helper_leapyear(2000)
  end

  def help_addleapyear(date, year)
    calc = DateCalculator.new date
    calc.year = year
    calc.add_leap_year
    calc.year
  end

  def test_addleapyear
    assert_equal 2008, help_addleapyear(255, 2008)
    assert_equal 2009, help_addleapyear(400, 2008)
    assert_equal 2009, help_addleapyear(366, 2008)
  end

  def help_addregularyear(date, year)
    calc = DateCalculator.new date
    calc.year = year
    calc.add_regular_year
    calc.year
  end

  def test_addregularyear
    assert_equal 2009, help_addregularyear(255, 2009)
    assert_equal 2010, help_addregularyear(400, 2009)
    assert_equal 2010, help_addregularyear(366, 2009)
  end

  def help_convert(date, year)
    calc = DateCalculator.new date
    calc.year = year
    calc.convert
  end

  def test_convert
    assert_equal 2009, help_convert(364, 2009)
    assert_equal 2008, help_convert(365, 2008)
    assert_equal 2010, help_convert(365, 2009)
    assert_equal 2009, help_convert(366, 2008)
    assert_equal 2010, help_convert(366, 2009)
    assert_equal 2009, help_convert(367, 2008)
  end
end
