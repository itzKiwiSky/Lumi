package commands;

import tools.DownloadController;
import haxe.Http;
import haxe.io.Bytes;
import comma.OptionDefinition;
import tools.CreateTemplate;
import comma.ParsedOptions;
import comma.CliApp;
import comma.Command;

/**
 * Just a dummy command template for me, so I can just ctrl-c and ctrl-v it
*/

class TestGet extends Command
{
    public function new() 
    {
        super();
    }

    override function getName()
    {
        return "get";
    }

    override function getDescription()
    {
        return "get";
    }

    override function printCommandHelp(app:CliApp) 
    {

    }

    override function onExecuted(app: CliApp, value: Array<String>, options: ParsedOptions) 
    {
        var url: String = "https://github.com/kikito/gamera/archive/refs/heads/master.zip";

        DownloadController.downloadFromUrl(url, Sys.getCwd() + "/lib.zip");

        //createRequest(url);
    }

}