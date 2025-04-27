package commands;

import comma.Table;
import comma.OptionDefinition;
import comma.ValueDefinition;
import comma.ParsedOptions;
import comma.CliApp;
import comma.Command;

class RegisterLibrary extends Command
{
    var arguments: Map<String, String> = new Map<String, String>();

    public function new() 
    {
        super();
        arguments.set("libname", "Name of the library to register");
        arguments.set("liburl", "The url where this library is located");
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
        values.shift(); // ignore first argument since is the command name //
        if (values.length <= 0)
        {
            var help = Table.create()
            .addRow()
            .addColumn(getName())
            .addEmptyColumn(8)
            .addColumn(getDescription())
            .addRow()
            .addEmptyColumn(5)
            .toString();

            for (name => desc in arguments)
            {
                var argumentHelp = Table.create()
                .addRow()
                .addEmptyColumn(4)
                .addColumn(name)
                .addEmptyColumn(6)
                .addColumn(desc)
                .toString();

                help += argumentHelp;
            }

            Sys.println(help);
            return;
        }
    }
}