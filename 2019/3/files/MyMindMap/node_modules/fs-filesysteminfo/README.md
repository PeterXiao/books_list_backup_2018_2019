# fs-filesysteminfo [![Build Status](https://secure.travis-ci.org/cookch10/node-fs-filesysteminfo.png?branch=master)](http://travis-ci.org/cookch10/node-fs-filesysteminfo)

The fs-filesysteminfo module, fsi, wraps the native [Node.js](http://nodejs.org) File System and Path API into a File System Object (FSO) model, which facilitates an object-based approach for working with directories and files.  Inspired by the .NET file system libraries.


## Getting Started

Install the module with: `npm install fs-filesysteminfo --save`

## Overview

The fs-filesysteminfo NodeJS module, fsi , exposes three classes (objects) for working with the filesystem: `FileSystemInfo`, `DirectoryInfo`, and `FileInfo`.
`DirectoryInfo` and `FileInfo` are subclasses of the `FileSystemInfo` class, both expose instance methods for working with directories and files, respectively.

All fsi objects are instantiated with a `path` {String}.  An exception is thrown if the `path` length is zero or if `path` is `null` or `undefined`.
A `path` used to construct the object can be relative or absolute, and the path does not need to exist.  If a relative `path` is used, it will be resolved
relative to the current `process.cwd()`.


## Usage
```javascript
var fsi = require('fs-filesysteminfo');
```


## Class: FileSystemInfo

The base class for the `FileInfo` and `DirectoryInfo` objects.  Create a `FileSystemInfo` object by instantiating the fsi `FileSystemInfo` class.


### Constructor: FileSystemInfo(`path`)

`path` {String} A string specifying the path on which to create the `FileSystemInfo` object.  

```javascript
var fsiObj = new fsi.FileSystemInfo('temp');  //If temp is an existing file or directory then fsiObj.exists === true otherwise false
```


### Properties: FileSystemInfo

| Name                  | Type                    | Description                                                                                                                                                                                                                                                            |
|-----------------------|-------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| originalPath          | {String}                | The value that was used to construct the object.                                                                                                                                                                                                                       |
| fullName              | {String}                | Gets the full path of the directory or file.                                                                                                                                                                                                                           |
| name                  | {String}                | Gets the last portion of a path. Similar to the Unix basename command.                                                                                                                                                                                                 |
| extension             | {String}                | Gets the extension of the path, from the last &#x0027;.&#x0027; to end of string in the last portion of the path. If there is no &#x0027;.&#x0027; in the last portion of the path or the first character of it is &#x0027;.&#x0027;, then it returns an empty string. |
| status                | {Object}                | An object composed of properties specific to the `FileSystemInfo` instance. This information is obtained by using Node&#x0027;s `fs.statSync` method.                                                                                                                  |
| flags                 | {Object}                | An object containing the following {Boolean} properties:  `isDirectory`, `isFile`, `isBlockDevice`, `isCharacterDevice`, `isFIFO`, `isSocket`, and `isSymbolicLink`.                                                                                                   |
| exists                | {Boolean}               | Gets a value indicating whether the directory or file exists.                                                                                                                                                                                                          |
| fileSystemPermissions | {FileSystemPermissions} | An object that contains information about the permissions (file system) of the current `FileSystemInfo` instance.                                                                                                                                                      |


### Methods: FileSystemInfo

| Name    | Type     | Description                                    |
|---------|----------|------------------------------------------------|
| getType | {String} | Returns the type name of the current instance. |
| refresh | void     | Refreshes the state of the current instance.   |


### Remarks: FileSystemInfo

To determine if the `FileSystemInfo` instance is a file or a directory, use the following:
```javascript
if (fsiObj.exists) {
    var fflags = fsiObj.flags
    var isDirecory = fflags.isDirectory;
    var isFile = fflags.isFile;
}
```


## Class: DirectoryInfo

Create a DirectoryInfo object by instantiating the fsi `DirectoryInfo` class.


### Constructor: DirectoryInfo(`path`)

`path` {String} A string specifying the path on which to create the DirectoryInfo object.  

```javascript
var fsiObj = new fsi.DirectoryInfo('temp');  //If temp is an existing directory then fsiObj.exists === true otherwise false
```


### Properties: DirectoryInfo

| Name   | Type            | Description                                        |
|--------|-----------------|----------------------------------------------------|
| parent | {DirectoryInfo} | Gets the parent directory of the current instance. |


### Methods: DirectoryInfo

| Name                                                                       | Type                          | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    | Remarks                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
|----------------------------------------------------------------------------|-------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| create([mode], callback)                                                   | void                          | Creates the directory if it does not already exist.  `mode` defaults to the octal representation `0777`.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       | `callback`: {Function} `(error, result)` where `result` is the `DirectoryInfo` instance and `this` in the `callback` context is equal to the original `DirectoryInfo` instance that invoked the `create()` method.<br /><br />`mode`: a {String} or a non-octal {Integer} (an octal representation) (e.g. '777', 777, and '0777' are all equivalent however, 0777 is <b>not</b>).  `mode` is automatically converted to the proper integer equivalent (e.g. '777' will become 511) before it is passed on to native Node filesystem methods. |
| createSync([mode])                                                         | {DirectoryInfo}               | Synchronous version of `create()`.  Returns the calling {DirectoryInfo} instance.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| createSubdirectory(path, [mode], callback)                                 | void                          | Creates a subdirectory or subdirectories on the specified `path` if it does not exist.  The specified `path` is relative to the current instance.  `mode` defaults to `0777`.<br /><br /> If multiple paths are specified (via path separator), and they do not exist, they will be created.  Example: /tmp/test1/test2                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        | `callback`: {Function} `(error, result)` where `result` is the `DirectoryInfo` instance of the deepest subdirectory and `this` in the `callback` context is equal to the original `DirectoryInfo` instance that invoked the `createSubdirectory()` method.<br /><br />`callback` is called upon creation of the deepest subdirectory.                                                                                                                                                                                                        |
| createSubdirectorySync(path, [mode])                                       | {DirectoryInfo}               | Synchronous version of `createSubdirectory()`.<br /><br />Returns a new `DirectoryInfo` instance of the deepest subdirectory.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  | An exception is thrown if the `path` length is zero or if `path` is `null` or `undefined`.                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| delete([recursive], callback)                                              | void                          | Permanently deletes the instance directory.  If `recursive` is true, the directory and all its contents are deleted.  If `recursive` is `false` and the directory is not empty, an exception is thrown.  `recursive` defaults to `false`.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      | `callback`: {Function} `(error)` where `this` in the `callback` context is equal to the original `DirectoryInfo` instance that invoked the `delete()` method.<br /><br />`callback` is called once the directory (and optionally its contents) are deleted.                                                                                                                                                                                                                                                                                  |
| deleteSync([recursive])                                                    | void                          | Synchronous version of `delete()`.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             | If `recursive` is `false` and the directory is not empty, an exception is thrown.  `recursive` defaults to `false`.                                                                                                                                                                                                                                                                                                                                                                                                                          |
| enumerateFileSystemInfos({opts}, callback)                                 | void                          | Iterates the contents of the current `DirectoryInfo` instance.<br /><br />`opts` is an object that utilizes the following properties: `opts.fnFilter`: a {Function(`fsname`)} that determines whether the current item in the enumeration is included in the output {Array} if the function evaluates to `true` where `fsname` is the name of the current filesystem item.<br /><br />`opts.recursive`: a {Boolean} that indicates whether subdirectories will be recursively searched.  The default value is `false`.                                                                                                                                                                                                                                                                                                                                                                                                   | `callback`: {Function} `(error, result)` where `result` is an `Array<FileSystemInfo>` ({DirectoryInfo} and/or {FileInfo} objects comprised of the instance directory contents) and `this` in the `callback` context is equal to the original `DirectoryInfo` instance that invoked the `enumerateFileSystemInfos()` method.<br /><br />`callback` is called after all items have been iterated.                                                                                                                                              |
| enumerateFileSystemInfosSync({opts})                                       | {Array&lt;FileSystemInfo&gt;} | Synchronous version of `enumerateFileSystemInfos()`.<br /><br />Returns an {Array} of {DirectoryInfo} and/or {FileInfo} objects comprised of the current directory contents.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |

### Remarks: DirectoryInfo
Look for additional methods to be added in future releases.

create a subdirectory from a `DirectoryInfo` instance:
```javascript
var fsiObj = new fsi.DirectoryInfo('currentDir');
var subDir = fsiObj.createSubdirectorySync('subDir','777'); //Create a subdirectory with readable, writable, and executable permissions
```

Enumeration examples:
```javascript
var fsiObj = new fsi.DirectoryInfo('currentDir');
var directoryContentsArr1 = fsiObj.enumerateFileSystemInfosSyncSync({fnFilter: '', recursive: true}); //Return all filesystem objects (recursively including all subdirectories and files)
var directoryContentsArr2 = fsiObj.enumerateFileSystemInfosSync({fnFilter: function (fsname) { return /^\..*$/.test(fsname); }, recursive: true}); //Return all filesystem objects (recursively including all subdirectories and files) whose name starts with a dot (.)
var pathnamesArr = directoryContentsArr2.map(function (e) { return e.fullName; }); //Generate an array of absolute paths
```


## Class: FileInfo

Create a FileInfo object by instantiating the fsi `FileInfo` class.


### Constructor: FileInfo(`path`)

`path` {String} A string specifying the path on which to create the FileInfo object.  

```javascript
var fsiObj = new fsi.FileInfo('temp');  //If temp is an existing file then fsiObj.exists === true otherwise false
```


### Properties: FileInfo

| Name   | Type            | Description                                        |
|--------|-----------------|----------------------------------------------------|
| parent | {DirectoryInfo} | Gets the parent directory of the current instance. |


### Methods: FileInfo

| Name                     | Type       | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  | Remarks                                                                                                                                                                                                                                                                                                                      |
|--------------------------|------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| create([opts], callback) | void       | Creates a zero byte (empty) file. `opts` is an object with the following defaults: { `ensure`:`false`, `mode`:`'777'`, overwrite: `true` }.<br /><br />`mode`: the file mode, a {String} or a non-octal {Integer} (an octal representation) (e.g. '777', 777, and '0777' are all equivalent however, 0777 is <b>not</b>).<br /><br />If `ensure` is `true` and the destination directory does not exist, the directory will be created.<br /><br />If `overwrite` is `true` and the destination file already exists, it will be overwritten. | `callback`: {Function} `(error)` where `this` in the `callback` context is equal to the original `FileInfo` instance that invoked the `create()` method.<br /><br />`mode` is automatically converted to the proper integer equivalent (e.g. '777' will become 511) before it is passed on to native Node filesystem method. |
| createSync([opts])       | {FileInfo} | Synchronous version of `create()`.  Returns the calling {FileInfo} instance.                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |                                                                                                                                                                                                                                                                                                                              |
| delete()                 | void       | Permanently deletes the instance file.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       | `callback`: {Function} `(error)` where `this` in the `callback` context is equal to the original `FileInfo` instance that invoked the `delete()` method.                                                                                                                                                                     |
| deleteSync()             | void       | Synchronous version of `delete()`.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |                                                                                                                                                                                                                                                                                                                              |

### Remarks: FileInfo
Look for additional methods to be added in future releases.


## Class (Private): FileSystemPermissions

A class that contains properties related to roles and each roles' (file system) permissions for directories and files.  This class is scoped within the context of the library (private) and is not exposed via exports.


### Properties: FileSystemPermissions

| Name                      | Type                    | Description                                                                                                                                                                                                                                                            |
|---------------------------|-------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| owner                     | {Object}                | The file system permissions specific to the `owner` role.  `canRead`, `canWrite`, and `canExecute` (all of `Boolean` type).                                                                                                                                            |
| group                     | {Object}                | The file system permissions specific to the `group` role.  `canRead`, `canWrite`, and `canExecute` (all of `Boolean` type).                                                                                                                                            |
| otherUsers                | {Object}                | The file system permissions specific to the `otherUsers` role.  `canRead`, `canWrite`, and `canExecute` (all of `Boolean` type).                                                                                                                                       |
| octalFileSystemModeString | {String}                | A valid file system octal string representation.  Examples of valid values include: `0777`, `777`, `0`, `466`, etc.                                                                                                                                                    |


### Methods: FileSystemPermissions

| Name                             | Type     | Description                                                  |
|----------------------------------|----------|--------------------------------------------------------------|
| getType                          | {String} | Returns the type name of the current instance.               |
| refresh                          | void     | Refreshes the state of the current instance.                 |
| toRoleBinaryRepresentationString | {String} | Returns the binary representation of the permissions string. |
| toRoleLetterRepresentationString | {String} | Returns the 9 bit Linux-style permissions string.            |

### Remarks: FileSystemPermissions

Given the following:
```javascript
var fsiObj = new _fsi.DirectoryInfo('./tmp'); // an existing directory to create new subdirectories with varying permissions

var subdirectoryArr = [
    { name: 'tmp1', mode: '777' },
    { name: 'tmp2', mode: '775' },
    { name: 'tmp3', mode: '666' },
    { name: 'tmp4', mode: '444' }
];

subdirectoryArr.forEach(function (subdirectory) {
    var newSubdirectory = fsiObj.createSubdirectorySync(subdirectory.name, subdirectory.mode);

    var nsp = newSubdirectory.fileSystemPermissions;

    nsp['subdirectoryName', subdirectory.name];

    nsp['toRoleBinaryRepresentationString()'] = nsp.toRoleBinaryRepresentationString();

    nsp['toRoleLetterRepresentationString()'] = nsp.toRoleLetterRepresentationString();

    var outputResult = JSON.stringify(nsp);

    console.log('\n' + outputResult + '\n');
});
```

The resulting output is:
```javascript
{
    "subdirectoryName": "tmp1",
    "octalFileSystemModeString": "0777",
    "owner": { "canRead": true, "canWrite": true, "canExecute": true, "letterFormat": "rwx", "binaryFormat": "111" },
    "group": { "canRead": true, "canWrite": true, "canExecute": true, "letterFormat": "rwx", "binaryFormat": "111" },
    "otherUsers": { "canRead": true, "canWrite": true, "canExecute": true, "letterFormat": "rwx", "binaryFormat": "111" },
    "toRoleBinaryRepresentationString()": "111111111",
    "toRoleLetterRepresentationString()": "rwxrwxrwx"
}
{
    "subdirectoryName": "tmp2",
    "octalFileSystemModeString": "0775",
    "owner": { "canRead": true, "canWrite": true, "canExecute": true, "letterFormat": "rwx", "binaryFormat": "111" },
    "group": { "canRead": true, "canWrite": true, "canExecute": true, "letterFormat": "rwx", "binaryFormat": "111" },
    "otherUsers": { "canRead": true, "canWrite": false, "canExecute": true, "letterFormat": "r-x", "binaryFormat": "101" },
    "toRoleBinaryRepresentationString()": "111111101",
    "toRoleLetterRepresentationString()": "rwxrwxr-x"
}
{
    "subdirectoryName": "tmp3",
    "octalFileSystemModeString": "0666",
    "owner": { "canRead": true, "canWrite": true, "canExecute": false, "letterFormat": "rw-", "binaryFormat": "110" },
    "group": { "canRead": true, "canWrite": true, "canExecute": false, "letterFormat": "rw-", "binaryFormat": "110" },
    "otherUsers": { "canRead": true, "canWrite": true, "canExecute": false, "letterFormat": "rw-", "binaryFormat": "110" },
    "toRoleBinaryRepresentationString()": "110110110",
    "toRoleLetterRepresentationString()": "rw-rw-rw-"
}
{
    "subdirectoryName": "tmp4",
    "octalFileSystemModeString": "0444",
    "owner": { "canRead": true, "canWrite": false, "canExecute": false, "letterFormat": "r--", "binaryFormat": "100" },
    "group": { "canRead": true, "canWrite": false, "canExecute": false, "letterFormat": "r--", "binaryFormat": "100" },
    "otherUsers": { "canRead": true, "canWrite": false, "canExecute": false, "letterFormat": "r--", "binaryFormat": "100" },
    "toRoleBinaryRepresentationString()": "100100100",
    "toRoleLetterRepresentationString()": "r--r--r--"
}
```

*** *** ***


## TODO
* Continue adding functionality and tests.
* Add a DirectoryInfo.clean() and cleanSync() method to remove directory content without removing the directory itself.

## Contributing

In lieu of a formal styleguide, take care to maintain the existing coding style. **Add unit tests** for any new or changed functionality. Lint and test your code using [Grunt](http://gruntjs.com).


## License

Copyright (c) 2016 Christopher M. Cook  
Licensed under the MIT license.
