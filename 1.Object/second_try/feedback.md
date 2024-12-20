# 1. 図書館管理システム(レベル6)

## できなかったこと
とくになし

# 2. 従業員の給与計算システム(レベル6)

## できなかったこと
スーパークラスで定義したgenerate_pay_slipメソッドを子クラスでどう呼び出すか。
super(salary)としていたが、salaryはcal_salaryメソッドの返り値なので
```ruby
def generate_pay_slip
    super(cal_salary)
end
```
としなければいけなかった

