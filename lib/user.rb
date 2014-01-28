class User

	def initialize
		@rank = -8
		@progress = 0
		
    # there's no reason to manually precalculate all of this. It really should be automatically calculated
		
		# Disagree; what's the point of having a computer calculate something where the 
		# answer is known?

		@ranks = {  
               -8 => 1, -7 => 2, -6 => 3, -5 => 4, -4 => 5, -3 => 6, -2 => 7, -1 => 8,
                1 => 9,  2 => 10, 3 => 11, 4 => 12, 5 => 13, 6 => 14, 7 => 15, 8 => 16
  						}

    # The bigger problem here is that it's completely non-obvious what all these numbers mean

    # It would be equally or more non-obvious if they were set out in a calulation.  We have
    # been encouraged not to use comments, so I'm at a loss as to how to make it more obvious.
    # What I have done is to set out the answers - any alternative would require the maintainer
    # to read and understand code.  To me, reading code is harder.

		@level_difference_uplift =
							{
  	             -1 =>    1,  0 =>    3,     
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

		raise "3 kinds of hell" if !@ranks.include?(kata)
    # if rank > 8 then this line will never be reached because it'll throw an exception on the previous line
    
    # correct, careless refactoring on my part on changing to use include?

		return if rank >= 8 

    # if rank == 8 then the progress must be set to 0, which you don't do

    # rank == 8 is only known at the end of the calculation, where progress is set.

		rank_difference = @ranks[kata] - @ranks[@rank]
		return if rank_difference <= -2

    # I'm sure there's logic behind this but the code could be more readable.

    # I am genuinely interested in suggestions as to how.  It's a simple sum adding up 
    # a) the points the user already has b) progress c) rank uplift.

		new_points_total = @rank_points[@rank] + @progress + @level_difference_uplift[rank_difference]

		if new_points_total >= 1500 # magic number (http://stackoverflow.com/questions/47882/what-is-a-magic-number-and-why-is-it-bad)
			@rank = 8
			@progress = 0
		else
			@rank = @to_ranks[new_points_total/100]	
			@progress = new_points_total%100
		end
	end
end