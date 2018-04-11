require 'spec_helper'

module Asistefe
  describe Calendar do

    context 'with one slot' do

      let(:time_slot) { double }
      subject { Calendar.new([time_slot]) }

      it 'should tell the total time available' do
        expect(time_slot).to receive(:time_available?).and_return(true)
        expect(subject.time_available?).to be true
      end

      it 'should return the next time available' do
        some_exact_time = Time.parse('2018-01-01T10:00:00-03:000')
        expect(time_slot).to receive(:time_available?).and_return(true)
        expect(time_slot).to receive(:next_practice_time).and_return(some_exact_time)
        expect(subject.next_practice_time).to eq some_exact_time
      end

      it 'should return a random time' do
        some_exact_time = Time.parse('2018-01-01T10:00:00-03:000')
        expect(time_slot).to receive(:time_available?).and_return(false)
        expect(time_slot).to receive(:random_time).and_return(some_exact_time)
        expect(subject.next_practice_time).to eq some_exact_time
      end

    end

  end
end
