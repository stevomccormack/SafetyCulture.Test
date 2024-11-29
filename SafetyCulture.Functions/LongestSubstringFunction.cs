namespace SafetyCulture.Functions;

public static class LongestSubstringFunction
{
    public static int LongestSubstring(string s)
    {
        var charIndexMap = new Dictionary<char, int>();
        var maxLength = 0;
        var start = 0;

        for (var end = 0; end < s.Length; end++)
        {
            var currentChar = s[end];

            if (charIndexMap.ContainsKey(currentChar) && charIndexMap[currentChar] >= start)
            {
                start = charIndexMap[currentChar] + 1;
            }

            charIndexMap[currentChar] = end;
            maxLength = Math.Max(maxLength, end - start + 1);
        }

        return maxLength;
    }
}