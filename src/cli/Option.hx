package cli;

class Option 
{
    public var name: String = "";
    public var description: String = "";

    public function new(name: String, description: String)
    {
        this.name = name;
        this.description = description;
    }
}