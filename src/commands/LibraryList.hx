package commands;

import comma.OptionDefinition;
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
        //addOptionDefinition(new OptionDefinition("u", "url", "Display the url for each library"));
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
        var libCount: Int = Lambda.count(LibraryDatabase.database);

        if (libCount <= 0)
        {
            Sys.println("You don't have any libraries registred");
            return;
        }

        Sys.println('Listing ${libCount} ${(libCount > 0 ? "library" : "libraries")}');
        var display = Table.create();
        display.addRow();
        for (libname => url in LibraryDatabase.database)
        {
            //Sys.println('${Style.space(2)} - ${libname} ');
            display.addEmptyColumn(2);
            display.addColumn(libname);
            display.addEmptyColumn(5);
            display.addColumn(url);
            display.addRow();
        }
        Sys.println(display.toString());
    }
}