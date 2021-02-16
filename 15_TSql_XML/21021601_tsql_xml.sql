
-- XML --
INSERT INTO xmlTbl VALUES('Hello World');

SELECT * FROM xmlTbl;

INSERT INTO xmlTbl VALUES('<html><body><p>Sample HTML</p></body></html>');

SELECT u.userID, u.userName,u.BirthYear, u.addr, u.height, b.prodName, b.price
FROM userTbl AS u
JOIN buyTbl AS b ON (u.userID = b.userID)
WHERE u.height > 170
FOR XML AUTO ;
SELECT u.userID, u.userName,u.BirthYear, u.addr, u.height, b.prodName, b.price
FROM userTbl AS u
JOIN buyTbl AS b ON (u.userID = b.userID)
WHERE u.height > 170
FOR JSON AUTO;
-- XML --