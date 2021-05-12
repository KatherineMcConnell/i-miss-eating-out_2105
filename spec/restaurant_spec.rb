require 'rspec'
require_relative '../lib/restaurant'

RSpec.describe Restaurant do
  describe '#initialize' do
    it 'exists' do
      restaurant = Restaurant.new('10:00', 'Fuel Cafe')
      expect(restaurant).to be_an_instance_of(Restaurant)
    end
  end

  describe 'attributes' do
    it 'can read attributes' do
      restaurant = Restaurant.new('10:00', 'Fuel Cafe')
      expect(restaurant.opening_time).to eq("10:00")
      expect(restaurant.name).to eq("Fuel Cafe")
      expect(restaurant.dishes).to eq([])
    end
  end

  describe 'closing_time' do
    it 'can calculate closing_time' do
      restaurant1 = Restaurant.new('10:00', 'Fuel Cafe')
      restaurant2 = Restaurant.new('16:00', 'Il Poggio')
      expect(restaurant1.closing_time(8)).to eq("18:00")
      expect(restaurant2.closing_time(7)).to eq("23:00")
    end
  end

  describe 'add_dish' do
    it 'can add dishes' do
      restaurant1 = Restaurant.new('10:00', 'Fuel Cafe')
      restaurant2 = Restaurant.new('16:00', 'Il Poggio')
      restaurant2.add_dish('Burrata')
      restaurant2.add_dish('Pizzetta')
      restaurant2.add_dish('Ravioli')
      expect(restaurant2.dishes).to eq(["Burrata", "Pizzetta", "Ravioli"])
    end
  end

  describe 'open_for_lunch?' do
    it 'is opening_time before 12n?' do
      restaurant1 = Restaurant.new('10:00', 'Fuel Cafe')
      restaurant2 = Restaurant.new('16:00', 'Il Poggio')
      expect(restaurant1.open_for_lunch?).to eq(true)
      expect(restaurant2.open_for_lunch?).to eq(false)
    end
  end

  describe 'menu_dish_names' do
    it 'returns array of dish names in all caps' do
      restaurant1 = Restaurant.new('10:00', 'Fuel Cafe')
      restaurant2 = Restaurant.new('16:00', 'Il Poggio')
      restaurant2.add_dish('Burrata')
      restaurant2.add_dish('Pizzetta')
      restaurant2.add_dish('Ravioli')
      expect(restaurant2.menu_dish_names).to eq(["BURRATA", "PIZZETTA", "RAVIOLI"])
    end
  end

  describe 'announce_closing_time' do
    it 'closing time in 12hr format in string interpolation' do
      restaurant1 = Restaurant.new('06:00', 'Fuel Cafe')
      restaurant2 = Restaurant.new('16:00', 'Il Posto')
      expected1 = "Fuel Cafe will be closing at 11:00AM"
      expect(restaurant1.announce_closing_time(5)).to eq(expected1)
      expected2 = "Il Posto will be closing at 11:00PM"
      expect(restaurant2.announce_closing_time(7)).to eq(expected2)
    end
  end

end
