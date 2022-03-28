using System.Text.RegularExpressions;

namespace RegularExpressionsDos
{
    public class RegularExpressionsDos
    {
        // ruleid: regular-expression-dos
        public void ValidateRegex(string search)
        {
            Regex rgx = new Regex("^A(B|C+)+D");
            rgx.Match(search);

        }

        // ruleid: regular-expression-dos
        public void ValidateRegex2(string search)
        {
            Regex rgx = new Regex("^A(B|C+)+D", new RegexOptions { });
            rgx.Match(search);

        }

        // ok: regular-expression-dos
        public void ValidateRegex3(string search)
        {
            Regex rgx = new Regex("^A(B|C+)+D", new RegexOptions { }, TimeSpan.FromSeconds(2000));
            rgx.Match(search);

        }

        // ruleid: regular-expression-dos
        public void Validate4(string search)
        {
            var pattern = @"^A(B|C+)+D";
            var result = Regex.Match(search, pattern);
        }

        // ruleid: regular-expression-dos
        public void Validate5(string search)
        {
            var pattern = @"^A(B|C+)+D";
            var result = Regex.Match(search, pattern, new RegexOptions { });
        }

        // ok: regular-expression-dos
        public void Validate5(string search)
        {
            var pattern = @"^A(B|C+)+D";
            var result = Regex.Match(search, pattern, new RegexOptions { }, TimeSpan.FromSeconds(2000));
        }
    }
}
