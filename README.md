![alt text](assets/luvi-banner.png)

# Luvi Toolkit

A Command Line Interface (CLI) toolkit for [Love2D](https://love2d.org)

## Features

Luvi provides a simples yet powerful CLI to help manage your love projects

* Create projects from a template with a lot of configurations and pre made code.
* Add or remove libraries as you need
* Local library database
* Share you projects with other and install the dependencies easily

### The template

By default the template comes structured to be builded with [lover](https://github.com/Wolfyxon/lover?tab=readme-ov-file) and also comes with a blank library folder, where it can be controlled by the `.luvi` file that are inside the template folder.



This file is responsible to keep track of every single dependency you installed on your project. Similar as a `package.json`.

### A luvi file spec

A `.luvi` file is a simple JSON object that contains all the metadata responsible to keep track of the project dependencies

* `version`: The file version
* `dependencies`: The actual core of this file, contains data of each library.

```json
{
    "version": "0.0.1",
    "dependencies": [
        {
            "name": "libname",
            "author": "authorname",
            "url": "urlhere",
            "git": {
                "branch": "master"
            }
        }
    ]
}
```
## Build

This section explain how to build the app

### Windows
* Install `MSVC Build tools x86-64` and `Windows 10/11 SDK`. You can find it oon Visual Studio Community 2022
* Install `HXCPP` with `haxelib install hxcpp`
* run `haxe build.hxml`