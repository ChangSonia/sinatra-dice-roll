# /dice.rb


require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')



# home page
get ("/dice/home") do 
  erb(:elephant)
end

  # The argument to the erb method must be a Symbol containing the name of a file within the views/ folder
  # We don’t have to include the .erb part of the filename because it’s assumed that all view template names will end in .erb.


# a hundred rolls of 6 sided

get("/dice/100/6") do
  @rolls = []
  100.times do
    die = rand(1..6)
    @rolls<<(die)
  end

  erb(:one_hundred_six,{:layout => :wrapper})
end


# two 6-sideded 
get ("/dice/2/6") do
  first_die = rand(1..6)
  second_die = rand(1..6)
  sum = first_die + second_die

  @outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
	
  erb(:two_six, { :layout => :wrapper})
end

# anything with <%= xyz %> will allow erb to run ruby command
# we need t add an @ in front of the outcome to make variable an instance veriable not a local variable


# two 10-sided
get ("/dice/2/10") do 
  first_die = rand(1..10)
  second_die = rand(1..10)
  sum = first_die + second_die

  @outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."

  erb(:two_ten, {:layout => :wrapper})
end


# one 20-sided
get ("/dice/1/20") do
  @die = rand(1..20)

  @outcome = "You rolled a die of #{@die}."

  erb(:one_twenty, {:layout => :wrapper})
end
