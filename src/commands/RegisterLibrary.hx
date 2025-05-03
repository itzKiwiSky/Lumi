package commands;

import sys.FileSystem;
import comma.OptionDefinition;
import sys.io.File;
import tools.LibraryDatabase;
import comma.Table;
import comma.ParsedOptions;
import comma.CliApp;
import comma.Command;

using StringTools;

class RegisterLibrary extends Command
{
    public function new() 
    {
        super();
        arguments.set("libname", "Name of the library to register");
        arguments.set("liburl", "The url where this library is located");
    }
    
    override function getName()
    {
        return "addlib";
    }
    override function getDescription()
    {
        return "Add a new library on the local database, if no lib name is set, it will try find a registerlist.txt and load from there.";
    }

    private function loadFromList() 
    {
        var fileContent: String = File.getContent(Sys.getCwd() + "/registerlist.txt");
        //trace(fileContent);
        var lines: Array<String> = fileContent.split("\n");

        for (line in lines)
        {
            var data = line.split("=");
            
            if (data.length == 2) 
            {
                var key = data[0].trim();
                var value = data[1].trim();
                LibraryDatabase.database.set(key, value);
            }
        }

        LibraryDatabase.saveDBContent();
        return;
    }

    override function onExecuted(app:CliApp, values:Array<String>,  options:ParsedOptions)
    {
        var libname: String = values[0];
        var liburl: String = values[1];

        if (libname == null)
        {
            if(FileSystem.exists(Sys.getCwd() + "/registerlist.txt"))
            {
                loadFromList();
                return;
            }
        }

        if (liburl != null)
        {
            LibraryDatabase.database.set(libname, liburl);
            LibraryDatabase.saveDBContent();
            return;
        }

        app.printHelp();
        return;
    }
}