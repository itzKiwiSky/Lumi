package cli;

class Args 
{
    public var name: String = "";
    public var description: String = "";
    public var required: Bool;

    public function new(name: String, description: String, ?required: Bool = false)
    {
        this.name = name;
        this.description = description;
    }
}