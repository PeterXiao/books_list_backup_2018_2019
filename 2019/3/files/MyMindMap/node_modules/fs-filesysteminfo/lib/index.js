
/*
 *  fs-filesysteminfo
 *  https://github.com/cookch10/node-fs-filesysteminfo
 *
 *  Copyright (c) 2016 Christopher M. Cook
 *  Licensed under the MIT license.
 */

(function() {
  "use strict";
  var IO;

  IO = require("./fs-filesysteminfo.js").Util.System.IO;

  exports.FileSystemInfo = IO.FileSystemInfo;

  exports.DirectoryInfo = IO.DirectoryInfo;

  exports.FileInfo = IO.FileInfo;

}).call(this);
