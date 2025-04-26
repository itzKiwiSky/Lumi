package tools;

import sys.FileSystem;
import sys.io.File;
import haxe.io.BytesInput;
import haxe.zip.Reader;
import haxe.Resource;

class CreateTemplate 
{
    public static function create(dest: String, verbose: Bool = false)
    {
        var bytes = Resource.getBytes("template");
        //var zip = new haxe.zip.Reader(new haxe.io.BytesInput(bytes));
        var entries = Reader.readZip(new BytesInput(bytes));

        if (!FileSystem.exists(dest))
            FileSystem.createDirectory(dest);

        for (entry in entries)
        {
            var fileName: String = entry.fileName;
            if (fileName.charAt (0) != "/" && fileName.charAt (0) != "\\" && fileName.split ("..").length <= 1)
            {
                var dirs = ~/[\/\\]/g.split(fileName);

                var path = "";
                var file = dirs.pop();
                for( d in dirs ) 
                {
                    path += d;
                    sys.FileSystem.createDirectory(dest + "/" + path);
                    path += "/";
                }

                if( file == "" ) 
                {
                    if( path != "" ) 
                        if (verbose)
                            Sys.println("created " + path);
                    continue; // was just a directory
                }
                path += file;
                if (verbose)
                    Sys.println("unzip " + path);

                var data = haxe.zip.Reader.unzip(entry);
                var f = File.write (dest + "/" + path, true);
                f.write(data);
                f.close();
            }
        }
    }
}