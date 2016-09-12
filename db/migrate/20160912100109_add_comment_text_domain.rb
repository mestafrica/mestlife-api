class AddCommentTextDomain < ActiveRecord::Migration[5.1]
  def up
    execute <<-SQL
DROP DOMAIN IF EXISTS comment_text;
CREATE DOMAIN comment_text AS text;
COMMENT ON DOMAIN comment_text IS 'A special type for the text of a comment. Allows us to change character limits transparently';

CREATE OR REPLACE FUNCTION check_length_of_comment_text( text )
RETURNS bool
AS $$
  SELECT length( $1 ) <= 500;
$$ LANGUAGE SQL;

ALTER DOMAIN comment_text ADD CONSTRAINT max_length CHECK ( check_length_of_comment_text(value) );
    SQL
  end

  def down
    execute <<-SQL
DROP DOMAIN IF EXISTS comment_text;
DROP FUNCTION IF EXISTS check_length_of_comment_text( text );
    SQL
  end
end
