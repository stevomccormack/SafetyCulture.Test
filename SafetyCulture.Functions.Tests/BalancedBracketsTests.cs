namespace SafetyCulture.Functions.Tests;

public class BalancedBracketsTests
{
    [Theory(DisplayName = "Success Cases")]
    [InlineData("()", true)]          // Single pair of brackets
    [InlineData("()[]{}", true)]      // Multiple types, balanced
    [InlineData("{[()]}", true)]      // Nested brackets, balanced
    [InlineData("(((())))", true)]    // Deeply nested
    [InlineData("", true)]            // Empty string is balanced
    public void TestBalancedBrackets_SuccessCases(string input, bool expected)
    {
        Assert.Equal(expected, BalancedBrackets.IsBalanced(input));
    }

    [Theory(DisplayName = "Edge Cases")]
    [InlineData("(", false)]          // Single unmatched opening bracket
    [InlineData(")", false)]          // Single unmatched closing bracket
    [InlineData("{[}]", false)]       // Incorrectly nested
    [InlineData("((())", false)]      // Missing closing bracket
    [InlineData("{[(])}", false)]     // Nested but improperly closed
    public void TestBalancedBrackets_EdgeCases(string input, bool expected)
    {
        Assert.Equal(expected, BalancedBrackets.IsBalanced(input));
    }

    [Theory(DisplayName = "Failure Cases")]
    [InlineData("))))))", false)]     // Only closing brackets
    [InlineData("((((((", false)]     // Only opening brackets
    [InlineData("{[()]}{[()]}{[()]}", true)]  // Repeated balanced brackets
    [InlineData("()(()", false)]      // Partial mismatch
    [InlineData("{[()]}abc{[()]}", true)]     // Includes non-bracket characters
    public void TestBalancedBrackets_FailureCases(string input, bool expected)
    {
        Assert.Equal(expected, BalancedBrackets.IsBalanced(input));
    }
}
