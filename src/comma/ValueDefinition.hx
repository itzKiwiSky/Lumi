package comma;

class ValueDefinition
{
    public var name = "";
    public var description: String = "";
    public var required: Bool = false;
    public function new(name:String, description: String, ?required: Bool = false)
    {
        this.required = required;
        this.description = description;
        this.name = name;
    }

    public function getName() { return name; }
    public function getDescription() { return description; }
}
