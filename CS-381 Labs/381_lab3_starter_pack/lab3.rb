require_relative "element"   # uncomment to load element.rb
require_relative "player"    # uncomment to load player.rb 
require_relative "history"   # uncomment to load history.rb

######################################### 	
#     CS 381 - Programming Lab #3		#
#										#
#  <Matthew Mazon>					 	#
#  <mazonm@oregonstate.edu>	            #
#										#
#########################################

def game(rounds)
	puts "Welcome to Rock, Paper, Scissors, Lizard, Spock!"
	puts ""
	puts "Please choose two players:"
	player1val = " "
	player2val = " "
	#While there is not a correct input, keep asking the user
	while player1val.ord < 49 || player1val.ord > 53 || player2val.ord < 49 || player2val.ord > 53
		puts "(1) StupidBot"
		puts "(2) RandomBot"
		puts "(3) IterativeBot"
		puts "(4) LastPlayBot"
		puts "(5) Human"
		print "Select player 1:"
		player1val = gets.chomp
		print "Select player 2:"
		player2val = gets.chomp
		#if there is a problem then keep prompting the user until there isn't one
		if (player1val.ord < 49 || player1val.ord > 53 || player2val.ord < 49 || player2val.ord > 53 || player1val.length > 1  || player2val.length > 1  )
			while player1val.ord < 49 || player1val.ord > 53 || player2val.ord < 49 || player2val.ord > 53 || player1val.length > 1  || player2val.length > 1
				puts "Invalid choice(s) - start over"
				puts ""
				print "Select player 1:"
				player1val = gets.chomp
				print "Select player 2:"
				player2val = gets.chomp
			end 
		end
	end
	#Get the correct class for the value selected
	player1 = assign_correct_value(player1val) 
	player2 = assign_correct_value(player2val)
	puts player1.name + " vs. " + player2.name
	round_number = 1
	puts ""
	#Start the rounds
	while round_number < rounds + 1
		puts "Round " + round_number.to_s + ":"
		#Get the class move
		p1move = player1.play()
		p2move = player2.play()
		#Put the opponents move into the history.opponent_plays array
		player1.history.opponent_plays.push(p2move)
		player2.history.opponent_plays.push(p1move)
		puts "Player 1 chose " + p1move.name
		puts "Player 2 chose " + p2move.name
		val = p1move.compare_to(p2move)
		puts val[0]
		if (val[1] == "Win")
			puts "Player 1 won the round"
			puts ""
			player1.history.score += 1
		elsif (val[1] == "Lose")
			puts "Player 2 won the round"
			puts ""
			player2.history.score += 1
		else 
			puts "Round was a tie"
			puts ""
		end
		round_number +=1
	end
	puts "Final score is " + player1.history.score.to_s + " to " + player2.history.score.to_s
	if (player1.history.score > player2.history.score )
		puts "Player 1 wins"
	elsif (player1.history.score < player2.history.score)
		puts "Player 2 wins"
	else
		puts "Game was a draw"
	end

end

def assign_correct_value(val)
	if (val == "1")
		return StupidBot.new("StupidBot", History.new)
	elsif (val == "2")
		return RandomBot.new("RandomBot", History.new)
	elsif (val == "3")
		return IterativeBot.new("IterativeBot", History.new)
	elsif (val == "4")
		return LastPlayBot.new("LastPlayBot", History.new)
	elsif (val == "5")
		return Human.new("Human", History.new)
	end
end
#print $moves

# Main Program (should be last)
n_rounds = 5
# call to kick off the game
game(n_rounds)