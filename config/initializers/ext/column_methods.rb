module ActiveRecord
  module ConnectionAdapters
    module PostgreSQL
      module ColumnMethods
        def timeline_item_text(*args, **options)
          args.each { |name| column(name, :timeline_item_text, options) }
        end
      end
    end
  end
end
