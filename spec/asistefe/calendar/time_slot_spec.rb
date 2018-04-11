require 'spec_helper'

module Asistefe
  class Calendar
    describe TimeSlot do

      let(:time_since) { Time.parse('2018-01-01T10:00:00-03:000') }
      let(:time_until) { Time.parse('2018-01-01T11:00:00-03:000') }
      let(:practices_interval) { 15 } # minutes
      subject { TimeSlot.new(time_since, time_until, practices_interval) }

      it 'should tell me if there is time available' do
        expect(subject.time_available?).to be true
      end

      it 'should tell me the next practice time' do
        expect(subject.next_practice_time). to eq Time.parse('2018-01-01T10:00:00-03:000')
        expect(subject.next_practice_time). to eq Time.parse('2018-01-01T10:15:00-03:000')
        expect(subject.next_practice_time). to eq Time.parse('2018-01-01T10:30:00-03:000')
        expect(subject.next_practice_time). to eq Time.parse('2018-01-01T10:45:00-03:000')
        expect(subject.time_available?).to be false
        expect {subject.next_practice_time }.to raise_error RuntimeError
      end

    end
  end
end
