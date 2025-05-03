package comma;

import comma.Table;
import comma.CliApp;
import comma.ValueDefinition;
import comma.OptionDefinition;

class Command
{
    public function new(){}

    var optionDefinitions: Array<OptionDefinition> = new Array<OptionDefinition>();
    var valueDefinitions: Array<ValueDefinition> = new Array<ValueDefinition>();

    public var arguments: Map<String, String> = new Map<String, String>();

    public function getName(){ return ""; }

    public function addOptionDefinition(def: OptionDefinition){ optionDefinitions.push(def); }

    public function addValueDefinition(def: ValueDefinition){ valueDefinitions.push(def); }

    public function getOptionDefinitions(){ return optionDefinitions; }

    public function getValueDefinitions(){ return valueDefinitions; }
    
    public function getDescription(){ return ""; }

    function getOptionDefinitionOfName(name: String)
    {
        for (def in optionDefinitions){
            if (def.getName() == name){
                return def;
            }
        }
        return null;
    }

    public final function execute(app: CliApp, values: Array<String>, options: ParsedOptions){
        onExecuted(app, values, options);
    }

    public function printCommandHelp(app: CliApp) 
    {
        app.printHelp();
    }

    public function onExecuted(app, value, options){}
}