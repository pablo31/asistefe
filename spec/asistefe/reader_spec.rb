require 'spec_helper'

module Asistefe
  describe Reader do

    subject { Reader.new('spec/resources/input1.txt') }
    # note: input1.txt has 4 lines

    it 'should tell the read isnt completed' do
      expect(subject.completed?).to be false
    end

    it 'should tell the read is at half way' do
      2.times { subject.fetch }
      expect(subject.completed?).to be false
    end

    it 'should tell the read is completed' do
      4.times { subject.fetch }
      expect(subject.completed?).to be true
    end

    it 'should return the correct content' do
      expect(subject.fetch).to eq 'line1'
      expect(subject.fetch).to eq 'line2'
      expect(subject.fetch).to eq 'line3'
      expect(subject.fetch).to eq 'line4'
    end

  end
end
