require_relative "../lib/user"

describe "User" do 

	it "Check initialization, termination on wrong kind of kata passed, value 0" do
		user = User.new
		expect(user.rank).to eq(-8)
		expect(user.progress).to eq(0)

		user.inc_progress(0)
		expect(user.rank).to raise_error("3 kinds of hell")
	end
	it "Check initialization, termination on wrong kind of kata passed, value 9" do
		user = User.new
		expect(user.rank).to eq(-8)
		expect(user.progress).to eq(0)

		user.inc_progress(9)
		expect(user.rank).to raise_error("3 kinds of hell")
	end
	it "Check initialization, termination on wrong kind of kata passed, value -9" do
		user = User.new
		expect(user.rank).to eq(-8)
		expect(user.progress).to eq(0)

		user.inc_progress(-99)
		expect(user.rank).to raise_error("3 kinds of hell")
	end

	it "Progression" do
		
		user = User.new

		user.inc_progress(-8)
		expect(user.rank).to eq(-8)
		expect(user.progress).to eq(3)

		user.inc_progress(-8)
		expect(user.rank).to eq(-8)
		expect(user.progress).to eq(6)

		user.inc_progress(7)
		expect(user.rank).to eq(8)
	end

	it "should progress 2" do
  	user = User.new
		expect(user.rank).to eq(-8)
		expect(user.progress).to eq(0)

		user.inc_progress(-8)
		expect(user.rank).to eq(-8)
		expect(user.progress).to eq(3)

		user.inc_progress(-7)
		expect(user.rank).to eq(-8)
		expect(user.progress).to eq(13)

		user.inc_progress(-6)
		expect(user.rank).to eq(-8)
		expect(user.progress).to eq(53)
		
		user.inc_progress(-4)
		expect(user.progress).to eq(13)
		expect(user.rank).to eq(-6)

		user.inc_progress(1)
		#expect(user.progress).to eq(213)
		expect(user.rank).to eq(-3)
		expect(user.progress).to eq(73)

		user.inc_progress(8)
		expect(user.rank).to eq(8)
		expect(user.progress).to eq(0)
		#expect(user.rank).to eq(5)
  end
  	it "should progress 3" do
  		user = User.new

  		user.inc_progress(-7)
	  	expect(user.rank).to eq(-8)
	  	expect(user.progress).to eq(10)

	  	user.inc_progress(-6)
	  	expect(user.rank).to eq(-8)
	  	expect(user.progress).to eq(50)

	  	user.inc_progress(-5)
	  	expect(user.rank).to eq(-7)
	  	expect(user.progress).to eq(40)

	  	user.inc_progress(-4)
	  	expect(user.rank).to eq(-6)
	  	expect(user.progress).to eq(30)

		end
end

