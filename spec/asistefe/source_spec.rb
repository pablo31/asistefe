require 'spec_helper'

module Asistefe
  describe Source do

    # let(:reader) { Reader.new('spec/resources/input2.txt') }
    # subject { Source.new(reader) }

    # it 'should tell the read isnt completed' do
    #   expect(subject.completed?).to be false
    # end

    # it 'should tell the read is at half way' do
    #   2.times { subject.next_entry }
    #   expect(subject.completed?).to be false
    # end

    # it 'should tell the read is completed' do
    #   3.times { subject.next_entry }
    #   expect(subject.completed?).to be true
    # end

    # it 'should return the correct content' do
    #   entry_1 = subject.next_entry
    #   expect(entry_1.patient_number).to eq '150268807904'
    #   expect(entry_1.kinship_number).to eq '00'
    #   expect(entry_1.diagnoses_codes).to contain_exactly 'i10'
    #   entry_2 = subject.next_entry
    #   expect(entry_2.patient_number).to eq '150150588502'
    #   expect(entry_2.kinship_number).to eq '01'
    #   expect(entry_2.diagnoses_codes).to contain_exactly 'f41'
    #   entry_3 = subject.next_entry
    #   expect(entry_3.patient_number).to eq '150249142909'
    #   expect(entry_3.kinship_number).to eq '99'
    #   expect(entry_3.diagnoses_codes).to contain_exactly 'm25.5'
    #   expect(subject.completed?).to be true
    # end

  end
end
