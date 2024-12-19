class Employee
    def initialize(name)
        @name = name
    end

    def generate_pay_slip(salary)
        puts "Name: #{@name}\nSalary: #{salary.round}円" #　浮動小数点は四捨五入をする
    end
end

class FullTimeEmployee < Employee
    # スキルごとの基本給を代入
    SKILL_LEVEL_SALARY ={
        "Beginner" => 200_000,
        "Intermediate" => 300_000,
        "Advanced" => 400_000
    }

    AGE_BONUS = 1000
    # 初期値を代入し、基本給をskill_levelにて判断する
    def initialize(name,age,skill_level)
        super(name)
        @age = age
        @skill_level = skill_level
        @base_salary = SKILL_LEVEL_SALARY[skill_level]
    end

    # 給与計算
    def calculate_salary
        @base_salary + @age * AGE_BONUS
    end
    # 給与明細を出力
    def generate_pay_slip
        super(calculate_salary)
    end
end

class PartTimeEmployee < Employee
    # 時給を定数として定義
    HOURLY_RATE = 1500

    def initialize(name,hours_worked)
        super(name)
        @hours_worked = hours_worked
    end

    def calculate_salary
        HOURLY_RATE * @hours_worked
    end
    # 給与明細を出力
    def generate_pay_slip
        super(calculate_salary)
    end
end

class ContractEmployee < Employee
    # 時給と残業代の割合を定数として定義
    HOURLY_RATE = 2000
    OVERTIME_RATE = 1.25
    
    def initialize(name,hours_worked)
        super(name)
        @hours_worked = hours_worked
    end

    def calculate_salary
        if @hours_worked > 160
            return HOURLY_RATE * (160 + (@hours_worked - 160)* OVERTIME_RATE ) # 働いた時間から160時間をオーバーした時間に残業代をかける
        else
            return HOURLY_RATE * @hours_worked
        end
    end
    def generate_pay_slip
        super(calculate_salary)
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