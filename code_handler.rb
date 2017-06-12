class CodeHandler
  attr_accessor :secret_code
	@@allowed_chars = ['a','b','c','d','e','f']

  def initialize
    new_code
  end

	def new_code
		@secret_code = random_code
	end

	def valid_code(code)
		code.length == 4 && code.downcase.split('').all? do |char|
			@@allowed_chars.include?(char)
		end
	end

  def correct_code(code)
    code.downcase.eql?(@secret_code)
  end

	def random_code
		code = @@allowed_chars.sample(4).join('')
	end

	def rate(guess)
		rating = []
		guess.downcase.split('').each_with_index do |letter, index|
			if letter == @secret_code[index]
				rating << 'R'
			elsif @secret_code.include?(letter)
				rating << 'W'
			end
		end
		rating.sort.join('')
	end
end
