require './helpers/app'

# require models
Dir['./models/*'].each {|file| 
  puts file
  require file
}

# require controllers
Dir['./controllers/*'].each {|file| require file}