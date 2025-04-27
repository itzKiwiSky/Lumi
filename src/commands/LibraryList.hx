package commands;

import comma.Style;
import tools.LibraryDatabase;
import comma.Table;
import comma.ParsedOptions;
import comma.CliApp;
import comma.Command;

class LibraryList extends Command 
{
    public function new() 
    {
        super();
    }

    override function getName()
    {
        return "listlib";
    }

    override function getDescription()
    {
        return "List the registred libraries";
    }

    override function onExecuted(app: CliApp, value: Array<String>, options: ParsedOptions) 
    {
        var libraryList = Table.create();
        var libCount: Int = Lambda.count(LibraryDatabase.database);

        if (libCount <= 0)
        {
            Sys.println("You don't have any libraries registred");
            return;
        }

        Sys.println('Listing ${libCount} ${(libCount > 0 ? "library" : "libraries")}');
        for (libname => desc in LibraryDatabase.database)
        {
            Sys.println('${Style.space(2)} - ${libname}');
        }
    }
}