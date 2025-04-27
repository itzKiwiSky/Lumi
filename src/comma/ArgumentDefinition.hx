package comma;

class ArgumentDefinition 
{
    public var name = "";
    public var description: String = "";
    public function new(name:String, description: String)
    {
        this.description = description;
        this.name = name;
    }

    public function getName() { return name; }
    public function getDescription() { return description; }
}