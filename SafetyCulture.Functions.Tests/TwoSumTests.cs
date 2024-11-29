namespace SafetyCulture.Functions.Tests;

public class TwoSumTests
{
    [Theory(DisplayName = "Success Cases")]
    [InlineData(new int[] { 2, 7, 11, 15 }, 9, new int[] { 0, 1 })]   // First two numbers add up
    [InlineData(new int[] { 3, 2, 4 }, 6, new int[] { 1, 2 })]        // Two middle numbers add up
    [InlineData(new int[] { 1, 2, 3, 4 }, 7, new int[] { 2, 3 })]    // Numbers at different positions
    public void TestTwoSum_SuccessCases(int[] nums, int target, int[] expected)
    {
        Assert.Equal(expected, TwoSumFunction.TwoSum(nums, target));
    }

    [Theory(DisplayName = "Edge Cases")]
    [InlineData(new int[] { 5, 5 }, 10, new int[] { 0, 1 })]          // Same number used twice
    [InlineData(new int[] { 1, 1, 1, 1, 2, 3 }, 5, new int[] { 4, 5 })] // Duplicates in the array
    [InlineData(new int[] { -1, -2, -3, -4 }, -6, new int[] { 1, 3 })] // Negative numbers
    public void TestTwoSum_EdgeCases(int[] nums, int target, int[] expected)
    {
        Assert.Equal(expected, TwoSumFunction.TwoSum(nums, target));
    }

    [Theory(DisplayName = "Failure Cases")]
    [InlineData(new int[] { 1, 2, 3 }, 7)]                           // No solution exists
    [InlineData(new int[] { 1, 5, 3, 4 }, 10)]                       // No two numbers sum to target
    public void TestTwoSum_FailureCases(int[] nums, int target)
    {
        Assert.Throws<ArgumentException>(() => TwoSumFunction.TwoSum(nums, target));
    }
}