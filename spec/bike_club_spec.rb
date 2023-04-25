require './lib/ride'
require './lib/biker'
require './lib/bike_club'

RSpec.describe BikeClub do
  let(:bike_club1) {BikeClub.new("Biker Boyz")}
  let(:biker) {Biker.new("Kenny", 30)}
  let(:biker2) {Biker.new("Athena", 15)}
  
  let(:ride1) {Ride.new({name: "Walnut Creek Trail", 
                        distance: 10.7,
                        loop: false, 
                        terrain: :hills})} 

  let(:ride2) {Ride.new({name: "Town Lake", 
                        distance: 14.9,
                        loop: true,
                        terrain: :gravel})}
  describe "iteration 3" do
    it "exists" do
      expect(bike_club1).to be_a(BikeClub)
    end

    it "has attributes" do
      expect(bike_club1.name).to eq("Biker Boyz")
    end

    it "starts with empty array of bikers" do
      expect(bike_club1.bikers).to eq([])
    end

    it "#add_biker/1" do
      bike_club1.add_biker(biker)
      expect(bike_club1.bikers).to eq([biker])
    end

    it "#most_rides" do
      biker.learn_terrain!(:gravel)
      biker.learn_terrain!(:hills)

      biker.log_ride(ride1, 92.5)
      biker.log_ride(ride1, 91.1)
      biker.log_ride(ride2, 60.9)
      biker.log_ride(ride2, 61.6)

      biker2.learn_terrain!(:gravel)
      biker2.learn_terrain!(:hills)

      biker2.log_ride(ride1, 95.0)
      biker2.log_ride(ride2, 65.0)

      bike_club1.add_biker(biker)
      bike_club1.add_biker(biker2)
      
      expect(bike_club1.most_rides).to eq(biker)
    end

    # it "#best_time/1" do
    #   biker.learn_terrain!(:gravel)
    #   biker.learn_terrain!(:hills)

    #   biker.log_ride(ride1, 92.5)
    #   biker.log_ride(ride1, 91.1)
    #   biker.log_ride(ride2, 60.9)
    #   biker.log_ride(ride2, 61.6)

    #   biker2.learn_terrain!(:gravel)
    #   biker2.learn_terrain!(:hills)

    #   biker2.log_ride(ride1, 95.0)
    #   biker2.log_ride(ride2, 65.0)

    #   bike_club1.add_biker(biker)
    #   bike_club1.add_biker(biker2)
      
    #   expect(bike_club1.best_time(ride1)).to eq(biker)
    # end
  end
end