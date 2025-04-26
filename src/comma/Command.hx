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

    public final function execute(app:CliApp,values: Array<String>, options:ParsedOptions){
        if (values.length != valueDefinitions.length)
        {
            app.println("Usage:");
            var help = Table.create()
                .addRow()
                .addColumn(getName())
                .addEmptyColumn(8)
                .addColumn(getDescription()).toString();

            app.println(help);
            return;
        }
        onExecuted(app, values, options);
    }

    function onExecuted(app, value, options){}
}