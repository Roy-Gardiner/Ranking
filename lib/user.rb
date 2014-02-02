class User

	RANKS= 
	  [ 
      LOWEST_RANK     = -8,
	    FIRST_RANK      = -7,
	    SECOND_RANK     = -6,
	    THIRD_RANK      = -5,
	    FOURTH_RANK     = -4,
	    FIFTH_RANK      = -3,
	    SIXTH_RANK      = -2,
	    SEVENTH_RANK    = -1,
	    EIGHTH_RANK     = 1,
	    NINTH_RANK      = 2,
	    TENTH_RANK      = 3,
	    ELEVENTH_RANK   = 4,
	    TWELFTH_RANK    = 5,
	    THIRTEENTH_RANK = 6,
	    FOURTEENTH_RANK = 7,
	    HIGHEST_RANK    = 8
		]

	RANK_POINTS = 
		{
	    LOWEST_RANK     =>    0,
	    FIRST_RANK      =>  100,
	    SECOND_RANK     =>  200,
	    THIRD_RANK      =>  300,
	    FOURTH_RANK     =>  400,
	    FIFTH_RANK      =>  500,
	    SIXTH_RANK      =>  600,
	    SEVENTH_RANK    =>  700,
	    EIGHTH_RANK     =>  800,
	    NINTH_RANK      =>  900,
	    TENTH_RANK      => 1000,
	    ELEVENTH_RANK   => 1100,
	    TWELFTH_RANK    => 1200,
	    THIRTEENTH_RANK => 1300,
	    FOURTEENTH_RANK => 1400,
	    HIGHEST_RANK    => 1500
		}

	RANK_POINTS_INCREMENT  = 100

	RANK_NUMBER_EQUIVALENTS = 
		{   
	    LOWEST_RANK     =>  0,
	    FIRST_RANK      =>  1,
	    SECOND_RANK     =>  2,
	    THIRD_RANK      =>  3,
	    FOURTH_RANK     =>  4, 
	    FIFTH_RANK      =>  5,
	    SIXTH_RANK      =>  6,
	    SEVENTH_RANK    =>  7, 
      EIGHTH_RANK     =>  8,
	    NINTH_RANK      =>  9,
	    TENTH_RANK      => 10,
	    ELEVENTH_RANK   => 11,
	    TWELFTH_RANK    => 12,
	    THIRTEENTH_RANK => 13,
	    FOURTEENTH_RANK => 14,
	    HIGHEST_RANK    => 15
  	}

	NUMBER_RANK_EQUIVALENTS = 
		{   
	    0  => LOWEST_RANK    , 
	    1  => FIRST_RANK     , 
	    2  => SECOND_RANK    , 
	    3  => THIRD_RANK     , 
	    4  => FOURTH_RANK    , 
	    5  => FIFTH_RANK     , 
	    6  => SIXTH_RANK     , 
	    7  => SEVENTH_RANK   , 
	    8  => EIGHTH_RANK    , 
	    9  => NINTH_RANK     ,
	   10  => TENTH_RANK     ,
	   11  => ELEVENTH_RANK  ,
	   12  => TWELFTH_RANK   ,
	   13  => THIRTEENTH_RANK,
	   14  => FOURTEENTH_RANK,
	   15  => HIGHEST_RANK  
  	}

 	POINTS_AWARDED_BY =
		{
     -1 =>           1,  
      0 =>           3,     
      1 =>    1*1 * 10, 
      2 =>    2*2 * 10,    
      3 =>    3*3 * 10,  
      4 =>    4*4 * 10,  
      5 =>    5*5 * 10,
      6 =>    6*6 * 10, 
      7 =>    7*7 * 10,   
      8 =>    8*8 * 10, 
      9 =>    9*9 * 10, 
     10 =>  10*10 * 10,
     11 =>  11*11 * 10, 
     12 =>  12*12 * 10,
     13 =>  13*13 * 10, 
     14 =>  14*14 * 10, 
     15 =>  15*15 * 10 
    }
    
	RANK_DIFFERENCE_BELOW_WHICH_NO_POINTS_AWARDED = -1 
  MINIMUM_SCORE_IN_RANK    = 0  
  MAXIMUM_ATTAINABLE_SCORE = 1500      

	def initialize

		@users_current_rank = LOWEST_RANK
		@progress           = MINIMUM_SCORE_IN_RANK
		
	end

	def rank
		@users_current_rank
	end
	def progress
		@progress
	end

	def inc_progress solved_kata
    
    raise "3 kinds of hell" if !RANKS.include?(solved_kata)
		
		@rank_difference = RANK_NUMBER_EQUIVALENTS[solved_kata] - RANK_NUMBER_EQUIVALENTS[@users_current_rank]
		return if @rank_difference < RANK_DIFFERENCE_BELOW_WHICH_NO_POINTS_AWARDED

		new_points_total = RANK_POINTS[@users_current_rank] + @progress + POINTS_AWARDED_BY[@rank_difference]

		assign_rank_based_on(new_points_total)
	end

	def assign_rank_based_on new_points_total
 
 		if new_points_total >= MAXIMUM_ATTAINABLE_SCORE 

			@users_current_rank = HIGHEST_RANK
			@progress           = MINIMUM_SCORE_IN_RANK
		else
			@users_current_rank = NUMBER_RANK_EQUIVALENTS[new_points_total / RANK_POINTS_INCREMENT]	
			@progress           = new_points_total % RANK_POINTS_INCREMENT
		end
	end
end