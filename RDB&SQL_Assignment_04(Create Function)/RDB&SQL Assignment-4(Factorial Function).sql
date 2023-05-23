-- Create a scalar-valued function that returns the factorial of a number you gave it.

CREATE FUNCTION dbo.scalar_valued (@number INT)
RETURNS INT
AS
BEGIN
        IF @number = 0
        RETURN 1

        DECLARE @result INT
        SET @result = 1
        WHILE @number > 0
        BEGIN
            SET @result = @result * @number
            SET @number = @number - 1
        END
        RETURN @result
END

------- Result Test

SELECT dbo.scalar_valued(0)

SELECT dbo.scalar_valued(6)


