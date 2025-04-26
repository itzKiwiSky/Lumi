package commands;

import comma.OptionDefinition;
import comma.ValueDefinition;
import comma.ParsedOptions;
import comma.CliApp;
import comma.Command;

class RegisterLibrary extends Command
{
    public function new() 
        {
            super();
            addValueDefinition(new ValueDefinition("name", "Name of the library to register", true));
            addValueDefinition(new ValueDefinition("url", "The url where this library is located", true));
            //addOptionDefinition(new OptionDefinition("l", "libname", "library name"));
            //addOptionDefinition(new OptionDefinition("u", "url", "libray url"));
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

            
            //if (!options.exists("l", "libname") || !options.exists("u", "url"))
            //    app.printHelp();
        }
}