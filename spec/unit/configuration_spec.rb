require 'spec_helper'

module CamelCaser
  describe Configuration, type: 'unit' do
    its(:json_request_format_header) { is_expected.to eq 'request-json-format' }
    its(:json_response_format_header) do
      is_expected.to eq 'response-json-format'
    end
    its(:excluded_routes) { is_expected.to eq [] }
    its(:default_json_request_key_transformation_strategy) do
      is_expected.to eq :camelize
    end

    its(:default_json_response_key_transformation_strategy) do
      is_expected.to eq :camelize
    end

    describe 'json_format_header' do
      specify do
        actual = subject.json_format_header(:response)
        expect(actual).to eq 'response-json-format'
      end

      specify do
        actual = subject.json_format_header(:request)
        expect(actual).to eq 'request-json-format'
      end
    end


    describe 'default_json_key_transformation_strategy' do
      specify do
        actual = subject.default_json_key_transformation_strategy(:response)
        expect(actual).to eq :camelize
      end

      specify do
        actual = subject.default_json_key_transformation_strategy(:request)
        expect(actual).to eq :camelize
      end
    end
  end
end
