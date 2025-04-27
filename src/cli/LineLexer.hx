package cli;

using StringTools;

class LineLexer
{
    public static function parse(sysargs: Array<String>)
    {
        var args = sysargs;
        var tokens = new Array<Dynamic>();

        var i = 0;

        while (i < args.length) 
        {
            var arg = args[i];

            if (arg.startsWith("--") || arg.startsWith("-")) 
            {
                var key = arg;
                var value = "true"; // se for flag
                if (i + 1 < args.length && !args[i + 1].startsWith("-")) 
                {
                    value = args[i + 1];
                    i++;
                }
                // new flahg
                tokens.push({
                    key: key,
                    value: value,
                });
            }
            else 
            {
                var argument = arg;
                // new arg
                tokens.push(argument);
            }

            i++;
        }

        return tokens;
    }
}
