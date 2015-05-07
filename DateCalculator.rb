class DateCalculator
  attr_accessor :date, :year

  def initialize(date)
    @date = date
    @year = 1980
  end

  def convert()
    while leap_year? ? add_leap_year : add_regular_year
    end
    @year
  end

  def leap_year?
    @year % 400 == 0 || (@year % 4 == 0 && @year % 100 != 0)
  end

  def add_leap_year
    return false if @date < 366
    @date -= 366
    @year += 1
    true
  end

  def add_regular_year
    return false if @date < 365
    @date -= 365
    @year += 1
    true
  end
end


if __FILE__ == $0
  year = DateCalculator.new ARGV[0].to_i
  puts year.convert
end


__END__
start with Year = 1980
while (days remaining > 365)
  if Year is a leap year
    then if possible, peel off 366 days and advance Year by 1
  else
    peel off 365 days and advance Year by 1
return Year
