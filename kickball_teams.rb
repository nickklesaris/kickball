require 'csv'
require 'sinatra'
require 'shotgun'
#set :public_folder, File.dirname(__FILE__) + '/public'

#get '/' do
#end

get '/team/:chosen_team' do
	#define global data stuff
	@team_members = []

	@teams = {}
	CSV.foreach('lackp_starting_rosters.csv', headers: true) do |row|
		full_name = row['first_name'] + ' ' + row['last_name']
		@teams[full_name] = row.to_hash
	end

	#puts 'Choose your team.'
	#@chosen_team = gets.chomp
	@chosen_team = params[:chosen_team]
	#@chosen_team = 'Flinestone Fire'

	@teams.each do |member|
		if member[1]['team'] == @chosen_team
			@team_members << member[1]['first_name']+' '+member[1]['last_name']+': '+member[1]['position']
		end
	end
erb:index
end
# ---recently commented out---
#puts "Simpson Slammers"
#puts "#{simpsons[1]['team']}"
#simpsons.each do |player|
#puts "#{player[0]} plays #{player[1]['position']}"
#end
#-------------------------
# teams.each do |member|
# puts "#{member[0]} plays #{member[1]['position']}"
# end
