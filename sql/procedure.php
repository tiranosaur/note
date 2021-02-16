DROP PROCEDURE IF	EXISTS get_book_by_id_proc;
CREATE PROCEDURE get_book_by_id_proc ( book_id INTEGER )
BEGIN
CREATE OR REPLACE VIEW tmp AS
SELECT
b.bookName book_name,
b.`year`,
GROUP_CONCAT( CONCAT( '<a href="', a.id, '">', a.authorName, '</a>' ) ) `authors`,
t.bookText book_text
FROM
`books` b
LEFT JOIN books_authors ba ON b.id = ba.book_id
LEFT JOIN AUTHORS a ON ba.author_id = a.id
LEFT JOIN text t ON b.id = t.book_id
WHERE
b.id = 55
GROUP BY
b.bookName,
b.id,
t.bookText;
SELECT * from tmp;
END;

call get_book_by_id_proc(55)

_______________________________________________________________________________
DROP PROCEDURE IF	EXISTS resetTimestamp;
CREATE PROCEDURE resetTimestamp ( pid INT ) BEGIN	
	UPDATE `page_contents` SET `updated_at` = '2020-12-18 00:00:00' WHERE page_id = pid AND lang = 'ru';
	UPDATE `page_contents` SET `updated_at` = '2020-12-19 00:00:00' WHERE page_id = pid AND lang = 'en';
END;
call resetTimestamp ( 362 );
