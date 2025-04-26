package;

import comma.CliApp;
import commands.InitCommand;
import terminal.Terminal;
import terminal.Color.TextColor;

class Main 
{
    static var appVersion: String = "0.0.1";

    static function main() 
    {
        Terminal.printf([
            [ TextColor.BrightMagenta ], 
            " _                     _ ___  _____  \n",
            "| |                   (_)__ \\|  __ \\ \n",
            "| |    _   _ _ __ ___  _   ) | |  | |\n",
            "| |   | | | | '_ ` _ \\| | / /| |  | |\n",
            "| |___| |_| | | | | | | |/ /_| |__| |\n",
            "|______\\__,_|_| |_| |_|_|____|_____/ \n\n\n",

            [ TextColor.BrightCyan ], "Lumi2D - A CLI Toolkit for ",
            [ TextColor.BrightMagenta ], "LOVE", [TextColor.BrightCyan ], "2D\n",
            [ TextColor.Cyan ], 'Version ${appVersion}',
        ]);

        var app = new CliApp("", "");
        app.addCommand(new InitCommand());
        app.start();
    }
}