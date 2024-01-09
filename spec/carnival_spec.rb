require 'spec_helper'

RSpec.describe Carnival do
   describe '#initialize' do
      it 'exists' do
         carnival = Carnival.new(30)

         expect(carnival).to be_a Carnival
      end

      it 'has a duration' do
         carnival = Carnival.new(30)

         expect(carnival.duration).to eq(30)
      end

      it 'starts with no rides' do
         carnival = Carnival.new(30)

         expect(carnival.rides).to eq([])
      end

      it 'starts with no revenue' do
         carnival = Carnival.new(30)

         expect(carnival.revenue).to eq(0)
      end
   end
end