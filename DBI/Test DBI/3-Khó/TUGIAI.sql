--Câu 2 : 
SELECT  AT.*
FROM Authors AT
WHERE AT.Country='United Kingdom' and AT.Sex='Female'

--Câu 3 : 

SELECT 
	BS.BookID,
	BS.Title,
	BS.PublicationYear,
	AT.AuthorID,
	AT.AuthorName,
	AT.Country
FROM 
	Books BS,Authors AT 
WHERE 
	BS.AuthorID=AT.AuthorID 
	AND BS.PublicationYear<=1920 
	AND AT.Country='United Kingdom'

--Câu 4 : ý của câu này là tìm quyển sách được mượn ít nhất 1 lần và xuất bản sau 1980 
	SELECT DISTINCT GR.*		
	FROM Genres GR,Books BS,BookCopies BC,LoanDetails LD,Loans L
	WHERE GR.GenreID=BS.GenreID 
	AND BC.CopyID=LD.CopyID AND LD.LoanID=L.LoanID AND BS.BookID=BC.BookID
	AND BS.PublicationYear>1980
	ORDER BY GR.GenreName ASC

--Câu 5 : 
	SELECT	
			GR.*,
			COALESCE(COUNT(BC.BookID),0)'NumberOfBookCopies'--COALESCE thay thế giá trị null bằng 0 
	FROM 
		Books BS,Genres GR,BookCopies BC
	WHERE 
		BS.GenreID=GR.GenreID AND BS.BookID=BC.BookID --NẾU DÙNG WHERE KIỂU NÀY THÌ NÓ NGẦM ĐỊNH LÀ INNER JOIN NÊN SẼ KO TRẢ VỀ KẾT QUẢ 0 , SOLUTION DÙNG LEFT JOIN 
		AND BS.PublicationYear>1980		
	GROUP BY 
		GR.GenreID,GR.GenreName
	ORDER BY 
		NumberOfBookCopies DESC,GR.GenreName ASC
		--=========================
	SELECT
    GR.GenreID,
    GR.GenreName,
    COALESCE(COUNT(BC.BookID), 0) AS 'NumberOfBookCopies'
FROM 
    Genres GR
LEFT JOIN 
    Books BS ON GR.GenreID = BS.GenreID AND BS.PublicationYear > 1980
LEFT JOIN 
    BookCopies BC ON BS.BookID = BC.BookID
GROUP BY 
    GR.GenreID, GR.GenreName
ORDER BY 
    NumberOfBookCopies DESC, 
    GR.GenreName ASC;

--Câu 6 : khÓ 


--Câu 7 : KHÓ 
SELECT GR.*,count(distinct MB.MemberID)'NumberOfMaleMembers'
FROM Genres GR
LEFT JOIN Books BS ON BS.GenreID=GR.GenreID
LEFT JOIN BookCopies BC ON BS.BookID=BC.BookID
LEFT JOIN LoanDetails LD ON BC.CopyID=LD.CopyID
LEFT JOIN Loans LS ON LD.LoanID=LS.LoanID
LEFT JOIN Members MB ON LS.MemberID=MB.MemberID
WHERE MB.Sex='Male' 
AND YEAR(LS.LoanDate)=2020
GROUP BY MB.MemberName
UNION
SELECT GR.*,count(distinct MB.MemberID)'NumberOfFemaleMembers'
FROM Genres GR
LEFT JOIN Books BS ON BS.GenreID=GR.GenreID
LEFT JOIN BookCopies BC ON BS.BookID=BC.BookID
LEFT JOIN LoanDetails LD ON BC.CopyID=LD.CopyID
LEFT JOIN Loans LS ON LD.LoanID=LS.LoanID
LEFT JOIN Members MB ON LS.MemberID=MB.MemberID
WHERE MB.Sex='Female' 
AND YEAR(LS.LoanDate)=2020
GROUP BY MB.MemberName

--=========================================
SELECT 
    GR.GenreID,
    GR.GenreName,
    COALESCE(MaleMembers.NumberOfMaleMembers, 0) AS NumberOfMaleMembers,
    COALESCE(FemaleMembers.NumberOfFemaleMembers, 0) AS NumberOfFemaleMembers
FROM 
    Genres GR
LEFT JOIN 
    (
        SELECT 
            B.GenreID,
            COUNT(DISTINCT M.MemberID) AS NumberOfMaleMembers
        FROM 
            Loans L
        JOIN 
            LoanDetails LD ON L.LoanID = LD.LoanID
        JOIN 
            BookCopies BC ON LD.CopyID = BC.CopyID
        JOIN 
            Books B ON BC.BookID = B.BookID
        JOIN 
            Members M ON L.MemberID = M.MemberID
        WHERE 
            M.Sex = 'Male' AND 
            YEAR(L.LoanDate) = 2020
        GROUP BY 
            B.GenreID
    ) AS MaleMembers ON GR.GenreID = MaleMembers.GenreID
LEFT JOIN 
    (
        SELECT 
            B.GenreID,
            COUNT(DISTINCT M.MemberID) AS NumberOfFemaleMembers
        FROM 
            Loans L
        JOIN 
            LoanDetails LD ON L.LoanID = LD.LoanID
        JOIN 
            BookCopies BC ON LD.CopyID = BC.CopyID
        JOIN 
            Books B ON BC.BookID = B.BookID
        JOIN 
            Members M ON L.MemberID = M.MemberID
        WHERE 
            M.Sex = 'Female' AND 
            YEAR(L.LoanDate) = 2020
        GROUP BY 
            B.GenreID
    ) AS FemaleMembers ON GR.GenreID = FemaleMembers.GenreID
ORDER BY 
    GR.GenreName;
GO
--Câu 8 
CREATE PROCEDURE insertAuthor (@authorID int,@authorName nvarchar(100),@country nvarchar(100),@sex nvarchar(10),@yearOfBirth int) 

AS
	BEGIN
		
	END