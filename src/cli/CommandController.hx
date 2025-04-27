package cli;

import cli.Command;

class CommandController 
{
    public static var commands: Array<Command> = new Array<Command>();
    public static var arguments: Array<Args> = new Array<Args>();

    public static function addCommand(command: Command) 
    {
        commands.push(command);
    }

    public static function run() 
    {
        var args: Array<String> = Sys.args();
        var cmdList:Map<String, Dynamic> = new Map<String, Dynamic>();

        for (cmd in commands)
            cmdList.set(cmd.name, cmd.onRun);

        var options = new Map<String, Dynamic>();
        var arguments = new Array<String>();

        var data = LineLexer.parse(args);
        var currentCommand = data.shift();
    

        //cmdList[currentCommand]();

        for (d in data)
            if (!Std.isOfType(d, String))
                options.set(d.key, d.value);
            else
                arguments.push(d);

        if (args.length <= 0 || !cmdList.exists(currentCommand))
        {
            Main.displayLogo();

            //print help
            return;
        }
        
        cmdList[currentCommand](arguments, options);

    }
}