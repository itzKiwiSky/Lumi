package tools;

import haxe.io.Bytes;
import sys.io.FileOutput;
import sys.io.File;
import sys.FileSystem;
import tools.Paths;

class SetupConfig 
{
    public static function setup() 
    {
        var savePath: String = Paths.getAppDataPath(Main.appsign);
        if (!FileSystem.exists(savePath + "/libraries"))
            FileSystem.createDirectory(savePath + "/libraries");

        if (!FileSystem.exists(savePath + "/temp"))
            FileSystem.createDirectory(savePath + "/temp");

        if (!FileSystem.exists(savePath + "/database.json"))
        {
            var dbfile:FileOutput = File.write(savePath + "/database.json", false);
            dbfile.write(Bytes.ofString("{}"));
            dbfile.close();
        }
    }
}