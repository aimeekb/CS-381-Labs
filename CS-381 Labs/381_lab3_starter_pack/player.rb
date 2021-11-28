require_relative "element"
require_relative "history"

#Superclass Player
class Player
    attr_reader :name, :history
    
    def initialize(name, history)
        @name = name
        @history = history
    end

    def play()
        fail "This method should be overridden"
    end

end

#Subclass StupidBot
class StupidBot < Player
    def play()
        rock = $moves[0]
        history.log_play(rock)
        return rock
    end
end

#Subclass RandomBot
class RandomBot < Player
    def play()
        answer = $moves[rand(5)]
        history.log_play(answer)
        return answer
    end
end

#Subclass IterativeBot
class IterativeBot < Player
    def play()
        num = history.plays.length()
        new_num = num % 5
        answer = $moves[new_num]
        history.log_play(answer)
        return answer

    end
end

#Subclass LastPlayBot
class LastPlayBot < Player
    def play()
        num = history.opponent_plays.length()
        if (num == 0)
            answer = $moves[0]
            history.log_play(answer)
            return answer
        else
            history.log_play(history.opponent_plays.last)
            return history.opponent_plays.last
        end
    end
end

#Subclass HumanBot
class Human < Player
    def play()
        name = " "
        #While there is not a correct choice, keep asking the user
        while name.ord < 49 || name.ord > 54 || name.length > 1
            puts "(1) Rock"
            puts "(2) Paper"
            puts "(3) Scissors"
            puts "(4) Lizard"
            puts "(5) Spock"
            print "Enter your move: "
            name = gets.chomp
            if (name.ord < 49 || name.ord > 54 || name.length > 1)
                puts "Invalid move - try again"
            else
                value = name.to_i - 1
                move = $moves[value]
                history.log_play(move)
                return move
            end
        end
    end
end