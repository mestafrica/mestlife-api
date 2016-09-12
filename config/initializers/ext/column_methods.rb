module ActiveRecord
  module ConnectionAdapters
    module PostgreSQL
      module ColumnMethods
        def timeline_item_text(*args, **options)
          args.each { |name| column(name, :timeline_item_text, options) }
        end

        def primary_key(name, type = :primary_key, **options)
          options[:default] = options.fetch(:default, 'gen_random_uuid()') if type == :uuid
          super
        end

        def comment_text(*args, **options)
          args.each { |name| column(name, :comment_text, options) }
        end
      end
    end
  end
end
