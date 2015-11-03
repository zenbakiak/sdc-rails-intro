#### Ruby basic instructions

Output information

```
puts "Ruby"         #return nil
p 'ruby'            #return the value
```

Variables
```
@user = "John"      # instance variable
foo = 'bar'         # Local variable
FOO = 'bar'         # Constant
```

Arithmetic Operators

| Operator | Description Example |
| -------- | ----------------- |
| +        | Addition 2+2=4 |
| -        | Subtraction 4-2=2 |
| *        | Multiplication 5*2=10 |
| /        | Division 10/2=5 |
| %        | Modulus 10%2=0 10%3=1 |
| **       | Exponent 2**10=1024 |

[A complete guide of ruby operators](http://www.tutorialspoint.com/ruby/ruby_operators.htm)

Conditional statements
```
if condition
  #... Do something if condition is true
else
  #... Do if condition is false
end

unless condition
  #... Do something if conditional is false
else
  #... Do something if condition is true
end

# if modifier
p "happy" if foo == 'bar'
# unless modifier
p "happy" unless foo == 'bar'
```


Methods
```
def method_name
  puts 'do something'
end
method_name

# With arguments
def greetings(user_name)
  puts 'Hello '+user_name
end
greetings('dude')

```

Arrays

Arrays are ordered, integer-indexed collections of any object.

[Ruby Array Class](http://ruby-doc.org/core-2.2.0/Array.html)

```

users = Array.new
users2 = []
users = ['Ramón', 'Alex', 'Daniel', 'Cori', 'Evan']
users.sort #=> ["Alex", "Cori", "Daniel", "Ramón"]
users #=> ['Ramón', 'Alex', 'Daniel', 'Cori'] (users var is the same)
users.sort! # ! the bang indicates mutation

users.reverse
puts "que agarro y que le digo a #{users.join(', ')} si vanir a la clase de ruby"
users.first
users.last
users.length
users.count
users.compact
users.include?('Ramón')
users.delete_if { |user| user == 'Evan' }

guests = ['Charlie', 'Pepe', 'Daniel', 'Cori']
users = users + guests
users += guests
users.uniq # remove duplicates

```

Hashes

a ruby hash is a dictionary like collection of unique keys and values

```
the_hash = Hash.new
the_hash = {}
user = { name: 'Ramón', last_name: 'Elotis', email: 'elotis@yesquitis.com' }
user[:name] #=> Ramón

```

Array of hashes
```
users_array = [
  {name: 'pepe', last_name: 'pecas'},
  {name: 'Ramón', last_name: 'Elotis'},
  {name: 'Evan', last_name: 'Juárez'},
]
```

Exceptions

When an error happens, you can catch it

```
perfecto! && correcto! && entiendo!

NoMethodError: undefined method `perfecto!' for main:Object

begin
  perfecto! && correcto! && entiendo!
rescue Exception => e
  2.times { puts "No hay error" }
end
```
![Perfecto](http://jcma.s3.amazonaws.com/PERFECTO.jpg)


```
if Camera.recording?
  @camera_man.notify_anchor
else
  3.times { @camera_man.say_crap }
end

if @camera_man.recording?
  puts "Pos avísame!"
end
```
![Pos avísenme!](http://jcma.s3.amazonaws.com/marco-martinez-soriano.jpg)


##### Ruby OOP

Classes
```
class User
 # some code describing the class behavior

  # class method
  def self.find(id)
    #...
  end

  #instance method
  def name
    #...
  end
end

User.find(2)
Objects
user = User.new
user.name
```

mc.rb
```
class Mc
  attr_accessor :name, :lyrics

  def initialize(name)
    self.name = name
    if name == "mcdinero"
      self.lyrics = ["El", "mundo", "se", "consume", "en", "dinero"]
    end
  end

  def method_missing(method_name, *arguments, &block)
    10.times do
      puts self.lyrics.last
    end
  end

  def freestyle
    self.lyrics.each do |word|
      puts word
    end
    self.next_phrase #This method does not exist
  end
end

@rapper = Mc.new('mcdinero')
@rapper.freestyle
```