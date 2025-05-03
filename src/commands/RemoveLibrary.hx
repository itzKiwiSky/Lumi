package commands;

import tools.LibraryDatabase;
import comma.Table;
import comma.ParsedOptions;
import comma.CliApp;
import comma.Command;

class RemoveLibrary extends Command
{
    public function new() 
    {
        super();
        arguments.set("libname", "Name of the library to register");
    }
    
    override function getName()
    {
        return "removelib";
    }
    override function getDescription()
    {
        return "Remove the library from the local database";
    }

    override function onExecuted(app:CliApp, values:Array<String>,  options:ParsedOptions)
    {
        var libname: String = values[0];

        if (libname == null)
        {
            app.printHelp();
            return;
        }

        LibraryDatabase.database.remove(libname);
        LibraryDatabase.saveDBContent();
    }
}