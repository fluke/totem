module EngagementsHelper
	def datepassed?(engagement)
		if engagement.engage_date > Date.current
			return "coming"
		elsif engagement.engage_date == Date.current
			return "today"
		else return "past"
		end
	end
end
