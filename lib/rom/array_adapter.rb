# frozen_string_literal: true
module Rom
  class ArrayAdapter
    class Gateway < ROM::Gateway
      attr_reader :datasets

      def initialize
        @datasets = Hash.new { |h, k| h[k] = [] }
      end

      def dataset(name)
        datasets[name]
      end

      def dataset?(name)
        datasets.key?(name)
      end
    end

    class Relation < ROM::Relation
      adapter :array

      # read
      forward :select, :reject

      # write
      forward :<<, :delete
    end
  end
end

ROM.register_adapter(:array, Rom::ArrayAdapter)
