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
        addOptionDefinition(new OptionDefinition("l", "list", "Add from a registerlist.txt"));
    }
    
    override function getName()
    {
        return "addlib";
    }
    override function getDescription()
    {
        return "Add a new library on the local database";
    }

    override function printCommandHelp(app:CliApp) {
        var help = Table.create()
        .addRow()
        .addColumn(getName())
        .addEmptyColumn(8)
        .addColumn(getDescription())
        .addRow()
        .addEmptyColumn(5)
        .toString(1);

        for (name => desc in arguments)
        {
            var argumentHelp = Table.create()
            .addRow()
            .addEmptyColumn(4)
            .addColumn('<${name}>')
            .addEmptyColumn(6)
            .addColumn(desc)
            .toString(1);

            help += argumentHelp;
        }

        Sys.println(help);
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
                //trace('$key => ${value}');
                LibraryDatabase.database.set(key, value);
            }
        }

        LibraryDatabase.saveDBContent();

        //var data:Array<String> = .split("=");
        //trace(data);
        

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