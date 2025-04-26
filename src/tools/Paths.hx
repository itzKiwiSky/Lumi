package tools;

import sys.io.File;
import sys.FileSystem;

class Paths 
{
    public static function getAppDataPath(appName:String):String 
    {
        var env = Sys.systemName();
        var base:String;
        
        switch (env) 
        {
            case "Windows":
                base = Sys.getEnv("APPDATA");
                if (base == null) base = Sys.getEnv("LOCALAPPDATA");
                if (base == null) base = "C:\\Users\\" + Sys.getEnv("USERNAME") + "\\AppData\\Roaming";
            case "Mac":
                base = Sys.getEnv("HOME") + "/Library/Application Support";
            case "Linux":
                base = Sys.getEnv("HOME") + "/.config";
            default:
                throw "Sistema não suportado: " + env;
        }

        var fullPath = base + "/" + appName;
        
        if (!FileSystem.exists(fullPath))
            FileSystem.createDirectory(fullPath);
        
        return fullPath;
    }
}
