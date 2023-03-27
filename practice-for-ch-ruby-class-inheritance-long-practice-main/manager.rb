require "./employee.rb"

class Manager < Employee

    attr_accessor :employees

    def initialize(name, title, salary, boss)
        super(name, title, salary, boss)
        @employees = []
        if !boss.nil?
            boss.employees << self
        end
    end

    def bonus(multiplier)
        bonus = 0
        @employees.each do |employee|
            bonus += employee.salary
            if employee.is_a?(Manager)
                employee.employees.each do |ele|
                    bonus += ele.salary
                end
            end
        end
        bonus * multiplier
    end

    def add_employee(employee)
        @employees << employee
    end
end


ned = Manager.new("Ned", "Founder", 1000000, nil)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren)

darren.add_employee(shawna)
darren.add_employee(david)

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000