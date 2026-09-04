CREATE FUNCTION dbo.FormatPhoneNumber
(
    @PhoneNumber VARCHAR(10)
)
RETURNS VARCHAR(14)
AS
BEGIN
    DECLARE @FormattedNumber VARCHAR(14)

    IF LEN(@PhoneNumber) = 10
        SET @FormattedNumber = '(' + SUBSTRING(@PhoneNumber, 1, 3) + ') ' +
                               SUBSTRING(@PhoneNumber, 4, 3) + '-' +
                               SUBSTRING(@PhoneNumber, 7, 4)
    ELSE
        SET @FormattedNumber = @PhoneNumber

    RETURN @FormattedNumber
END