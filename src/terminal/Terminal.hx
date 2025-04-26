package terminal;

import terminal.Color.TextColor;
import terminal.Color.BackgroundColor;
import terminal.Color.TextStyle;

using StringTools;

class Terminal 
{
    /**
     * Write characters on terminal with format structure
     * @param printContent Array
     */
    public static function printf(printContent: Array<Dynamic>): Void
    {
        var text: String = "";
        for (item in printContent)
        {
            if (Std.isOfType(item, String))
            {
                text += item;
            }
            else if (Std.isOfType(item, Array))
            {
                var attr: Array<Dynamic> = cast item;

                for (style in attr)
                    text += style;
            }
        }
        text += TextStyle.Reset;
        Sys.println(text);
    }
}