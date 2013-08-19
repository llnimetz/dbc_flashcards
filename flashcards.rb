
class Term
	attr_reader :definition

	def initialize(term_title, definition)
	  @term_title = term_title
	  @definition = definition
	end

	def prompt_for_guess 
	end
		
	end
	def correct?(guess)
	  guess == @term_title
	end

end


class Flashcards

	def initialize(terms = [], source_file = "flashcards_samples.txt")
	  @source_file = source_file
	  @terms = terms
	  self.load 
	end

	def load
	  term_titles = []
      term_definitions = []
	  
	  File.readlines(@source_file).each do |term_line|
        
		term_arr = term_line.split(" ")   
        if term_arr.count == 1  
        	term_titles << term_line
        elsif term_arry.count > 1
        	term_definitions << term_line
        end
      end	
      terms = term_definitions.zip(term_titles)
      terms.each do |array| 
      	@terms << Task.new(array[0], array[1])
      end
	end

	def save
	  File.open(@source_file, 'w') do |file|
        @flashcards.each do |term|
          file << term.to_s
        end
      end	
	end

	def find_term(term_id)
	  @terms[term_id]
	end

	def print_definition(term_id)
	  term = find_term(term_id)
	  puts term.definition
	end

	def check_if_correct(guess, term_id)
	  term = find_term(term_id)
	  term.correct?(guess)
	end

end


class Controller

	def initialize(flashcards = Flashcards.new, term_id = 0, guess = "")
	  @flashcards = flashcards
	  @term_id = term_id
	  @guess = guess
	end

	def run
	  start_player
	  execute
	  persist_flashcards
	end

	private

	def execute
	  give_definition
	  term = @flashcards.find_term(@term_id) 
	  until term.check_if_correct(@guess, @term_id) == true
	  	puts "Incorrect! Try Again."
	  end

	  	puts "Correct!" 
	  	@term_id += 1
	  	execute
	  else
	  	
	  	execute
	  end
	  @term_id += 1
	end

	def persist_flashcards
	  @flashcards.save
	end

	def prompt_for_guess
	  @guess = gets.chomp
	end

	def start_player
	  puts "Welcome to Ruby Flash Cards. To play, just enter the correct term for each definition.  Ready?  Go! (press enter to guess)"
	end

	def give_definition
	  puts "Definition"
	  @flashcards.print_definition(@term_id)
	  print "Guess: "
	  prompt_for_guess
	end


	


end


welcome player and prompt to hit return to start
print definition /s the definition of the term
prompt for a guess
check whether guess == answer
IF != THEN puts Incorrect! Try Again and prompt for another guess
REPEAT this UNTIL guess == answer
When guess == answer, return "Correct!"
Then give new definition and repeat process
Until the user enters "exit"




game = Controller.new
game.run
