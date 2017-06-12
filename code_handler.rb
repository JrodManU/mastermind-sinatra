class CodeHandler
	class Code
		attr_reader :value
		def initialize(value)
			@value = value
		end
	end

	@@allowed_chars = ["a","b","c","d","e","f"]

	def initialize
		@secret_code = random_code
	end

	def create_code(code)
		Code.new(code) if code.length == 4 && good_code(code)
	end

	def good_code(code)
		code.downcase!
		return true if code.split("").all? do |char|
			@@allowed_chars.include?(char)
		end
		false
	end

	def random_code
		code = @@allowed_chars.sample(4).join("")
	end

	def rate(guess)
		guess.downcase!
		rating = []
		guess.split("").each_with_index do |letter, index|
			if letter == @secret_code[index]
				rating << "R"
			elsif @secret_code.include?(letter)
				rating << "W"
			end
		end
		rating.sort.join("")
	end
end
