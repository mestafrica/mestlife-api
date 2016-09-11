class AddDomainForTimelineItemText < ActiveRecord::Migration[5.1]
  def up
    execute <<-SQL
DROP DOMAIN IF EXISTS timeline_item_text;
CREATE DOMAIN timeline_item_text AS text;

CREATE OR REPLACE FUNCTION check_length_of_timeline_item_text( text )
RETURNS bool
AS $$
  SELECT length( $1 ) <= 500;
$$ LANGUAGE SQL;

ALTER DOMAIN timeline_item_text ADD CONSTRAINT max_length CHECK ( check_length_of_timeline_item_text(value) );
    SQL
  end

  def end
    execute <<-SQL
DROP DOMAIN IF EXISTS timeline_item_text;
DROP FUNCTION IF EXISTS check_length_of_timeline_item_text( text );
    SQL
  end
end
