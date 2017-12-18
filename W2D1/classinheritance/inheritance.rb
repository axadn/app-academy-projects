class Employee
  attr_reader :name, :title, :salary, :boss
  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
    @boss.employees << self unless @boss.nil?
  end

  def bonus(multiplier)
    @salary * multiplier
  end
end

class Manager < Employee
  attr_accessor :employees
  def initialize(name, title, salary, boss)
    super(name, title, salary, boss)
    @employees = []
  end

  def bonus(multiplier)
    multiplier * get_all_sub_salaries
  end

  def get_all_sub_salaries
    sum = 0
    @employees.each do |employee|
      sum += employee.salary
      sum += employee.get_all_sub_salaries if employee.is_a?(Manager)
    end
    sum
  end
end

ned = Manager.new("Ned","Founder",1_000_000, nil)
darren = Manager.new("Darren","TA Manager",78_000, ned)
shawna = Employee.new("Shawna","TA",12_000, darren)
david = Employee.new("David","TA",10_000, darren)

p ned.bonus(5)
p darren.bonus(4)
p shawna.bonus(6)
p david.bonus(3)
