require 'spec_helper'

module Asistefe
  module Sources
    describe Recovery do

      let(:file_manager) { double }
      let(:entry_serializer) { double }
      subject { Recovery.new(file_manager, entry_serializer) }

      it 'should read the serializations file' do
        serializations = "serialization_1\nserialization_2\nserialization_3"
        expect(file_manager).to receive(:read_serializations).once.with(no_args).and_return serializations
        expect(entry_serializer).to receive(:deserialize).once.with('serialization_1').and_return(entry_1 = double)
        expect(entry_serializer).to receive(:deserialize).once.with('serialization_2').and_return(entry_2 = double)
        expect(entry_serializer).to receive(:deserialize).once.with('serialization_3').and_return(entry_3 = double)
        expect(subject.entries).to contain_exactly entry_1, entry_2, entry_3
      end

    end
  end
end
