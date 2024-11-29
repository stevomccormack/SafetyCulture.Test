namespace SafetyCulture.Functions.Tests;

public class LongestSubstringTests
{
    [Theory(DisplayName = "Success Cases")]
    [InlineData("abcabcbb", 3)] // Longest substring is "abc"
    [InlineData("pwwkew", 3)]   // Longest substring is "wke"
    [InlineData("abcdef", 6)]   // Entire string is unique
    public void TestLongestSubstring_SuccessCases(string input, int expected)
    {
        Assert.Equal(expected, LongestSubstringFunction.LongestSubstring(input));
    }

    [Theory(DisplayName = "Edge Cases")]
    [InlineData("", 0)]         // Empty string
    [InlineData("a", 1)]        // Single character
    [InlineData("aaaaaa", 1)]   // All characters are the same
    [InlineData("abcbdeac", 5)] // Overlapping substrings
    public void TestLongestSubstring_EdgeCases(string input, int expected)
    {
        Assert.Equal(expected, LongestSubstringFunction.LongestSubstring(input));
    }

    [Theory(DisplayName = "Failure Cases")]
    [InlineData("bbbbbbbbbbbbbbbbbbbbb", 1)] // Only one unique character
    [InlineData("11111111111", 1)]           // Numeric input with repetition
    public void TestLongestSubstring_FailureCases(string input, int expected)
    {
        Assert.Equal(expected, LongestSubstringFunction.LongestSubstring(input));
    }
}