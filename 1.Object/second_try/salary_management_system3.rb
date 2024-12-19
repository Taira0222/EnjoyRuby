class Employee
    attr_accessor :name
    def initialize(name)
        @name = name
    end

    def generate_pay_slip(salary)
        puts "名前: #{@name} 給料: #{salary.round}円"
    end

end

class FullTimeEmployee < Employee
    # スキル給料
    SKILL_LEVEL_SALARY = {
        "Beginner" => 200_000,
        "Intermediate" => 300_000,
        "Advanced" => 400_000
    }
    # 年齢ボーナス
    AGE_BONUS = 1000

    def initialize(name,age,skill_level)
        super(name)
        @age = age
        @base_salary = SKILL_LEVEL_SALARY[skill_level]
    end

    def cal_salary
        salary = @base_salary + AGE_BONUS * @age
    end

    def generate_pay_slip
        super(cal_salary)
    end
end

class PartTimeEmployee < Employee
    PARTLY_RATE = 1500
    def initialize(name,hours_worked)
        super(name)
        @hours_worked = hours_worked
    end

    def cal_salary
        salary = PARTLY_RATE * @hours_worked
    end

    def generate_pay_slip
        super(cal_salary)
    end
end
class ContractEmployee < Employee
    PARTLY_RATE = 2000
    OVER_TIME_RATE = 1.25

    def initialize(name,hours_worked)
        super(name)
        @hours_worked = hours_worked
    end

    def cal_salary
        if @hours_worked > 160
            over_time = @hours_worked - 160
            salary = PARTLY_RATE * (160 + over_time* OVER_TIME_RATE)
        else
            salary = PARTLY_RATE * @hours_worked
        end
    end

    def generate_pay_slip
        super(cal_salary)
    end
end

# 正社員のインスタンスを作成
fulltimeemployee1 = FullTimeEmployee.new("Taira",27,"Beginner")
fulltimeemployee2 = FullTimeEmployee.new("Miho",31,"Intermediate")

puts "\n-----------------社員ごとに給与明細を発行---------------"
fulltimeemployee1.generate_pay_slip
puts "\n-----------------社員ごとに給与明細を発行---------------"
fulltimeemployee2.generate_pay_slip

# アルバイトのインスタンスを作成
parttimeemployee1 = PartTimeEmployee.new("Miho",60)
parttimeemployee2 = PartTimeEmployee.new("Taira",70)

puts "\n-----------------アルバイトごとに給与明細を発行---------------"
parttimeemployee1.generate_pay_slip
puts "\n-----------------アルバイトごとに給与明細を発行---------------"
parttimeemployee2.generate_pay_slip


# 契約社員のインスタンスを作成
contractemployee1 = ContractEmployee.new("Miho",180.5)
contractemployee2 = ContractEmployee.new("Taira",150)

puts "\n-----------------契約社員ごとに給与明細を発行---------------"
contractemployee1.generate_pay_slip
puts "\n-----------------契約社員ごとに給与明細を発行---------------"
contractemployee2.generate_pay_slip


