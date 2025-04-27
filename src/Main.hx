package;

import comma.Style.TextStyle;
import tools.LibraryDatabase;
import commands.RegisterLibrary;
import commands.InitCommand;
import comma.CliApp;
import terminal.Terminal;
import terminal.Color.TextColor;
import tools.SetupConfig;

class Main 
{
    public static var appsign = "luvi";
    static var appVersion: String = "0.0.1";

    public static function displayLogo() 
        {
            Terminal.printf([
                [ TextColor.Magenta ], 
                "    _     _   _       _ ___  _____  \n",
                "   | |   (_) (_)     (_)__ \\|  __ \\ \n",
                "   | |    _   ___   ___   ) | |  | |\n",
                "   | |   | | | \\ \\ / / | / /| |  | |\n",
                [ TextColor.BrightMagenta ], 
                "   | |___| |_| |\\ V /| |/ /_| |__| |\n",
                "   |______\\__,_| \\_/ |_|____|_____/ \n",
                "                                    \n",
                
                [ TextColor.BrightCyan, TextStyle.Bold ], "Luvi2D - A CLI Toolkit for ",
                [ TextColor.BrightMagenta ], "LOVE", [TextColor.BrightCyan ], "2D\n",
                [ TextColor.Cyan ], 'Version ${appVersion}',
            ]);
        }

    static function main() 
    {
        // run some config stuff //
        SetupConfig.setup();
        LibraryDatabase.getDBContent();

        //displayLogo();

        var app = new CliApp("", "");
        app.addCommand(new InitCommand());
        app.addCommand(new RegisterLibrary());
        app.start();
    }
}