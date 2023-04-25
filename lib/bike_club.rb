class BikeClub
  attr_reader :name,
              :bikers
  def initialize(name)
    @name = name
    @bikers = []
  end

  def add_biker(biker)
    @bikers << biker
  end

  def most_rides
    @bikers.find do |biker|
      biker.rides.count
    end
  end

  # def best_time(ride)
  #   @bikers.find do |biker|
  #     require 'pry'; binding.pry
  #     biker.rides.include?(ride)
  #     # biker.rides.values.sort
      
  #   end
  # end
  
end