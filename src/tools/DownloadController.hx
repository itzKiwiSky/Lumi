package tools;

import haxe.Timer;
import haxe.io.Output;
import haxe.io.Input;
import haxe.io.Bytes;
import haxe.Http;
import sys.io.File;

typedef DownloadProgress = (finished:Bool, cur:Int, max:Null<Int>, downloaded:Int, time:Float) -> Void;

private class ProgressOut extends Output 
{
    final o:Output;
    final startSize:Int;
    final start:Float;

    var cur:Int;
    var max:Null<Int>;

    public function new(o, currentSize, progress)
    {
        start = Timer.stamp();
        this.o = o;
        startSize = currentSize;
        cur = currentSize;
        this.progress = progress;
    }

    dynamic function progress(finished:Bool, cur:Int, max:Null<Int>, downloaded:Int, time:Float):Void {}

    function report(n) 
    {
        cur += n;

        progress(false, cur, max, cur - startSize, Timer.stamp() - start);
    }

    public override function writeByte(c) 
    {
        o.writeByte(c);
        report(1);
    }

    public override function writeBytes(s, p, l) 
    {
        final r = o.writeBytes(s, p, l);
        report(r);
        return r;
    }

    public override function close() 
    {
        super.close();
        o.close();

        progress(true, cur, max, cur - startSize, Timer.stamp() - start);
    }

    public override function prepare(m) { max = m + startSize; }
}

private class ProgressIn extends Input 
{
    final i:Input;
    final tot:Int;

    var pos:Int;

    public function new(i, tot, progress) 
    {
        this.i = i;
        this.pos = 0;
        this.tot = tot;
        this.progress = progress;
    }

    dynamic function progress(pos:Int, total:Int):Void {}

    public override function readByte() 
    {
        final c = i.readByte();
        report(1);
        return c;
    }

    public override function readBytes(buf, pos, len) 
    {
        final k = i.readBytes(buf, pos, len);
        report(k);
        return k;
    }

    function report(nbytes:Int) 
    {
        pos += nbytes;
        progress(pos,tot);
    }
}

class DownloadController 
{
    public static function downloadFromUrl(url: String, path: String): Void
    {
        final outfile = try File.append(path, true) catch (err: Dynamic) throw 'Failed to write to $path: $err';
        outfile.seek(0, SeekEnd);

        var http = new Http(url);
        http.addHeader("User-Agent", "luvi");

        var httpStatus: Int = -1;
        var redirectUrlLocation: Null<String> = null;
        
        http.onStatus = function(status: Int)
        {
            httpStatus = status;
            switch (status)
            {
                case 301, 302, 307, 308:
                    switch (http.responseHeaders.get("Location"))
                    {
                        case null:
                            throw 'Request to $url responded with $httpStatus, ${http.responseHeaders}';
                        case location:
                            redirectUrlLocation = location;
                    }
            }
        }

        http.onBytes = function(data: Bytes)
        {
            outfile.write(data);
            outfile.close();
        }

        http.onError = function(err)
        {
            trace(err);
        }

        http.request();

        if (redirectUrlLocation == null)
            return;

        downloadFromUrl(redirectUrlLocation, path);
    }
}