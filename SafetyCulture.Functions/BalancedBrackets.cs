namespace SafetyCulture.Functions;

public class BalancedBrackets
{
    public static bool IsBalanced(string s)
    {
        var stack = new Stack<char>();
        var bracketPairs = new Dictionary<char, char>
        {
            { '(', ')' },
            { '{', '}' },
            { '[', ']' }
        };

        foreach (var c in s)
        {
            var isOpenBracket = bracketPairs.ContainsKey(c);
            var isCloseBracket = bracketPairs.ContainsValue(c);

            // If neither open or close bracket, continue to next char
            if (!isOpenBracket && !isCloseBracket)
                continue;
            
            // If it's an opening bracket, push onto the stack
            if (isOpenBracket)
            {
                stack.Push(c);
                continue;
            }

            if (isCloseBracket)
            {
                // If it's a closing bracket, check for a match
                if (stack.Count == 0 || bracketPairs[stack.Pop()] != c)
                    return false; // Unmatched closing bracket
            }
        }

        // If the stack is empty, all brackets were matched
        return stack.Count == 0;
    }
}
