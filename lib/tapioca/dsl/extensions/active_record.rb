# typed: true
# frozen_string_literal: true

begin
  require "active_record"
rescue LoadError
  return
end

module Tapioca
  module Dsl
    module Compilers
      module Extensions
        module ActiveRecord
          attr_reader :__tapioca_delegated_types

          def delegated_type(role, types:, **options)
            @__tapioca_delegated_types ||= {}
            @__tapioca_delegated_types[role] = { types: types, options: options }

            super
          end

          ::ActiveRecord::Base.singleton_class.prepend(self)
        end
      end
    end
  end
end