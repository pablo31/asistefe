require 'spec_helper'

module Asistefe
  class Calendar
    describe Shift do

      def time(str)
        Time.parse("2018-01-01T#{str}:00-03:000")
      end

      let(:time_since) { time('10:00') }
      let(:time_until) { time('11:00') }
      subject { Shift.new(time_since, time_until) }

      it 'should tell me basic time info' do
        expect(subject.used_time).to eq 0
        expect(subject.empty_time).to eq 60 * 60
      end

      it 'allows me to add a turn' do
        time_1 = time('10:00')
        time_2 = time('10:10')
        turn = Turn.new(time_1, time_2)
        subject.add(turn)
        expect(subject.used_time).to eq 10 * 60
        expect(subject.empty_time).to eq 50 * 60
      end

      it 'denies me to add a turn' do
        time_1 = time('10:00')
        time_2 = time('10:10')
        turn_1 = Turn.new(time_1, time_2)
        subject.add(turn_1)
        time_1 = time('10:05')
        time_2 = time('10:15')
        turn_2 = Turn.new(time_1, time_2)
        expect { subject.add(turn_2) }.to raise_error CollisionError
        expect(subject.collision(turn_2)).to be turn_1
      end

    end
  end
end
