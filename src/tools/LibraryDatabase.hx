package tools;

import sys.io.FileOutput;
import sys.FileSystem;
import haxe.ds.StringMap;
import haxe.io.Bytes;
import sys.io.File;
import haxe.Json;
import tools.Paths;

class LibraryDatabase 
{
    public static var database: StringMap<Dynamic> = new StringMap<Dynamic>();
    public static function getDBContent() 
    {
        // dump the database.json content to internal controller //
        var path: String = Paths.getAppDataPath(Main.appsign);
        var jsondata: Dynamic = Json.parse(File.read(path + "/database.json", false).readAll().toString());
        
        for (field in Reflect.fields(jsondata))
            database.set(field, Reflect.field(jsondata, field));
    }

    public static function saveDBContent() 
    {
        var path: String = Paths.getAppDataPath(Main.appsign);
        if (FileSystem.exists(path + "/database.json"))
        {
            //var dbfile:FileOutput = File.write(path + "/database.json", false);
            //dbfile.write(Bytes.ofString("{}"));
            //dbfile.close();

            File.saveContent(path + "/database.json", Json.stringify(database));
        }
    }
}