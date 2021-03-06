require('rspec')
require('vehicle')

describe(Vehicle) do
  before() do
    Vehicle.clear()
  end

  describe('#make') do
    it("returns the make of the vehicle") do
      test_vehicle = Vehicle.new("Toyota", "Tundra", 2000)
      test_vehicle.save()
      expect(test_vehicle.make()).to eq("Toyota")
    end
  end

  describe('#model') do
    it("returns the model of the vehicle") do
      test_vehicle = Vehicle.new("Toyota", "Tundra", 2000)
      test_vehicle.save()
      expect(test_vehicle.model()).to eq("Tundra")
    end
  end

  describe('#year') do
    it("returns the year of the vehicle") do
      test_vehicle = Vehicle.new("Toyota", "Tundra", 2000)
      test_vehicle.save()
      expect(test_vehicle.year()).to eq(2000)
    end
  end

  describe("#save") do
    it("adds a vehicle to the dealership inventory") do
      test_vehicle = Vehicle.new("Toyota", "Tundra", 2000)
      test_vehicle.save()
      expect(Vehicle.all()).to eq([test_vehicle])
    end
  end

  describe("#age") do
    it("returns the vehicle age") do
      test_vehicle = Vehicle.new("Toyota", "Tundra", 2000)
      expect(test_vehicle.age()).to eq(15)
    end
  end

  describe("#worth_buying?") do
    it("returns false if the car is not American made and less than 15 years old") do
      test_vehicle = Vehicle.new("Toyota", "Tundra", 2000)
      expect(test_vehicle.worth_buying?()).to eq(false)
    end
  end

  describe("#id") do
    it("returns the unique idenitfier of a car in the array") do
      test_vehicle = Vehicle.new("Toyota", "Tundra", 2000)
      expect(test_vehicle.id()).to eq(1)
    end
  end

  describe(".find") do
    it("returns a vehicle by its id number") do
      test_vehicle = Vehicle.new("Toyota", "Tundra", 2000)
      test_vehicle.save()
      test_vehicle2 = Vehicle.new("Toyota", "Tacoma", 1990)
      test_vehicle2.save()
      expect(Vehicle.find(test_vehicle.id())).to eq(test_vehicle)
    end
  end
end
