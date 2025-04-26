package;

import commands.*;
import tools.LibraryDatabase;
//import commands.InitCommand;
import terminal.Terminal;
import terminal.Color.TextColor;
import tools.SetupConfig;

class Main
{
    public inline static var appsign = "lumi";
    static var appVersion: String = "0.0.1";

    static function main() 
    {
        // run some config stuff //
        SetupConfig.setup();
        LibraryDatabase.getDBContent();

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
    }
}