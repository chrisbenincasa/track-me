# require helpers
Dir['./helpers/*'].each {|file| require file}

# require models
Dir['./models/*'].each {|file| require file}

# require controllers
Dir['./controllers/*'].each {|file| require file}