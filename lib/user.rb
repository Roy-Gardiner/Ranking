class User

	def initialize
		@rank = -8
		@progress = 0
		@ranks = {  
               -8 => 1,
               -7 => 2,
               -6 => 3,
               -5 => 4,
               -4 => 5,
               -3 => 6,
               -2 => 7,
               -1 => 8,
                1 => 9,
                2 => 10,
                3 => 11,
                4 => 12,
                5 => 13,
                6 => 14,
                7 => 15,
                8 => 16
  						}
  	@to_ranks = { 
               1  => -8,
               2  => -7,
               3  => -6,
               4  => -5,
               5  => -4,
               6  => -3,
               7  => -2,
               8  => -1,
               9  =>  1,
               10 =>  2,
               11 =>  3,
               12 =>  4,
               13 =>  5,
               14 =>  6,
               15 =>  7,
               16 =>  8
  						}
	end

	def rank
		@rank
	end
	def progress
		@progress
	end

	def inc_progress level
		diff = @ranks[level] - @ranks[rank]
 
		case 
		  when diff <= -2
		  when diff == -1
		  	@progress += 1
		  when diff ==  0
		  	@progress += 3
		  else
		  	@progress += 10*diff*diff
		end
	
		if @progress >= 100 && @rank != 8  
			
			rank_jump = progress / 100
			
			old_rank_indicator = @ranks[@rank]
			new_rank_indicator = old_rank_indicator+rank_jump

			if new_rank_indicator > 16   
				new_rank_indicator = 16
			end
	
			@rank = @to_ranks[new_rank_indicator] 
			if @rank == 8
				@progress = 0
			else 
				@progress -= (new_rank_indicator - old_rank_indicator)*100
			end	
		end
	end
end