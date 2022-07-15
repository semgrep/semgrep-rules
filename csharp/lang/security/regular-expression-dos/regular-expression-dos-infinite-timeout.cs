using System.Text.RegularExpressions;

namespace RegularExpressionsDosInfiniteTimeout
{
    public class RegularExpressionsDosInfiniteTimeout
    {
        // ok
        Regex rgx = new Regex(pattern, RegexOptions.IgnoreCase, TimeSpan.FromSeconds(1));
        
        // ruleid: regular-expression-dos-infinite-timeout
        Regex rgx = new Regex(pattern, RegexOptions.IgnoreCase, TimeSpan.FromSeconds(10));
        
        // ruleid: regular-expression-dos-infinite-timeout
        Regex rgx = new Regex(pattern, RegexOptions.IgnoreCase, TimeSpan.InfiniteMatchTimeout);

        // ruleid: regular-expression-dos-infinite-timeout
        Regex rgx = new Regex(pattern, RegexOptions.IgnoreCase, TimeSpan.FromMinutes(1));
        
        // ruleid: regular-expression-dos-infinite-timeout
        Regex rgx = new Regex(pattern, RegexOptions.IgnoreCase, TimeSpan.FromHours(1));
    }
}
