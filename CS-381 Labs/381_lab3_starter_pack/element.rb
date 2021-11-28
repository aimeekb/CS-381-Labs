#To Do:

# The second return value will return one of the following round outcomes:
# Win
# Lose
# Tie

class Element 
    attr_accessor :name

    def compare_to (element)
        fail "This method should be overridden"
    end

    def initialize(name)
        @name = name
    end

end 

#Options: Rock, Paper, Scissors, Lizard, Spocks
# Class < Superclass (This is inheritance in Ruby)

#Class Rock : Loses to Paper and Spock
class Rock < Element 
    def compare_to (element)
        if (element.name == "Paper")
            return element.name + " covers " + self.name, 'Lose'
        elsif (element.name == "Spock")
            return element.name + " vaporizes " + self.name, 'Lose'
        elsif (element.name == "Lizard")
            return self.name + " crushes " +  element.name, 'Win'
        elsif (element.name == "Scissors")
            return self.name + " crushes " +  element.name, 'Win'
        elsif (element.name == self.name)
            return self.name + " equals " + self.name, 'Tie'
        end
    end
end

#Class Paper : Loses to Scissors and Lizard
class Paper < Element
    def compare_to (element)
        if (element.name == "Scissors")
            return element.name + " cut " + self.name, 'Lose'
        elsif (element.name == "Lizard")
            return element.name + " eats " + self.name, 'Lose'
        elsif (element.name == "Rock")
            return self.name + " covers " + element.name, 'Win'
        elsif (element.name == "Spock")
            return self.name + " disproves " + element.name, 'Win'
        elsif (element.name == self.name) 
            return self.name + " equals " + self.name, 'Tie'
        end
    end
end 

#Class Scissors : Loses to Rock and Spock
class Scissors < Element 
    def compare_to (element)
        if (element.name == "Rock")
            return element.name + " crushes " + self.name, 'Lose'
        elsif (element.name == "Spock")
            return element.name + " smashes " + self.name, 'Lose'
        elsif (element.name == "Lizard")
            return self.name + " decapitate " + element.name, 'Win'
        elsif (element.name == "Paper")
            return self.name + " cut " + element.name, 'Win'
        elsif (element.name == self.name) 
            return self.name + " equals " + self.name, 'Tie'
        end
    end
end

#Class Lizard : Loses to Scissors and Rock
class Lizard < Element
    def compare_to (element)
        if (element.name == "Scissors")
            return element.name + " decapitate " + self.name, 'Lose'
        elsif (element.name == "Rock")
            return element.name + " crushes " + self.name, 'Lose'
        elsif (element.name == "Spock")
            return self.name + " poisons " + element.name, 'Win'
        elsif (element.name == "Paper")
            return self.name + " eats " + element.name, 'Win'
        elsif (element.name == self.name) 
            return self.name + " equals " + self.name, 'Tie'
        end
    end
end

#Class Spock : Loses to Lizard and Paper
class Spock < Element
    def compare_to (element)
        if (element.name == "Lizard")
            return element.name + " poisons " + self.name, 'Lose'
        elsif (element.name == "Paper")
            return element.name + " disproves " + self.name, 'Lose'
        elsif (element.name == "Scissors")
            return self.name + " smashes " + element.name, 'Win'
        elsif (element.name == "Rock")
            return self.name + " vaporizes " + element.name, 'Win'
        elsif (element.name == self.name) 
            return self.name + " equals " + self.name, 'Tie'
        end
    end
end

#Create an instance of each class and push it into the $moves array.

rock = Rock.new("Rock")
paper = Paper.new("Paper")
scissors = Scissors.new("Scissors")
lizard = Lizard.new("Lizard")
spock = Spock.new("Spock")


$moves = Array.new
$moves.push(rock)
$moves.push(paper)
$moves.push(scissors)
$moves.push(lizard)
$moves.push(spock)