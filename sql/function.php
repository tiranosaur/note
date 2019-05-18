DROP FUNCTION IF EXISTS tmp_func;

CREATE FUNCTION tmp_func ( bn VARCHAR ( 32 ) ) RETURNS INT BEGIN
declare var INTEGER;
SELECT count(id) into var FROM books WHERE bookName = bn ;
RETURN var;
END;

SELECT tmp_func ( 'bookname№_5' ) as count;