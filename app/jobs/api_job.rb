require 'rest-client'

class APIJob
  include SuckerPunch::Job

  def perform(item_id)
  	item = Item.find(item_id)
	Wolfram.appid = ENV['WOLFRAM_KEY']

		sub_item = Item.new(group: item.group, title: "BOT")
		
		if item.body.include?("current time") || item.body.include?("time is it")
			sub_item.body = Time.now.strftime("It is %r")
			sub_item.save()
			return
		end

		if item.body.include?("joke")
			response = RestClient.get "http://api.icndb.com/jokes/random"
			payload =  JSON.parse response.body unless !response
			if payload && payload['type'] == "success"
				sub_item.body = payload['value']['joke']
				sub_item.save
			end
			return
		end

		if item.body.partition(" ").first.include?("wolfram")
			sub_item.body = "Here you go:"
			sub_item.image_url = "https://api.wolframalpha.com/v1/simple?i=#{item.body.split(' ')[1..-1].join(' ')}&appid=#{ENV['WOLFRAM_KEY']}"
			sub_item.save
		end
	end
end