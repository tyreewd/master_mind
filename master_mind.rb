class MasterMind
    attr_accessor :colors, :computer_code

    def initialize
        @colors = ["red", "blue", "green", "yellow", "purple", "orange"]
        @computer_code = []
        @red_peg = 0
        @white_peg = 0
        @guess = ""
    end
    

    def generate_code
        4.times do
            @computer_code << @colors.sample
        end
    end

    def user_guess   
         puts "Select four guesses from " +
            "any comination of red, blue, green, yellow, purple, orange.
            "
        @guess = gets.chomp.split  
    end

    def play_game
        generate_code
        @turns = 12
        while @red_peg < 4 && @turns > 0
            user_guess
            i = 0
            @red_peg = 0
            @white_peg = 0
            4.times do
                
                if @guess[i] == @computer_code[i]
                    @red_peg += 1
                elsif @computer_code.any?(@guess[i])
                    @white_peg += 1
                end
                i += 1
            end
            @turns -= 1
            puts "There are #{@red_peg} in the right spot and right color" +
             " and #{@white_peg} in the wrong spot but right color." +
              " with #{@turns} turns left
             "
        end
        puts "Congratulations! The code was #{@computer_code}."
    end

end

my_game = MasterMind.new()
my_game.play_game
