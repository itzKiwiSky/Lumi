package commands;

import comma.ParsedOptions;
import comma.CliApp;
import comma.Command;

class RegisterLibrary extends Command
{
    public function new() 
        {
            super();
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
            
        }
}