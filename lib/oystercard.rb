class Oystercard

	attr_reader :balance
	CARD_LIMIT = 90

	def initialize
		@balance = 0
	end

	def top_up(amount)
		raise ("Card balance limit of #{CARD_LIMIT} exceeded") if max_balance(amount)
		@balance += amount
	end

	def deduct(amount)
		@balance -= amount
	end

	private

	def max_balance(amount)
		@balance + amount > CARD_LIMIT
	end

end