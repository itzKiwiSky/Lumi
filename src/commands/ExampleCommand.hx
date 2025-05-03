package commands;

import comma.OptionDefinition;
import tools.CreateTemplate;
import comma.ParsedOptions;
import comma.CliApp;
import comma.Command;
/**
 * Just a dummy command template for me, so I can just ctrl-c and ctrl-v it
*/

class ExampleCommand extends Command
{
    public function new() 
    {
        super();
    }

    override function getName()
    {
        return "exe";
    }

    override function getDescription()
    {
        return "aaa";
    }

    override function printCommandHelp(app:CliApp) 
    {

    }

    override function onExecuted(app: CliApp, value: Array<String>, options: ParsedOptions) 
    {
        
    }
}