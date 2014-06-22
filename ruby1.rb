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



#字符串
puts("---字符串---")
x="a"
y="b"
puts "successful" if x+y="ab"

puts("---字符串包含多行文本，使用双引号只能包含一行文本，使用分隔符可以包含多行文本 ,不一定使用花括号，可以使用<> ()---")
str = %q{aaa
bbb
ccc}
puts str

puts("---字符串包含多行文本，使用引入文档   <<表示标记了字符串的开始，后面跟的是分解符号---")
str = <<END_STR
aaa
bbb
ccc
END_STR
puts str


puts("---字符串的其他表达式---")
str = "a"*5
puts str
puts 'a'>'A' #比较ascii码
puts 'a'<'A'
puts ?a #查看某个字符的值   97
puts ?b
puts 97.chr # a


#插写 有点像django的模板
puts "---插写---"
x = 10
y = 20
puts "#{x} + #{y} = #{x+y}"
puts "it is a #{ "bad " * 5} world"


#正则表达式
#替换第一个匹配的文本
puts "foobarbar".sub("bar","foo")
#替换所有匹配的文本
puts "foobarbar".gsub("bar","foo")
#//表示一个正则表达式 ^..表示头两个字符
puts "foobarbar".sub(/^../,"ha")

#用正则表达式在进行迭代 ，scan通过传递给他的正则表达式在字符串中扫描，寻找所有匹配的表达式的内容
"xyz".scan(/./) do |letter| 
  puts letter
end

"this is a test".scan(/\w+/) do |letter| 
  puts letter
end 

#匹配查询运算符 =~ 检查是否包含
puts "String has vowels" if "this is a test" =~ /[aeiou]/
puts "String contains no digits" unless "this is a test" =~ /0-9/
#使用字符串的match比=~更强大，它把所有传给他的参数都看做是正则表达式
puts "String has vowels 1" if "this is a test".match(/[aeiou]/)
puts "String has vowels 2" if "this is a test".match("[aeiou]") #可以来自从外部文件中

# 使用括号 x是MatchData
x = "this is a test".match(/(\w+) (\w+)/)
puts x.class
puts x.length
x.length.times {
|num| puts x[num]
}


#数组与列表
puts "---数组与列表---"
a = []
b = [1,"a bc"]

#向数组的末尾加入元素
a  << "a"
a  << 23
puts "a=#{a}"
puts "b=#{b}"
a[0]*=3
puts "*3 : a[0]=#{a[0]}"

#也可以使用push
a.push("push")
puts "push : a=#{a}"
#从末尾弹出
a.pop
puts "pop : a=#{a}"

#join 方法
puts "join : a=#{a.join("|")}"

# scan 返回的是Array
letters = "this is a test".scan(/\w+/)
puts letters.class #Array
puts letters.join(",")
splits = "this is a test".split(/\s+/)
puts splits.class
puts splits.join(",")

# inspect 几乎所有的内置类都有, 相当于java中的toString 
puts "inspec : #{splits.inspect}"


puts "---数组的迭代 each---"
splits.each do |element|
  print element.to_s + "|"
end
puts

puts  "---数组的转化 collect---"
tmp = splits.collect{ |element| element+"X" }
puts tmp.inspect

puts  "---数组的加法减法---"
x = [1,"x"]
y = [2,"y"]
z = x+y
puts z.inspect
tmp = z-x
puts tmp.inspect

puts  "---数组是否为空,是否包含某个元素---"
puts x.empty?
puts z.include?("x")

puts  "---数组的first last reverse方法---"
puts "z.first = #{z.first} z.last = #{z.last}"
puts "z.first(2) = #{z.first(2).inspect} z.last(2) = #{z.last(2).inspect}"
puts "z.reverse = #{z.reverse.inspect}"


##散列表
puts "--散列表---"
dict = {'cat'=>'andy','dog'=>'xitele'}
puts dict.inspect
puts dict["cat"]
dict['cat'] = "Andy Yang"
puts dict.inspect

puts "---散列表 迭代 删除---"
dict.each {|key,value|
  print "#{key} = #{value} "
}
puts
puts "keys = #{dict.keys().inspect()}"
puts "values = #{dict.values().inspect()}"

dict.delete("cat")
puts "delete cat :#{dict.inspect}"

#有条件删除山列表的元素
x = {'a'=>100, 'b'=>200, 'c'=>300}
x.delete_if {|key,value| value < 300}
puts "delete_if: #{x.inspect}"

puts "---散列表中的散列表---"
bigdict = {
   "person"=>{
      "name" => "andy",
      "age" => 28
   },
   "animal"=>{
      "name" => "dog",
      "age" => 2
   },
}

puts bigdict.inspect
puts bigdict['person']['age']


## 流程控制
puts "---流程控制 ---"
puts "---if unless---"
age = 10
puts "you are too young to use this system 1" if age < 18
#也可以这样
if age < 18
  puts "you are too young to use this system 2"
end

#unless 与if相反
unless age > 18
  puts "you are too young to use this system 3"
end

#if与unless 也提供 else
unless age < 18
  puts "you are too young to use this system 4" 
else
  puts "welcome "
end

#三元运算符 ?:
puts "---三元运算符 ?:---"
age = 10
type = age < 18 ?"child":"adult"
puts "type = #{type}"


puts "---多重比较---"
age = 15
if age < 5
  type = "little child"
elsif age >=5 && age < 18
  type ="child"
else
  type = "adult"
end

puts "type = #{type}"

#ruby中的switch 
puts "ruby中的switch"
fruit = "orange"
case fruit
  when "orange" 
    color = "yellow"
  when "apple"
    color="red"
  when "banana"
    color="yellow"
  else  #如果都没有匹配到则执行else中的东西 相当于default
     color = "unknown"
end
puts "color = #{color}"


#还可以用这种表达方式
color =  case fruit
  when "orange" 
    "yellow"
  when "apple"
    "red"
  when "banana"
    "yellow"
  else  #如果都没有匹配到则执行else中的东西 相当于default
    "unknown"
end
puts "color = #{color}"


#while until 
puts "---while until---"
i = 10
while i < 12
  print  "#{i} "
  i+=1
end
puts 

i = 10
until i > 100
  print "#{i} "
  i = i*2
end
puts()


#也可以这样
i=2
i = i * 2 until i > 1000
puts "i = #{i}" #1024



##代码块
puts "---代码块--- each 接收一个代码块，{}和do end之间的都是代码块，本质上是匿名函数"
x = [1,2,3]
x.each {|elem| print "#{elem} "} 
puts()
x.each do |elem| print "#{elem} " end

puts "---接收代码块的函数 code_block前的&表示是代码块 ,一次只能传递一个代码块---"
def each_vowel(&code_block)
  %w(a e i o u).each{|vowel| code_block.call(vowel)}
end

each_vowel {|a| print a+" "}

puts "---也可以使用lambda将代码块存放在变量之中---"
print_param = lambda {|x| print "#{x} "}
#使用lambda的call方法来执行代码块
print_param.call(100)
puts()

#范围
puts "---范围---"
r1=('A'.."Z")
puts r1.class
a1 = r1.to_a #转换为数组
puts a1.class

puts "---把范围当成数组的索引 一次取多个元素 和设置多个元素---"
a = [1,2,3,4,5,6]
puts a[2..5].inspect
a[0,2] = ["a","b"]
puts a.inspect

#符号
puts "---符号 Symbol 符号就像java里面的String 是一个不变类---"
current_situation = :good
puts ":good is #{current_situation.class}" # Symbol

#符号不包含值和变量，
puts "fine " if current_situation == :good
puts "panic " if current_situation == :bad
#现在 内存中只有一个:good 和一个:bad

#假设我们 将:good 和:bad 换成字符串 内存中就有 2个good和一个bad 占用内存
current_situation1 = "good"
puts ":good is #{current_situation1.class}" # Symbol
#符号不包含值和变量，
puts "fine " if current_situation1 == "good"
puts "panic " if current_situation1 == "bad"

person1 = {:name => "Andy",:age => 10}
puts person1.inspect
puts person1[:name]


#快速创建数组
puts "---快速创建数组---"
a = %w(a 1,s  aa)
puts a.class
puts a.inspect #["a", "1,s", "aa"]

#select 是所有数组和散列表都有的方法
puts "---select 方法---"
a = %w(a a b b c d e f f)
b = %w(a f)
#这句话的意思是 从a去除b有的字母
selected_word = a.select {|word| !b.include?(word)} 
puts selected_word.inspect #["b", "b", "c", "d", "e"]

puts "---数组和散列表排序 sort_by---"
a = %w(a aaa bbb cc dd e)
sorted_a = a.sort_by {|elem| elem.length}  
puts "sorted_a = #{sorted_a.inspect}"# ["a", "e", "cc", "dd", "aaa", "bbb"]

puts "---strip方法---"
puts "    aaa    ".strip.length #3

## 类
puts "\n###类###"
puts "---变量的作用域 局部变量 ，全局变量， 对象变量， 类变量---"
puts "--局部变量---"
if true
  x = 10
  x+=1
  puts x #11
  if true
    x=100
    x+=1
    puts x #101
  end
  puts x #101
end

puts()
def basic_method
  x = 20
  puts x
end
x = 10
puts x  #10
basic_method #20
puts x #10


puts "---全局变量 $---"
 $x = 10
 
 def method
   $x+=1 
   puts $x 
 end
 puts $x #10
 method() #11
 puts $x #11
 
 
puts "---实例变量 类变量，类方法 实例方法--"

class Square
  def initialize(side_length)
    @side_length = side_length  # @side_length是实例变量
    if defined?(@@number_of_squares)
      @@number_of_squares += 1 #类变量使用@@ 这里用来保存 当前的实例个数
    else
      @@number_of_squares=1
    end
  end
  
  def area
    @side_length * @side_length # 不用返回，默认返回最后一个表达式的值
  end
  
  #实例方法 给对象调用的，可以与类方法重名 ,也可以访问并修改类变量
  def count
    @@number_of_squares+=1
    @@number_of_squares 
  end
  #类方法 前面加上 self，self表示当前类与java的this有些不同 也可以使用 
  # 也可以使用Square.count
  def self.count
    @@number_of_squares
  end
end

square_a = Square.new(10)
square_b = Square.new(3)
puts "square of a = #{square_a.area}"
puts "square of b = #{square_b.area}"
puts "count of square = #{Square.count}"
puts "count of square by instance = #{square_b.count}"


puts "\n ---继承--- ruby只能单继承"
class ParentClass
  attr_accessor :name
  def initialize
    @name = "qianqian"
  end
  
  def method1
    puts "method1 in parentclass"
  end
  
  def method2
    puts "method2 in parentclass"
  end
end

#继承需要使用< 来表示
class ChildClass  < ParentClass
  attr_accessor :age
  def initialize()
    super#调用父类的狗仔方法
    @age = 10  
  end
  
  def method2
    super  #调用上一级的相同的方法
    puts "method2 in childclass"
  end 
end

my_obj = ChildClass.new()
my_obj.method1 #method1 in parentclass
my_obj.method2 #method2 in childclass
puts "name = #{my_obj.name}"
puts "age = #{my_obj.age}"

puts "---覆写现有类的方法---"
class String 
  def length  #复写String类的length方法
    10
  end
end

puts "aaaaaaaaaaaaaaaaaaaa".length #10


puts "---反射---"
str = "a"
puts "所有方法：#{str.methods.inspect}"

my_obj = ChildClass.new()
puts "所有的实例变量 ：#{my_obj.instance_variables.inspect}" #所有的实例变量 ：["@age", "@name"]


puts "---private public protected---"

class Person
  def initialize(age)
    @age = age
  end
  
  def is_child
    self.age < 18  
  end
  
  def age
    @age
  end
  
  #protected 的方法
  def age_difference_with(other_person)
    (self.age - other_person.age).abs
  end
  
  #private 表示只能在实例范围内访问
  private :is_child
  # 表明age可以在类的范围类访问 
  protected  :age
end

person1 = Person.new(10)
person2 = Person.new(20)
#验证protected方法
puts "age difference = #{person1.age_difference_with(person2)}"
#puts person1.age #报错  protected method `age' called for #<Person:0x44002f0 @age=10> (NoMethodError)


puts "---嵌套类---"
Pi = 10
class Drawing
  #Pi是常量 作用于只在类的范围类
  Pi = 3.1415
  class Line
    
  end
  
  class Circle
    def what_am_i
      "this is a circle"
    end
  end
  
  #访问累内部类
  def self.give_me_a_circle
    Circle.new
  end
end

a = Drawing.give_me_a_circle
puts a.what_am_i
a = Drawing::Circle.new #可以这样访问内部类
puts a.what_am_i
puts "常量的作用于只在类的范围内"
puts Drawing::Pi
puts Pi



puts "---模块 module---"
#分别属于两个命名空间的方法
module NumberStuff
  def NumberStuff.random
    rand(1000)
  end
  
  class Ruler
    attr_accessor :length
    def initialize()
      @length =1
    end
  end
end

module LetterStuff
  def LetterStuff.random
    (rand(26)+65).chr
  end
  
  class Ruler
    attr_accessor :name
    def initialize()
      @name
    end
  end
end
  
puts NumberStuff.random
puts LetterStuff.random

r1 = NumberStuff::Ruler.new
r2 = LetterStuff::Ruler.new
#不会冲突
r1.length=10
r2.name="ruler"


puts "--include模块中的方法，include是将模块的内容放到当前作用域中--"
module UserfulFeathres
  def class_name
    self.class.to_s
  end
end

class Person1 
  include UserfulFeathres #把模块中的方法include到了Person1中
end
x = Person1.new()
puts x.class_name # Person1
puts x.methods.include?("class_name") #true

#即使不include到类中，也可以使用
include UserfulFeathres
puts class_name  #Object

# Enumerable模块
puts "---Enumerable模块 包含了 collect select min max 等20几种方法，可以在自己的类中引入Enumerable，但需要实现each方法---"
class AllVowels
  include Enumerable #我们的AllVowels类将拥有collect select 等方法了
  @@vowels = %w(a e i o u)
  def each
    @@vowels.each{|v| yield v}  #yield表示像代码块传递每隔元音字母
  end
end

vowels = AllVowels.new 
puts vowels.collect {|i| i+"x"}.inspect
puts vowels.select {|i| i > "e"}.inspect
puts vowels.sort().inspect
puts vowels.max.inspect


##Comparable模块 提供基本的比较运算如< > <= >= <=>和between?方法
puts "---Comparable---"
class Song
  include Comparable
  attr_accessor :length ,:song_name
  def initialize(song_name, length)
    @song_name = song_name
    @length = length
  end
  # 提供了这个方法后 ，Comparable会回根据这个方法提供 < > <= >=等运算了  
  def <=>(other)
    @length <=>other.length
  end
end


s1 = Song.new("s1",10)
s2 = Song.new("z2",15)
s3 = Song.new("s3",20)

puts s1 < s2
puts s2 <=> s3
puts s2.between?(s1,s3)

puts "---include的时候也会把类include进来---"
include LetterStuff

r = Ruler.new
r.name= "Ruler1"
puts r.instance_variables.inspect

##项目和沉程序库
puts "##项目和程序库"
#下面自能打印一个 hello from ruby11.rb 尽管require两次
require "ruby11"
require "ruby11"
puts "require end"
#load 每一次载入都重新处理
load "ruby11.rb"
load "ruby11.rb"

puts %q{---从其他目录包含，load 和 require都可以节后绝对路径和本地路径 
例如 require a 首先在本地路径中搜索a.rb,然后会在其他地方搜索 ruby搜索的路径
包含在$:中
  }
$:.each {|x| puts x}
puts "可以添加我们自定义的路径"
$: <<"c:/"
$:.each {|x| puts x}

puts "---有条件的包含代码---"
$debugmode = false
require "ruby11.rb" if $debugmode == true

#一口气可以require N个文件
#%w(c:/ d:/).each {|l| require l} 


#Struct用来创建专门存储数据的特殊类
Person2 = Struct.new(:name,:age)
andy = Person2.new("andy",28)
puts andy.name 
puts andy.age

  

## 异常
puts "###异常 使用raise 抛出异常"

