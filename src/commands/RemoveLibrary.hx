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

    override function onExecuted(app:CliApp, values:Array<String>,  options:ParsedOptions)
    {
        var libname: String = values[0];

        if (libname == null)
        {
            printCommandHelp(app);
            return;
        }

        LibraryDatabase.database.remove(libname);
        LibraryDatabase.saveDBContent();
    }
}