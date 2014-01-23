require_relative "../lib/user"

describe "User" do 

	it "shouldn't fail at limit" do
		user = User.new
		expect(user.rank).to eq(-8)
		expect(user.progress).to eq(0)

		user.inc_progress(8)
		expect(user.rank).to eq(8)
		expect(user.progress).to eq(0)
		#expect(user.rank).to eq(5)
	end

	it "should progress" do
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

	
end

#	user = User.new
# Test.assert_equals(user.rank, -8)