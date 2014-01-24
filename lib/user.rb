class User

	def initialize
		@rank = -8
		@progress = 0
		
		@ranks = {  
               -8 => 1, -7 => 2, -6 => 3, -5 => 4, -4 => 5, -3 => 6, -2 => 7, -1 => 8,
                1 => 9,  2 => 10, 3 => 11, 4 => 12, 5 => 13, 6 => 14, 7 => 15, 8 => 16
  						}
		@level_difference_uplift =
							{
  	             -1 =>    0,  0 =>    3,     
  	              1 =>   10,  2 =>   40,    3 => 90,  4 =>  160,  5 => 250,
  	              6 =>  360,  7 =>  490,   8 => 640,  9 =>  810, 10 => 1000,
  	             11 => 1210, 12 => 1440, 13 => 1690, 14 => 1960, 15 => 2250
  	          }
  	@to_ranks = { 
                0  => -8,  1 => -7, 2  => -6, 3  => -5, 4  => -4, 5  => -3, 6  => -2, 7  => -1,
                8  =>  1,  9 =>  2, 10 =>  3, 11 =>  4, 12 =>  5, 13 =>  6, 14 =>  7, 15 =>  8
  						}
  	@rank_points =
  						{
  							-8 => 0, -7 => 100, -6 => 200, -5 => 300, -4 => 400, -3 => 500, -2 => 600, -1 => 700,
                1 => 800,  2 => 900, 3 => 1000, 4 => 1100, 5 => 1200, 6 => 1300, 7 => 1400, 8 => 1500
  						}

	end

	def rank
		@rank
	end
	def progress
		@progress
	end

	def inc_progress kata

		#return kata < -8 || kata = 0 || kata > 8
		raise "3 kinds of hell" if kata < -8 || kata == 0 || kata > 8

		return if rank >= 8
#puts "------------"
#puts "1    #{@ranks[@rank]}"
#puts "2    #{@ranks[kata]}"
		rank_difference = @ranks[kata] - @ranks[@rank]
#puts "rank difference   #{rank_difference}"
		return if rank_difference <= -2
		new_points_total = @rank_points[@rank] + @progress + @level_difference_uplift[rank_difference]
#puts " currrent progress total #{@progress}"
#puts " currrent rank #{@rank}"
#puts " uplift #{@level_difference_uplift[rank_difference]}"
#puts " new points total #{new_points_total}" 
#puts " divided by 100 #{new_points_total/100}"
#puts " remainder formed #{new_points_total%100}"
		if new_points_total >= 1500
			@rank = 8
			@progress = 0
		else
			@rank = @to_ranks[new_points_total/100]	
			@progress = new_points_total%100
		end
#puts "final rank  #{@rank} progress  #{@progress}"
	end
end