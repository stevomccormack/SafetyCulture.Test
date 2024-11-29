namespace SafetyCulture.Functions;

public static class TwoSumFunction
{
    public static int[] TwoSum(int[] nums, int target) 
    {        
        var map = new Dictionary<int, int>();
        
        for (var i = 0; i < nums.Length; i++) 
        {            
            var complement = target - nums[i];
            
            if (map.ContainsKey(complement)) {
                return [map[complement], i];
            }
            
            map[nums[i]] = i;
        }
        
        throw new ArgumentException("No solution found");
   }    
}