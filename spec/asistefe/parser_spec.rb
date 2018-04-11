require 'spec_helper'

module Asistefe
  describe Parser do

    it 'should parse correctly -- single diagnosis valid patient' do
      parser = Parser.new('15042949730100 i 10')
      expect(parser.patient_number).to eq '150429497301'
      expect(parser.kinship_number).to eq '00'
      expect(parser.diagnoses_codes).to contain_exactly 'i10'
    end

    it 'should parse correctly -- single diagnosis weird but valid patient' do
      parser = Parser.new('15042949730100I10')
      expect(parser.patient_number).to eq '150429497301'
      expect(parser.kinship_number).to eq '00'
      expect(parser.diagnoses_codes).to contain_exactly 'i10'
    end

    it 'shouldnt parse -- invalid patient number' do
      parser = Parser.new('1504294973010I10')
      expect { parser.patient_number }.to raise_error RuntimeError
      expect { parser.kinship_number }.to raise_error RuntimeError
    end

  end
end
