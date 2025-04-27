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
    var argumentDefinition: Array<ArgumentDefinition> = new Array<ArgumentDefinition>();

    public function getName(){ return ""; }

    public function addOptionDefinition(def: OptionDefinition){ optionDefinitions.push(def); }

    public function addValueDefinition(def: ValueDefinition){ valueDefinitions.push(def); }

    public function addArgumentDefinition(def: ArgumentDefinition) { argumentDefinition.push(def); }

    public function getOptionDefinitions(){ return optionDefinitions; }

    public function getValueDefinitions(){ return valueDefinitions; }
    
    public function getArgumentDefinitions(){ return argumentDefinition; }

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

    public final function execute(app: CliApp, values: Array<String>, options: ParsedOptions, ?args: Array<ArgumentDefinition>){
        if (values.length != valueDefinitions.length)
            printCommandHelp(app);
        onExecuted(app, values, options);
    }

    public function printCommandHelp(app: CliApp) {}

    public function onExecuted(app, value, options){}
}