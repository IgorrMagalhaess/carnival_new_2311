require 'spec_helper'

RSpec.describe Ride do
   describe '#initialize' do
      it 'exists' do
         ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })

         expect(ride1).to be_a Ride
      end

      it 'has a name' do
         ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })

         expect(ride1.name).to eq('Carousel')
      end

      it 'has a minimun height' do
         ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })

         expect(ride1.min_height).to eq(24)
      end

      it 'has a admission fee' do
         ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })

         expect(ride1.admission_fee).to eq(1)
      end

      it 'has a excitement level' do
         ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })

         expect(ride1.excitement).to eq(:gentle)
      end

      it 'initialize with no revenue' do
         ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })

         expect(ride1.total_revenue).to eq(0)
      end

      it 'starts with an empty rider log' do
         ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })

         expect(ride1.rider_log).to eq({})
      end
   end

   describe '#board_rider' do
      it 'it boards the ride and adds to the log' do
         ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
         visitor1 = Visitor.new('Bruce', 54, '$10')
         visitor2 = Visitor.new('Tucker', 36, '$5')

         visitor1.add_preference(:gentle)
         visitor2.add_preference(:gentle)

         expect(ride1.board_rider(visitor1)).to eq(1)

         ride1.board_rider(visitor1)
         ride1.board_rider(visitor2)

         expect(ride1.rider_log).to eq({visitor1 => 2, visitor2 => 1})
      end

      it 'will not board visitor that do not have that preference' do
         ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
         ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
         ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
         visitor1 = Visitor.new('Bruce', 54, '$10')
         visitor2 = Visitor.new('Tucker', 36, '$5')
         visitor3 = Visitor.new('Penny', 64, '$15')

         visitor1.add_preference(:gentle)
         visitor2.add_preference(:gentle)
         visitor2.add_preference(:thrilling)
         visitor3.add_preference(:thrilling)

         expect(ride3.board_rider(visitor1)).to eq nil
      end

      it 'will charge visitor' do
         ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
         ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
         ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
         visitor1 = Visitor.new('Bruce', 54, '$10')
         visitor2 = Visitor.new('Tucker', 36, '$5')
         visitor3 = Visitor.new('Penny', 64, '$15')

         visitor1.add_preference(:gentle)
         visitor2.add_preference(:gentle)
         visitor2.add_preference(:thrilling)
         visitor3.add_preference(:thrilling)

         ride3.board_rider(visitor3)

         expect(visitor3.spending_money).to eq(13)
      end

      it 'will add revenue to total revenue' do
         ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
         ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
         ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
         visitor1 = Visitor.new('Bruce', 54, '$10')
         visitor2 = Visitor.new('Tucker', 36, '$5')
         visitor3 = Visitor.new('Penny', 64, '$15')

         visitor1.add_preference(:gentle)
         visitor2.add_preference(:gentle)
         visitor2.add_preference(:thrilling)
         visitor3.add_preference(:thrilling)

         ride3.board_rider(visitor3)
         ride3.board_rider(visitor3)

         expect(ride3.total_revenue).to eq(4)
      end

      it 'will not board riders smaller than min height' do
         ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
         ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
         ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
         visitor1 = Visitor.new('Bruce', 54, '$10')
         visitor2 = Visitor.new('Tucker', 36, '$5')
         visitor3 = Visitor.new('Penny', 64, '$15')

         visitor1.add_preference(:gentle)
         visitor2.add_preference(:gentle)
         visitor2.add_preference(:thrilling)
         visitor3.add_preference(:thrilling)

         
         expect(ride3.board_rider(visitor2)).to eq nil
      end

      it 'will not board riders with no money' do
         ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
         ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
         ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
         visitor1 = Visitor.new('Bruce', 54, '$10')
         visitor2 = Visitor.new('Tucker', 36, '$5')
         visitor3 = Visitor.new('Penny', 64, '$1')

         visitor1.add_preference(:gentle)
         visitor2.add_preference(:gentle)
         visitor2.add_preference(:thrilling)
         visitor3.add_preference(:thrilling)

         
         expect(ride3.board_rider(visitor3)).to eq nil
      end
   end
end