require 'spec_helper'

module Asistefe
  class Calendar
    describe Turn do

      def time(str)
        Time.parse("2018-01-01T#{str}:00-03:000")
      end

      let(:time_since) { time('10:00') }
      let(:time_until) { time('11:00') }
      subject { Turn.new(time_since, time_until) }

      it 'shold tell me the duration in seconds' do
        duration = subject.duration
        expect(duration).to eq 60 * 60
      end

      context 'on collision testing' do

        it 'should tell me that a turn before does not collides' do
          time_1 = time('09:00')
          time_2 = time('10:00')
          new_turn = Turn.new(time_1, time_2)
          collision = subject.collides?(new_turn)
          expect(collision).to be false
        end

        it 'should tell me that a turn after does not collides' do
          time_1 = time('11:00')
          time_2 = time('12:00')
          new_turn = Turn.new(time_1, time_2)
          collision = subject.collides?(new_turn)
          expect(collision).to be false
        end

        it 'should tell me that a turn before collides' do
          time_1 = time('09:00')
          time_2 = time('10:01')
          new_turn = Turn.new(time_1, time_2)
          collision = subject.collides?(new_turn)
          expect(collision).to be true
        end

        it 'should tell me that a turn after collides' do
          time_1 = time('10:59')
          time_2 = time('12:00')
          new_turn = Turn.new(time_1, time_2)
          collision = subject.collides?(new_turn)
          expect(collision).to be true
        end

        it 'should tell me that a turn included collides' do
          time_1 = time('10:01')
          time_2 = time('10:59')
          new_turn = Turn.new(time_1, time_2)
          collision = subject.collides?(new_turn)
          expect(collision).to be true
        end

        it 'should tell me that a turn that includes collides' do
          time_1 = time('09:59')
          time_2 = time('11:01')
          new_turn = Turn.new(time_1, time_2)
          collision = subject.collides?(new_turn)
          expect(collision).to be true
        end

      end

    end
  end
end
