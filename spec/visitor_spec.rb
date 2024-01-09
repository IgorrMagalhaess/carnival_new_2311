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

         expect(visitor1.spending_money).to eq('$10')
      end

      it 'starts with no preferences' do
         visitor1 = Visitor.new('Bruce', 54, '$10')

         expect(visitor1.preferences).to eq([])
      end
   end
end
