using System.Data.Common;

namespace JeffExtensions;

public static class SqlDataReaderExtensions
{
    // Good idea taken from https://stackoverflow.com/questions/1772025/sql-data-reader-handling-null-column-values
    public static string SafeGetString(this DbDataReader reader, int colIndex, string defaultValue = "")
    {
        if (!reader.IsDBNull(colIndex))
            return reader.GetString(colIndex);
        return defaultValue;
    }
}
