# frozen_string_literal: true

module Dbcop
  # collects result info for rendering
  class Collector
    class << self
      def log(cop, message)
        data.push(cop: cop, message: message)
      end

      def progress(_cop, char)
        print char
      end

      def render
        obj = data.each_with_object({}) do |item, hash|
          hash[item[:cop].name] ||= []
          hash[item[:cop].name] << item
        end

        obj.each do |cop_name, items|
          items.each do |item|
            puts "#{Rainbow(cop_name).red}:"\
                   " #{Rainbow(item[:cop].model.name).yellow}"\
                   " #{item[:message]}"
          end
        end
      end

      private

      def data
        @data ||= []
      end
    end
  end
end
