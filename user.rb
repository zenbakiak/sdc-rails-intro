# class User
#   def self.find(id)
#     puts id
#   end

#   def name
#     puts "fdghmn"
#   end
# end

# User.find(2)

# @user = User.new
# @user.name


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