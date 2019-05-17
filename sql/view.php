CREATE OR REPLACE VIEW tmp_table AS SELECT
b.`id`,
CONCAT( '<span class="book_href" onclick="getBook(', b.id, ')">', b.bookName, '</span>' ) book,
b.`year`,
IF ( a.id IS NULL, 'неизвестный автор', GROUP_CONCAT( CONCAT( '<a href="', a.id, '">', a.authorName ), '</a>')) `authors`
FROM
`books` b
LEFT JOIN books_authors ba ON ba.book_id = b.id
LEFT JOIN AUTHORS a ON a.id = ba.author_id
GROUP BY
b.bookName,
b.id,
a.id
ORDER BY
b.id;

SELECT tt.id, tt.book, tt.`year`,GROUP_CONCAT(`authors`) FROM tmp_table tt GROUP BY id;