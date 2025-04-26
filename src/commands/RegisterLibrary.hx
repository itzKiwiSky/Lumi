package commands;

import comma.ValueDefinition;
import comma.ParsedOptions;
import comma.CliApp;
import comma.Command;

class RegisterLibrary extends Command
{
    public function new() 
        {
            super();
            addValueDefinition(new ValueDefinition("name"));
            addValueDefinition(new ValueDefinition("url"));
        }
    
        override function getName()
        {
            return "register";
        }
        override function getDescription()
        {
            return "Register a new library on the local database";
        }
    
        override function onExecuted(app:CliApp, values:Array<String>,  options:ParsedOptions)
        {

        }
}