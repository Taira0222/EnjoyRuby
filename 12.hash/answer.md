# 問題1(レベル4)
```ruby
# ユーザー管理用のハッシュ
users = {}

# ユーザーを追加
users[1] = "Alice"
users[2] = "Bob"

# ユーザーが存在するか確認
puts users.key?(1) # => true
puts users.has_key?(3) # => false

# ユーザーを削除
users.delete(2)

# 全てのユーザーを表示
users.each do |id, name|
  puts "ID: #{id}, 名前: #{name}"
end
```

# 問題2(レベル5)
```ruby
require 'sinatra'
require 'json'

products = {}

# GET /products
get '/products' do
  content_type :json
  products.to_json
end

# POST /products
post '/products' do
  data = JSON.parse(request.body.read)
  id = data['id']
  name = data['name']
  stock = data['stock']
  
  if products.key?(id)
    status 400
    return { error: "Product with ID #{id} already exists." }.to_json
  end
  
  products[id] = { name: name, stock: stock }
  status 201
  { message: "Product added." }.to_json
end

# DELETE /products/:id
delete '/products/:id' do
  id = params['id'].to_i
  if products.delete(id)
    { message: "Product deleted." }.to_json
  else
    status 404
    { error: "Product not found." }.to_json
  end
end
```

# 問題3(レベル6)
```ruby
# app/controllers/tasks_controller.rb
class TasksController < ApplicationController
  before_action :set_tasks

  # GET /tasks
  def index
    @status = params[:status]
    @filtered_tasks = if @status
                        @tasks.select { |id, task| task[:status] == @status }
                      else
                        @tasks
                      end
  end

  # DELETE /tasks/complete
  def delete_complete
    @tasks.delete_if { |id, task| task[:status] == '完了' }
    redirect_to tasks_path, notice: '完了したタスクを削除しました。'
  end

  private

  def set_tasks
    # 仮のタスクデータ
    @tasks ||= {
      1 => { title: 'タスク1', status: '未完了' },
      2 => { title: 'タスク2', status: '完了' },
      3 => { title: 'タスク3', status: '未完了' }
    }
  end
end
```
```erb
<!-- app/views/tasks/index.html.erb -->
<h1>タスク一覧</h1>

<%= link_to '完了したタスクを削除', delete_complete_tasks_path, method: :delete, data: { confirm: '本当に削除しますか？' } %>

<ul>
  <% @filtered_tasks.each do |id, task| %>
    <li>
      <strong><%= task[:title] %></strong> - <%= task[:status] %>
    </li>
  <% end %>
</ul>
```

# 問題4(レベル7)
```ruby
class ConfigManager
  def initialize
    @configs = {}
  end

  def add_config(key, value = nil)
    key = key.to_sym
    @configs[key] = value

    define_singleton_method("get_#{key}") do
      @configs[key]
    end

    define_singleton_method("set_#{key}") do |new_value|
      @configs[key] = new_value
    end
  end

  def method_missing(method, *args, &block)
    if method.to_s.start_with?('get_') || method.to_s.start_with?('set_')
      super
    else
      super
    end
  end

  def respond_to_missing?(method, include_private = false)
    method.to_s.start_with?('get_') || method.to_s.start_with?('set_') || super
  end
end

# 使用例
config = ConfigManager.new
config.add_config(:database, 'postgres')
config.add_config(:timeout, 30)

puts config.get_database   # => "postgres"
config.set_timeout(45)
puts config.get_timeout    # => 45

# 存在しない設定項目の場合
# config.get_api_key       # => NoMethodError
```
