require 'rest-client'

class Item < ApplicationRecord
	belongs_to :group

	# interpret
	# =========
	# 	Analyze input for patterns
	def interpret
		Wolfram.appid = ENV['WOLFRAM_KEY']

		sub_item = Item.new(group: self.group, title: "BOT")
		
		if self.body.include?("current time") || self.body.include?("time is it")
			sub_item.body = Time.now.strftime("It is %r")
			sub_item.save()
			return
		end

		if self.body.include?("joke")
			response = RestClient.get "http://api.icndb.com/jokes/random"
			payload =  JSON.parse response.body unless !response
			if payload && payload['type'] == "success"
				sub_item.body = payload['value']['joke']
				sub_item.save
			end
			return
		end

		if self.body.partition(" ").first.include?("wolfram")
			query = 'boston population'
			result = Wolfram.fetch(query)
			# to see the result as a hash of pods and assumptions:
			hash = Wolfram::HashPresenter.new(result).to_hash
			puts hash
		end
	end
end
