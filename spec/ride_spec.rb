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

         expect(ride1.board_rider(visitor1)).to eq({visitor1 => 1})

         ride1.board_rider(visitor1)
         ride1.board_rider(visitor2)

         expect(ride1.rider_log).to eq({visitor1 => 2, visitor2 => 1})
      end
   end
end