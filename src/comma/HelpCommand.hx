package comma;

import comma.ParsedOptions;
import comma.Command;
import comma.CliApp;

class HelpCommand extends Command
{
    override function getName():String {
        return "help";
    }
    override function getDescription():String {
        return "Prints help";
    }

    override function onExecuted(app:CliApp,values:Array<String>,  options:ParsedOptions) {
        Style.disableWordWrap();
        app.printHelp();
        Style.enableWordWrap();
    }
}