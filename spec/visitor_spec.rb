require 'spec_helper'

RSpec.describe Visitor do
   describe '#initialize' do
      it 'exists' do
         visitor1 = Visitor.new('Bruce', 54, '$10')

         expect(visitor1).to be_a Visitor
      end

      it 'has a name' do
         visitor1 = Visitor.new('Bruce', 54, '$10')

         expect(visitor1.name).to eq('Bruce')
      end

      it 'has a height' do
         visitor1 = Visitor.new('Bruce', 54, '$10')
         
         expect(visitor1.height).to eq(54)
      end

      it 'has spending money' do
         visitor1 = Visitor.new('Bruce', 54, '$10')

         expect(visitor1.spending_money).to eq(10)
      end

      it 'starts with no preferences' do
         visitor1 = Visitor.new('Bruce', 54, '$10')

         expect(visitor1.preferences).to eq([])
      end
   end

   describe '#add_preference' do
      it 'adds preferences to Visitor' do
         visitor1 = Visitor.new('Bruce', 54, '$10')

         expect(visitor1.add_preference(:gentle)).to eq([:gentle])
         expect(visitor1.add_preference(:thrilling)).to eq([:gentle, :thrilling])
      end

      it 'adds preference to Visitor preferences' do
         visitor1 = Visitor.new('Bruce', 54, '$10')

         visitor1.add_preference(:gentle)
         visitor1.add_preference(:thrilling)

         expect(visitor1.preferences).to eq([:gentle, :thrilling])
      end
   end

   describe '#tall_enough(height)' do
      it 'returns true if height passed is equal or smaller than visitor height' do
         visitor1 = Visitor.new('Bruce', 54, '$10')
         visitor2 = Visitor.new('Tucker', 36, '$5')
         visitor3 = Visitor.new('Penny', 64, '$15')
         
         expect(visitor1.tall_enough?(54)).to eq(true)
         expect(visitor3.tall_enough?(54)).to eq(true)
      end

      it 'returns false if height passed is  smaller than visitor height' do
         visitor1 = Visitor.new('Bruce', 54, '$10')
         visitor2 = Visitor.new('Tucker', 36, '$5')
         visitor3 = Visitor.new('Penny', 64, '$15')
         
         expect(visitor2.tall_enough?(54)).to eq(false)
         expect(visitor1.tall_enough?(64)).to eq(false)
      end
   end

   describe '#charge_visitor' do
      it 'charge admission fee to visitor' do
         visitor1 = Visitor.new('Bruce', 54, '$10')

         expect(visitor1.charge_visitor(2)).to eq(8)
      end
   end
end
