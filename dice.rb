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
  "<h1>Dice Roll</h1>
  <ul>
  <li><a href = https://special-giggle-p697477664jh9r56-4567.app.github.dev/dice/2/6>Roll two 6-sided dice</a></li>
  <li><a href = https://special-giggle-p697477664jh9r56-4567.app.github.dev/dice/2/10>Roll two 10-sided dice</a></li>
  <li><a href = https://special-giggle-p697477664jh9r56-4567.app.github.dev/dice/1/20>Roll one 20-sided dice</a></li>

  </ul>"
end



# two 6-sideded 
get ("/dice/2/6") do
  first_die = rand(1..6)
  second_die = rand(1..6)
  sum = first_die + second_die

  outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
	
  "<h1>2d6</h1>
   <p>#{outcome}</p>"
end



# two 10-sided
get ("/dice/2/10") do 
  first_die = rand(1..10)
  second_die = rand(1..10)
  sum = first_die + second_die

  outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."

  "<h1>2d10</h1>
  <p>#{outcome}</p>"
end


# one 20-sided
get ("/dice/1/20") do
  first_die = rand(1..20)
  sum = first_die

  outcome = "You rolled a die of #{first_die}, and the sum is #{sum}."

  "<h1>1d20</h1>
  <p>#{outcome}</p>"
end
