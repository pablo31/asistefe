require 'spec_helper'

module Asistefe
  class Calendar
    describe Distributor do

      def time(str)
        Time.parse("2018-01-01T#{str}:00-03:000")
      end

      let(:time_since) { time('10:00') }
      let(:time_until) { time('11:00') }
      let(:shift) { Shift.new(time_since, time_until) }
      subject { Distributor.new(shift) }

      it 'puts a turn in a specific position' do
        time_1 = time('10:00')
        time_2 = time('10:10')
        turn = Turn.new(time_1, time_2)
        subject.put(turn)
        expect(shift.used_time).to eq 10 * 60
        expect(shift.empty_time).to eq 50 * 60
      end

    end
  end
end
