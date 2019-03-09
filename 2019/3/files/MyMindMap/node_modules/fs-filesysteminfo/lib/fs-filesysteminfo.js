
/*
 *  fs-filesysteminfo
 *  https://github.com/cookch10/node-fs-filesysteminfo
 *
 *  Copyright (c) 2016 Christopher M. Cook
 *  Licensed under the MIT license.
 */

(function() {
  var isBoolean, isFunction, isNullOrUndefined, isObject, isString, k, namespace, newmask, oldmask, thisNamespaceObjectContainer, toIntegerFromOctalRepresenation, toOctalStringFromIntegerRepresenation, v, _child, _exec, _fs, _path, _root,
    __slice = [].slice,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  _root = typeof exports !== "undefined" && exports !== null ? exports : this;

  _path = require('path');

  _fs = require('fs');

  _exec = require('child_process').exec;

  _child = null;

  oldmask = void 0;

  newmask = 0;

  oldmask = process.umask(newmask);

  thisNamespaceObjectContainer = {};

  if (!String.prototype.equals) {
    String.prototype.equals = function(str, ignoreCase) {
      ignoreCase = typeof ignoreCase === 'boolean' ? ignoreCase : false;
      return typeof str === 'string' ? (ignoreCase ? this.toLowerCase() === str.toLowerCase() : this === str) : false;
    };
  }

  isObject = function(obj) {
    return typeof obj === 'object';
  };

  isFunction = function(obj) {
    return typeof obj === 'function';
  };

  isBoolean = function(obj) {
    return typeof obj === 'boolean';
  };

  isString = function(obj) {
    return typeof obj === 'string';
  };

  isNullOrUndefined = function(obj) {
    return typeof obj === 'undefined' || obj === null;
  };

  toIntegerFromOctalRepresenation = function(obj) {
    var integerFromOctal;
    if (obj == null) {
      obj = '';
    }
    integerFromOctal = parseInt(obj, 8);
    if (isNaN(integerFromOctal)) {
      return null;
    } else {
      return integerFromOctal;
    }
  };

  toOctalStringFromIntegerRepresenation = function(obj) {
    var octalStringFromInteger;
    if (obj == null) {
      obj = '';
    }
    octalStringFromInteger = '0' + (obj & parseInt('07777', 8)).toString(8);
    if (octalStringFromInteger === '00') {
      return '';
    } else {
      return octalStringFromInteger;
    }
  };

  namespace = function(target, name, block) {
    var item, key, objectNamespaceContainer, top, value, _i, _len, _ref, _ref1, _results;
    objectNamespaceContainer = (arguments.length === 4 ? Array.prototype.slice.call(arguments).shift() : null);
    if (arguments.length < 3) {
      _ref = [(typeof exports !== 'undefined' ? exports : _root)].concat(__slice.call(arguments)), target = _ref[0], name = _ref[1], block = _ref[2];
    }
    top = target;
    _ref1 = name.split('.');
    for (_i = 0, _len = _ref1.length; _i < _len; _i++) {
      item = _ref1[_i];
      target = target[item] || (target[item] = {});
    }
    block(target, top);
    _results = [];
    for (key in target) {
      if (!__hasProp.call(target, key)) continue;
      value = target[key];
      _results.push(value.prototype.___typeName___ = key);
    }
    return _results;
  };

  namespace(thisNamespaceObjectContainer, 'Util.System.IO', function(exports) {
    var DEFAULT_FILESYSTEM_CREATION_MODE, FileSystemPermissions;
    DEFAULT_FILESYSTEM_CREATION_MODE = '777';
    exports.Base = (function() {
      function Base() {}

      Base.prototype.getType = function() {
        return this.___typeName___ || this.constructor.name;
      };

      Base.prototype.toString = function() {
        return this.getType().toString();
      };

      return Base;

    })();
    FileSystemPermissions = (function(_super) {
      __extends(FileSystemPermissions, _super);

      function FileSystemPermissions(octalFileSystemModeString) {
        var CONST_BINARYFORMAT_ARR, CONST_LETTERFORMAT_ARR, fnGetPermissionObj, updateRolePermissions, _group, _octalFileSystemModeString, _otherUsers, _owner;
        this.octalFileSystemModeString = octalFileSystemModeString != null ? octalFileSystemModeString : '';
        CONST_LETTERFORMAT_ARR = ['---', '--x', '-w-', '-wx', 'r--', 'r-x', 'rw-', 'rwx'];
        CONST_BINARYFORMAT_ARR = ['000', '001', '010', '011', '100', '101', '110', '111'];
        fnGetPermissionObj = function(intPermissionString) {
          var defaultObj, intPermission;
          intPermission = parseInt(intPermissionString) || 0;
          defaultObj = {
            canRead: false,
            canWrite: false,
            canExecute: false,
            letterFormat: CONST_LETTERFORMAT_ARR[intPermission],
            binaryFormat: CONST_BINARYFORMAT_ARR[intPermission]
          };
          if (intPermission) {
            switch (intPermission) {
              case 7:
                defaultObj.canRead = true;
                defaultObj.canWrite = true;
                defaultObj.canExecute = true;
                break;
              case 6:
                defaultObj.canRead = true;
                defaultObj.canWrite = true;
                break;
              case 5:
                defaultObj.canRead = true;
                defaultObj.canExecute = true;
                break;
              case 4:
                defaultObj.canRead = true;
                break;
              case 3:
                defaultObj.canWrite = true;
                defaultObj.canExecute = true;
                break;
              case 2:
                defaultObj.canWrite = true;
                break;
              case 1:
                defaultObj.canExecute = true;
                break;
            }
          }
          return Object.freeze(defaultObj);
        };
        _owner = {
          name: 'owner',
          value: fnGetPermissionObj()
        };
        Object.defineProperty(this, '' + _owner.name + '', {
          get: function() {
            return _owner.value;
          },
          configurable: true,
          enumerable: true
        });
        this.owner = _owner.value;
        _group = {
          name: 'group',
          value: fnGetPermissionObj()
        };
        Object.defineProperty(this, '' + _group.name + '', {
          get: function() {
            return _group.value;
          },
          configurable: true,
          enumerable: true
        });
        this.group = _group.value;
        _otherUsers = {
          name: 'otherUsers',
          value: fnGetPermissionObj()
        };
        Object.defineProperty(this, '' + _otherUsers.name + '', {
          get: function() {
            return _otherUsers.value;
          },
          configurable: true,
          enumerable: true
        });
        this.otherUsers = _otherUsers.value;
        updateRolePermissions = function(octalString) {
          var i, octal, octalArr, permission, role, _i, _len;
          octalString = octalString ? octalString.toString() : '000';
          octalString = octalString.length === 4 ? octalString.substring(1) : octalString;
          octalArr = octalString.split('');
          for (i = _i = 0, _len = octalArr.length; _i < _len; i = ++_i) {
            octal = octalArr[i];
            role = i === 0 ? _owner : i === 1 ? _group : _otherUsers;
            permission = fnGetPermissionObj(octal);
            role.value = permission;
          }
          return octalString;
        };
        _octalFileSystemModeString = {
          name: 'octalFileSystemModeString',
          value: this.octalFileSystemModeString
        };
        Object.defineProperty(this, '' + _octalFileSystemModeString.name + '', {
          get: function() {
            return _octalFileSystemModeString.value;
          },
          set: function(value) {
            var _value;
            _value = value && isString(value) && /^(?:0|0?[0-7]{3})$/g.test(value) ? value : '';
            updateRolePermissions(_value);
            return _octalFileSystemModeString.value = value;
          },
          configurable: true,
          enumerable: true
        });
        this.octalFileSystemModeString = _octalFileSystemModeString.value;
      }

      FileSystemPermissions.prototype.toRoleLetterRepresentationString = function() {
        return this.owner.letterFormat + this.group.letterFormat + this.otherUsers.letterFormat;
      };

      FileSystemPermissions.prototype.toRoleBinaryRepresentationString = function() {
        return this.owner.binaryFormat + this.group.binaryFormat + this.otherUsers.binaryFormat;
      };

      return FileSystemPermissions;

    })(exports.Base);
    exports.FileSystemInfo = (function(_super) {
      __extends(FileSystemInfo, _super);

      function FileSystemInfo(originalPath) {
        var init, _emptyStatusObj, _exists, _extension, _fileSystemPermissions, _flags, _fullName, _initialized, _name, _originalPath, _status;
        this.originalPath = originalPath;
        this.refresh = __bind(this.refresh, this);
        _initialized = false;
        _emptyStatusObj = (function() {
          var DEFAULT_DATETIME_ATTRIBUTE_VALUE, emptyStatsObj, ex, k, kValue;
          DEFAULT_DATETIME_ATTRIBUTE_VALUE = new Date(-11644412400000);
          if (!_initialized) {
            emptyStatsObj = {};
            try {
              emptyStatsObj = _fs.statSync(process.cwd());
            } catch (_error) {
              ex = _error;
              emptyStatsObj = {};
            } finally {
              for (k in emptyStatsObj) {
                kValue = /time$/i.test(k) ? DEFAULT_DATETIME_ATTRIBUTE_VALUE : 0;
                emptyStatsObj[k] = kValue;
              }
            }
            return emptyStatsObj;
          }
        })();
        _originalPath = {
          name: 'originalPath',
          value: this.originalPath
        };
        Object.defineProperty(this, '' + _originalPath.name + '', {
          writable: false,
          value: _originalPath.value.length === 2 && _originalPath.value.charAt(1) === ':' ? '.' : _originalPath.value,
          configurable: false,
          enumerable: true
        });
        this.originalPath = _originalPath.value;
        _fullName = {
          name: 'fullName',
          value: _path.resolve(this.originalPath)
        };
        Object.defineProperty(this, '' + _fullName.name + '', {
          writable: false,
          value: _fullName.value,
          configurable: false,
          enumerable: true
        });
        this.fullName = _fullName.value;
        _name = {
          name: 'name',
          value: _path.basename(this.originalPath)
        };
        Object.defineProperty(this, '' + _name.name + '', {
          writable: false,
          value: _name.value,
          configurable: false,
          enumerable: true
        });
        this.name = _name.value;
        _extension = {
          name: 'extension',
          value: _path.extname(this.originalPath)
        };
        Object.defineProperty(this, '' + _extension.name + '', {
          writable: false,
          value: _extension.value,
          configurable: false,
          enumerable: true
        });
        this.extension = _extension.value;
        _flags = {
          name: 'flags',
          value: {
            isDirectory: false,
            isFile: false,
            isBlockDevice: false,
            isCharacterDevice: false,
            isFIFO: false,
            isSocket: false,
            isSymbolicLink: false
          }
        };
        Object.defineProperty(this, '' + _flags.name + '', {
          writable: false,
          value: _flags.value,
          configurable: false,
          enumerable: true
        });
        this.flags = _flags.value;
        _fileSystemPermissions = {
          name: 'fileSystemPermissions',
          value: new FileSystemPermissions()
        };
        Object.defineProperty(this, '' + _fileSystemPermissions.name + '', {
          get: function() {
            return _fileSystemPermissions.value;
          },
          configurable: true,
          enumerable: true
        });
        this.fileSystemPermissions = _fileSystemPermissions.value;
        _exists = {
          name: 'exists',
          value: false
        };
        Object.defineProperty(this, '' + _exists.name + '', {
          get: function() {
            this.refresh(_exists);
            return _exists.value;
          },
          configurable: true,
          enumerable: true
        });
        this.exists = _exists.value;
        _status = {
          name: 'status',
          value: null
        };
        Object.defineProperty(this, '' + _status.name + '', {
          get: function() {
            return _status.value;
          },
          set: function(value) {
            if (value == null) {
              value = _emptyStatusObj;
            }
            return _status.value = value;
          },
          configurable: true,
          enumerable: true
        });
        this.status = _status.value;
        init = (function() {
          if (!_initialized) {
            this.refresh(_exists);
          }
          if (!_initialized) {
            return _initialized = true;
          }
        }).apply(this);
      }

      FileSystemInfo.prototype.refresh = function(i) {
        var ex0, ex1, exists, fnContinue, isFile, isWin, mode, parentContentsArr, parentPath, status;
        if ((i != null ? i.value : void 0) != null) {
          exists = _fs.existsSync(this.fullName);
          if (exists) {
            i.value = true;
          } else {
            i.value = false;
            try {
              parentPath = _path.resolve("" + this.fullName, '..');
              if (!parentPath.equals(this.fullName, true)) {
                parentContentsArr = _fs.readdirSync(parentPath);
                if (parentContentsArr.indexOf(this.name) >= 0) {
                  i.value = true;
                }
              }
            } catch (_error) {
              ex0 = _error;
            }
          }
        }
        try {
          status = this.status = _fs.statSync(this.fullName);
          isWin = process.platform === 'win32';
          isFile = status.isFile();
          mode = status.mode;
          if (isWin) {
            mode = mode | ((mode & 146) >> 1);
          }
          fnContinue = (function(error, stdout, stderr) {
            var flags, fsPermissions, k, kAttrib, parent, parentFSPermissions, parentFSPermissionsOctalFileSystemModeString;
            fsPermissions = this.fileSystemPermissions;
            flags = this.flags;
            status = this.status;
            parent = this.parent;
            parentFSPermissions = parent != null ? parent.fileSystemPermissions : void 0;
            parentFSPermissionsOctalFileSystemModeString = parentFSPermissions ? parentFSPermissions.octalFileSystemModeString : '';
            if (arguments.length === 3) {
              if (!error) {
                fsPermissions.octalFileSystemModeString = '0' + stdout.trim();
              }
            } else {
              fsPermissions.octalFileSystemModeString = toOctalStringFromIntegerRepresenation(error);
            }
            for (k in flags) {
              kAttrib = status[k];
              if (isFunction(kAttrib)) {
                flags[k] = kAttrib.apply(status);
              }
            }
            if (parent && !parentFSPermissionsOctalFileSystemModeString) {
              parent.refresh();
            }
            return this;
          }).bind(this);
          if (!mode) {
            _child = _exec('stat -c "%a" ' + this.parent.fullName, fnContinue);
          } else {
            fnContinue(mode);
          }
        } catch (_error) {
          ex1 = _error;
          this.status = null;
        }
      };

      return FileSystemInfo;

    })(exports.Base);
    exports.DirectoryInfo = (function(_super) {
      __extends(DirectoryInfo, _super);

      function DirectoryInfo(originalPath) {
        this.enumerateFileSystemInfosSync = __bind(this.enumerateFileSystemInfosSync, this);
        this.enumerateFileSystemInfos = __bind(this.enumerateFileSystemInfos, this);
        this.deleteSync = __bind(this.deleteSync, this);
        this['delete'] = __bind(this['delete'], this);
        this.createSubdirectorySync = __bind(this.createSubdirectorySync, this);
        this.createSubdirectory = __bind(this.createSubdirectory, this);
        this.createSync = __bind(this.createSync, this);
        this.create = __bind(this.create, this);
        var _exists, _parent;
        if (isNullOrUndefined(originalPath) || originalPath.equals('')) {
          throw 'Path is null or undefined';
        }
        DirectoryInfo.__super__.constructor.call(this, originalPath);
        _exists = {
          name: 'exists',
          value: false
        };
        Object.defineProperty(this, '' + _exists.name + '', {
          get: function() {
            this.refresh(_exists);
            return _exists.value;
          },
          configurable: true,
          enumerable: true
        });
        this.exists = _exists.value;
        _parent = {
          name: 'parent',
          value: null
        };
        Object.defineProperty(this, '' + _parent.name + '', {
          get: function() {
            var parentPath;
            if (isNullOrUndefined(_parent.value)) {
              parentPath = _path.resolve("" + this.fullName, '..');
              _parent.value = new DirectoryInfo(parentPath);
            }
            return _parent.value;
          },
          configurable: true,
          enumerable: true
        });
        this.parent = _parent.value;
      }

      DirectoryInfo.prototype.create = function() {
        var cb, mode, _i;
        mode = 2 <= arguments.length ? __slice.call(arguments, 0, _i = arguments.length - 1) : (_i = 0, []), cb = arguments[_i++];
        if (!this.parent.exists) {
          this.parent.create(mode, cb);
        }
        if (!this.exists) {
          _fs.mkdir(this.fullName, toIntegerFromOctalRepresenation(mode), (function(error) {
            if (isNullOrUndefined(error)) {
              this.refresh();
            }
            if (isFunction(cb)) {
              return cb.call(this, error, this);
            }
          }).bind(this));
        } else {
          if (isFunction(cb)) {
            return cb.call(this, null, this);
          }
        }
      };

      DirectoryInfo.prototype.createSync = function(mode) {
        var ex, success;
        if (!this.parent.exists) {
          this.parent.createSync(mode);
        }
        if (!this.exists) {
          success = true;
          try {
            _fs.mkdirSync(this.fullName, toIntegerFromOctalRepresenation(mode));
          } catch (_error) {
            ex = _error;
            success = false;
          } finally {
            if (success) {
              this.refresh();
            } else {
              if (ex) {
                throw ex;
              }
            }
          }
        }
        return this;
      };

      DirectoryInfo.prototype.createSubdirectory = function() {
        var cb, mode, path, subdirectory, _i;
        path = arguments[0], mode = 3 <= arguments.length ? __slice.call(arguments, 1, _i = arguments.length - 1) : (_i = 1, []), cb = arguments[_i++];
        if (isNullOrUndefined(path) || path.equals('')) {
          throw 'Path is null or undefined';
        }
        path = _path.join(this.fullName, path);
        mode = Array.isArray ? mode[0] : mode;
        subdirectory = new DirectoryInfo(path);
        if (!subdirectory.exists) {
          subdirectory.create(mode, (function(context, error, result) {
            if (context === result) {
              if (isFunction(cb)) {
                return cb.call(this, error, result);
              }
            } else {
              return result;
            }
          }).bind(this, subdirectory));
        } else {
          if (isFunction(cb)) {
            cb.call(this, null, subdirectory);
          }
        }
      };

      DirectoryInfo.prototype.createSubdirectorySync = function(path, mode) {
        var subdirectory;
        if (isNullOrUndefined(path) || path.equals('')) {
          throw 'Path is null or undefined';
        }
        path = _path.join(this.fullName, path);
        subdirectory = new DirectoryInfo(path);
        if (!subdirectory.exists) {
          subdirectory.createSync(mode);
        }
        return subdirectory;
      };

      DirectoryInfo.prototype['delete'] = function(recursive, cb) {
        var fnFilter, fnIterator, rArg, self;
        if (recursive == null) {
          recursive = false;
        }
        if (arguments.length === 1) {
          rArg = Array.prototype.slice.call(arguments).slice(-1).shift();
          if (isFunction(rArg)) {
            recursive = false;
            cb = rArg;
          }
        }
        recursive = isBoolean(recursive) ? recursive : false;
        fnFilter = recursive ? null : function() {
          return false;
        };
        self = this;
        fnIterator = (function(dir, done) {
          var context, results;
          context = this;
          results = [];
          context.enumerateFileSystemInfos({
            fnFilter: fnFilter,
            recursive: recursive
          }, function(error1, list) {
            var i, next;
            if (error1) {
              return done.call(self, error1);
            }

            /* 
            *   NOTE:
            *   A big assumption is being made here in that we assume directories will always appear ahead of files in the array from enumerateFileSystemInfos().
            *   To prevent exceptions from being thrown by attempting to delete a non-empty directory, we are going to reverse() the array before continuing.
            *   This means all files will be deleted ahead of their respective parent directories.
            *   This also means that all subdirectories will be deleted ahead of their parent directories.
            *
            *   **If this assumption proves false (possibly for other operating systems), this method logic can be revisited.
            *   
            *       **Possible alternative logic (just putting here for note purposes)
            *       -> One alternative (which I am not sure I like) would be to perform an array.sort(), which might be more expensive resource-wise.
            *       -> Another alternative would be to queue directories during iteration to be deleted after all files have been deleted.
            *       -> Something better than the previous two.
             */
            list.reverse().push(self);
            i = 0;
            (next = function() {
              var fsinfo;
              fsinfo = list[i++];
              if (!fsinfo) {
                return done.call(self, null);
              }
              return _fs.chmod(fsinfo.fullName, toIntegerFromOctalRepresenation('777'), (function(error2) {
                var fsMethod, ftype;
                if (error2) {
                  return done.call(self, error2);
                }
                ftype = this.getType();
                if (ftype === 'FileSystemInfo') {
                  this.refresh();
                }
                if (ftype === 'FileInfo' || ftype === 'DirectoryInfo') {
                  fsMethod = _fs[ftype === 'FileInfo' ? 'unlink' : 'rmdir'];
                  return fsMethod.call(this, this.fullName, (function(error3) {
                    if (error3) {
                      return done.call(self, error3);
                    }
                    return next.call(this);
                  }));
                } else {
                  return done('Unhandled exception for delete of ambiguous ' + ftype);
                }
              }).bind(fsinfo));
            }).call(context);
          });
        });
        return fnIterator.call(this, this.fullName, cb);
      };

      DirectoryInfo.prototype.deleteSync = function(recursive) {
        var children;
        recursive = isBoolean(recursive) ? recursive : false;
        _fs.chmodSync(this.fullName, toIntegerFromOctalRepresenation('777'));
        if (recursive) {
          children = this.enumerateFileSystemInfosSync({
            fnFilter: null,
            recursive: false
          });
          if (children.length === 0) {
            _fs.rmdirSync(this.fullName);
          } else {
            children.forEach(function(fsinfo) {
              var ftype;
              ftype = fsinfo.getType();
              if (ftype === 'FileSystemInfo') {
                fsinfo.refresh();
              }
              if (ftype === 'FileInfo' || ftype === 'DirectoryInfo') {
                return fsinfo.deleteSync(recursive);
              } else {
                throw 'Unhandled exception for deleteSync of ambiguous ' + ftype;
              }
            });
            _fs.rmdirSync(this.fullName);
          }
        } else {
          _fs.rmdirSync(this.fullName);
        }
      };

      DirectoryInfo.prototype.enumerateFileSystemInfos = function(opts, cb) {
        var defaultfnFilter, fileSystemInfosArr, fnFilter, fnIterator, recursive, self;
        if (opts == null) {
          opts = {};
        }
        if (arguments.length === 1 && isFunction(opts)) {
          cb = opts;
          opts = {};
        }
        if (!isObject(opts)) {
          return cb('Invalid opts argument');
        }
        defaultfnFilter = function() {
          return true;
        };
        if (opts.fnFilter == null) {
          opts.fnFilter = defaultfnFilter;
        }
        if (opts.recursive == null) {
          opts.recursive = false;
        }
        recursive = isBoolean(opts.recursive) ? opts.recursive : false;
        fnFilter = isFunction(opts.fnFilter) ? opts.fnFilter : defaultfnFilter;
        fileSystemInfosArr = [];
        self = this;
        fnIterator = (function(dir, done) {
          var context;
          context = this;
          _fs.readdir(dir, (function(error, list) {
            var i, next;
            if (error) {
              return done.call(self, error);
            }
            i = 0;
            (next = function() {
              var fileSystemInfoObj, fsname, isDirectory, isFile, path;
              fsname = list[i++];
              if (!fsname) {
                return done.call(self, null, fileSystemInfosArr);
              }
              if (fnFilter(fsname)) {
                path = _path.join(context.fullName, fsname);
                fileSystemInfoObj = new exports.FileSystemInfo(path);
                isDirectory = fileSystemInfoObj.flags.isDirectory;
                isFile = fileSystemInfoObj.flags.isFile;
                if (isDirectory) {
                  fileSystemInfoObj = new DirectoryInfo(path);
                } else if (isFile) {
                  fileSystemInfoObj = new exports.FileInfo(path);
                }
                fileSystemInfosArr.push(fileSystemInfoObj);
                if (recursive && isDirectory) {
                  fnIterator.call(fileSystemInfoObj, fileSystemInfoObj.fullName, function(error, results) {
                    return next.call(fileSystemInfoObj);
                  });
                } else {
                  return next.call(context);
                }
              } else {
                return next.call(context);
              }
            }).call(context);
          }).bind(context));
        });
        return fnIterator.call(this, this.fullName, cb);
      };

      DirectoryInfo.prototype.enumerateFileSystemInfosSync = function(opts) {
        var defaultfnFilter, fileSystemInfosArr, fnFilter, rArg, recursive, resultsArr, _fileSystemInfosArr;
        if (opts == null) {
          opts = {};
        }
        if (!this.exists) {
          throw 'Path does not exist and hence cannot be enumerated';
        }
        if (!isObject(opts)) {
          throw 'Invalid opts argument';
        }
        defaultfnFilter = function() {
          return true;
        };
        if (opts.fnFilter == null) {
          opts.fnFilter = defaultfnFilter;
        }
        if (opts.recursive == null) {
          opts.recursive = false;
        }
        recursive = isBoolean(opts.recursive) ? opts.recursive : false;
        fnFilter = isFunction(opts.fnFilter) ? opts.fnFilter : defaultfnFilter;
        rArg = Array.prototype.slice.call(arguments).slice(-1).shift();
        resultsArr = Array.isArray(rArg) ? rArg : [];
        fileSystemInfosArr = [];
        _fileSystemInfosArr = _fs.readdirSync(this.fullName);
        _fileSystemInfosArr.forEach(((function(_this) {
          return function(fsname) {
            var fileSystemInfoObj, path;
            if (fnFilter(fsname)) {
              path = _path.join(_this.fullName, fsname);
              fileSystemInfoObj = new exports.FileSystemInfo(path);
              if (fileSystemInfoObj.flags.isDirectory) {
                fileSystemInfoObj = new DirectoryInfo(path);
              } else if (fileSystemInfoObj.flags.isFile) {
                fileSystemInfoObj = new exports.FileInfo(path);
              }
              return fileSystemInfosArr.push(fileSystemInfoObj);
            }
          };
        })(this)));
        if (recursive) {
          fileSystemInfosArr.forEach(function(fsinfo) {
            if (fsinfo.flags.isDirectory) {
              resultsArr = fsinfo.enumerateFileSystemInfosSync(opts, resultsArr);
            }
          });
        }
        fileSystemInfosArr = fileSystemInfosArr.concat(resultsArr);
        return fileSystemInfosArr;
      };

      return DirectoryInfo;

    })(exports.FileSystemInfo);
    return exports.FileInfo = (function(_super) {
      __extends(FileInfo, _super);

      function FileInfo(originalPath) {
        this.deleteSync = __bind(this.deleteSync, this);
        this['delete'] = __bind(this['delete'], this);
        this.createSync = __bind(this.createSync, this);
        this.create = __bind(this.create, this);
        var _exists, _parent;
        if (isNullOrUndefined(originalPath) || originalPath.equals('')) {
          throw 'Path is null or undefined';
        }
        FileInfo.__super__.constructor.call(this, originalPath);
        _exists = {
          name: 'exists',
          value: false
        };
        Object.defineProperty(this, '' + _exists.name + '', {
          get: function() {
            this.refresh(_exists);
            return _exists.value;
          },
          configurable: true,
          enumerable: true
        });
        this.exists = _exists.value;
        _parent = {
          name: 'parent',
          value: null
        };
        Object.defineProperty(this, '' + _parent.name + '', {
          get: function() {
            var parentPath;
            if (isNullOrUndefined(_parent.value)) {
              parentPath = _path.resolve("" + this.fullName, '..');
              _parent.value = new exports.DirectoryInfo(parentPath);
            }
            return _parent.value;
          },
          configurable: true,
          enumerable: true
        });
        this.parent = _parent.value;
      }

      FileInfo.prototype.create = function(opts, cb) {
        var ensure, ensureCreateParent, fnContinue, mode, modeOctal, overwrite, writeflag;
        if (opts == null) {
          opts = {};
        }
        if (arguments.length === 1 && isFunction(opts)) {
          cb = opts;
          opts = {};
        }
        if (!isObject(opts)) {
          return cb('Invalid opts argument');
        }
        if (opts.ensure == null) {
          opts.ensure = false;
        }
        if (opts.mode == null) {
          opts.mode = '';
        }
        if (opts.overwrite == null) {
          opts.overwrite = true;
        }
        ensure = isBoolean(opts.ensure) ? opts.ensure : false;
        mode = opts.mode;
        modeOctal = toIntegerFromOctalRepresenation(mode);
        overwrite = isBoolean(opts.overwrite) ? opts.overwrite : true;
        writeflag = overwrite ? 'w' : 'wx';
        ensureCreateParent = false;
        fnContinue = (function(error) {
          return _fs.writeFile(this.fullName, '', {
            encoding: 'utf8',
            mode: modeOctal,
            flag: writeflag
          }, (function(error) {
            if (isNullOrUndefined(error)) {
              this.refresh();
            }
            if (ensureCreateParent) {
              return _fs.chmod(this.parent.fullName, toIntegerFromOctalRepresenation(mode || DEFAULT_FILESYSTEM_CREATION_MODE), (function(error) {
                this.parent.refresh();
                if (isFunction(cb)) {
                  return cb.call(this, error);
                }
              }).bind(this));
            } else {
              if (isFunction(cb)) {
                return cb.call(this, error);
              }
            }
          }).bind(this));
        }).bind(this);
        if (ensure && !this.parent.exists) {
          ensureCreateParent = true;
          this.parent.create('777', cb, fnContinue);
        } else {
          fnContinue();
        }
      };

      FileInfo.prototype.createSync = function(opts) {
        var ensure, ensureCreateParent, ex, mode, modeOctal, overwrite, success, writeflag;
        if (opts == null) {
          opts = {};
        }
        if (!isObject(opts)) {
          throw 'Invalid opts argument';
        }
        if (opts.ensure == null) {
          opts.ensure = false;
        }
        if (opts.mode == null) {
          opts.mode = '';
        }
        if (opts.overwrite == null) {
          opts.overwrite = true;
        }
        ensure = isBoolean(opts.ensure) ? opts.ensure : false;
        mode = opts.mode;
        modeOctal = toIntegerFromOctalRepresenation(mode);
        overwrite = isBoolean(opts.overwrite) ? opts.overwrite : true;
        writeflag = overwrite ? 'w' : 'wx';
        ensureCreateParent = false;
        success = true;
        if (ensure && !this.parent.exists) {
          ensureCreateParent = true;
          this.parent.createSync('777');
        }
        try {
          _fs.writeFileSync(this.fullName, '', {
            encoding: 'utf8',
            mode: modeOctal,
            flag: writeflag
          });
        } catch (_error) {
          ex = _error;
          success = false;
        } finally {
          if (success) {
            this.refresh();
            if (ensureCreateParent) {
              _fs.chmodSync(this.parent.fullName, toIntegerFromOctalRepresenation(mode || DEFAULT_FILESYSTEM_CREATION_MODE));
              this.parent.refresh();
            }
          } else {
            if (ex) {
              throw ex;
            }
          }
        }
        return this;
      };

      FileInfo.prototype['delete'] = function(cb) {
        var parent, parentFSPermissions, parentFSPermissionsOctalFileSystemModeString, parentFullName, thisFullName;
        cb = arguments.length > 1 ? arguments[arguments.length - 1] : cb;
        parent = this.parent;
        parentFullName = parent.fullName;
        parentFSPermissions = parent.fileSystemPermissions;
        parentFSPermissionsOctalFileSystemModeString = parentFSPermissions.octalFileSystemModeString || DEFAULT_FILESYSTEM_CREATION_MODE;
        thisFullName = this.fullName;
        return _fs.chmod(parentFullName, toIntegerFromOctalRepresenation('777'), (function(error1) {
          return _fs.chmod(thisFullName, toIntegerFromOctalRepresenation('777'), (function(error2) {
            return _fs.unlink(thisFullName, (function(error3) {
              return _fs.chmod(parentFullName, toIntegerFromOctalRepresenation(parentFSPermissionsOctalFileSystemModeString), (function(error4) {
                if (isFunction(cb)) {
                  return cb.call(this, error4);
                }
              }).bind(this));
            }).bind(this));
          }).bind(this));
        }).bind(this));
      };

      FileInfo.prototype.deleteSync = function() {
        var parent, parentFSPermissions, parentFSPermissionsOctalFileSystemModeString, parentFullName, thisFullName;
        parent = this.parent;
        parentFullName = parent.fullName;
        parentFSPermissions = parent.fileSystemPermissions;
        parentFSPermissionsOctalFileSystemModeString = parentFSPermissions.octalFileSystemModeString || DEFAULT_FILESYSTEM_CREATION_MODE;
        thisFullName = this.fullName;
        _fs.chmodSync(parentFullName, toIntegerFromOctalRepresenation('777'));
        _fs.chmodSync(thisFullName, toIntegerFromOctalRepresenation('777'));
        _fs.unlinkSync(thisFullName);
        _fs.chmodSync(parentFullName, toIntegerFromOctalRepresenation(parentFSPermissionsOctalFileSystemModeString));
      };

      return FileInfo;

    })(exports.FileSystemInfo);
  });

  for (k in thisNamespaceObjectContainer) {
    v = thisNamespaceObjectContainer[k];
    return _root[k] = v;
  }

}).call(this);
