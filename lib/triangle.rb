require 'pry'

class Triangle
  # write code here
  attr_reader :num1, :num2, :num3

  def initialize(num1,num2,num3)
    @num1 = num1
    @num2 = num2
    @num3 = num3
  end

  def kind
    validate
    if num1 == num2 && num2 == num3 
      :equilateral
    elsif num1 == num2 || num2 == num3 || num1 == num3
      :isosceles
    else
      :scalene
    end
  end
 
  def no_negative_numbers
    [num1, num2, num3].all?(&:positive?)
   
  end

  def violate_inequality
    num1 + num2 > num3 && num1 + num3 > num2 && num2 + num3 > num1
  end

  def validate
    raise TriangleError unless no_negative_numbers && violate_inequality
  end

  class TriangleError < StandardError
  end

end

binding.pry


