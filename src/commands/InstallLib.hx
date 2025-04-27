package commands;

import comma.OptionDefinition;
import tools.CreateTemplate;
import comma.ParsedOptions;
import comma.CliApp;
import comma.Command;

class InstallLib extends Command
{
    public function new() 
    {
        super();
        addOptionDefinition(new OptionDefinition("c", "cache-lib", "Cache the lib locally, avoiding re-download"));
        arguments.set("libname", "The library name you want install");
    }

    override function getName()
    {
        return "install";
    }

    override function getDescription()
    {
        return "Install a library on your current project";
    }

    override function printCommandHelp(app:CliApp) 
    {

    }

    override function onExecuted(app: CliApp, value: Array<String>, options: ParsedOptions) 
    {
        
    }
}