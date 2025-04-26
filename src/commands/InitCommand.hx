package commands;

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
        addOptionDefinition(new OptionDefinition("name", "n", "Add a name to the project"));
    }

    override function getName()
    {
        return "init";
    }
    override function getDescription()
    {
        return "Initialize a new project based on a template";
    }

    override function onExecuted(app:CliApp, values:Array<String>,  options:ParsedOptions)
    {
        var name: Dynamic = options.exists("name", "n") ? options.get("name", "n")[0] : "game";
        CreateTemplate.create(Sys.getCwd() + "/" + name);
    }
}