package commands;

import comma.Table;
import comma.OptionDefinition;
import tools.CreateTemplate;
import comma.ParsedOptions;
import comma.CliApp;
import comma.Command;

class InitCommand extends Command
{
    public function new() 
    {
        super();
        addOptionDefinition(new OptionDefinition("n", "name", "Add a name to the project"));
        addOptionDefinition(new OptionDefinition("v", "verbose", "Enable to see a detailed log of the project extraction"));
    }

    override function getName()
    {
        return "init";
    }
    override function getDescription()
    {
        return "Initialize a new project based on a template";
    }

    override function printCommandHelp(app: CliApp) 
    {
        app.printHelp();
        return;
    }

    override function onExecuted(app:CliApp, values:Array<String>,  options:ParsedOptions)
    {
        var name: Dynamic = options.exists("n", "name") ? options.get("n", "name")[0] : "game";
        CreateTemplate.create(Sys.getCwd() + "/" + name, options.exists("v", "verbose"));
    }
}