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