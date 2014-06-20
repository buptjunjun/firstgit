#打印一个字符串
puts "hello"

print "2 +2 is equal to " ,2+2

#把hello world 打印4次
10.times do print "hello world!" end
 #puts 和 print的区别在于，puts会自动换行
puts 

# 一个类
class Person
  #为person定义了三个属性 ，attr表示属性，accessor表示这些属性是可以访问的
  attr_accessor :name,:age,:gender
end #end与class配对

#创建person的新实例
p = Person.new
p.name="Andy"
p.age=10
p.gender="male"

print p.name


# 下面是类的继承
class Pet
   attr_accessor :name, :gender, :color
end

class Cat <Pet
end

class Dog <Pet
  #类的方法
  def bark
    puts "wang wang!"
  end
end

#snake 有自己的属性 length
class Snake <Pet
  attr_accessor :length
end


snake = Snake.new
snake.length=10
snake.name="Yami"
puts " #{snake.name}'s length is #{snake.length }"

dog = Dog.new
dog.bark()

#ruby 的反射
puts "---反射---"
puts dog.class
puts 2.class #Fixnum


#kernel模块 ruby的核心模块 ，  在每一个类和有效的范围中使用
puts "---kernel 模块---"
Kernel.puts "hello"


puts "---字符串 String---"
str = "this is test"
puts str.class
puts str.length
puts str.upcase


## ruby的表达式
puts "--ruby的表达式---"
puts "a"+"b"+"c"
age = 19
puts "you are too young" if age > 18 && age < 20
puts "you are too young" if age.between?(18,20) 
puts 8<=>10
puts 10<=>8
puts 10<=>10
puts 8==10

puts "---迭代子---"
#将do后面的代码块传递给times
2.times do
  puts "hello"
  puts "laopo"
end

#也可以这样
2.times {
  puts "hello"
  puts "laopo"
}

puts "---迭代子中访问当前迭代数字---"
puts "从0开始每一步是2,num是当前迭代的步数"
0.step(5,2) do
  |num| puts num
end

puts "---浮点数 转换---"
puts 3.to_f / 3
puts 3.0.to_i / 3



puts "---大写字母开头的为常量名,想想类也是大写字母开头---"
Pi = 3.145926
#对常量进行修改会提示错误
Pi = 3.3 #warning: already initialized constant Pi
