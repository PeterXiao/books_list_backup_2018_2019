var fs=require('fs');
var fsi = require('fs-filesysteminfo');
var rootDirs=['git','javascript','设计模式'];
var bookItems=[];
var tempStr='';
var dtNow=new Date();

var getFileList=function(rootPath){
    var args=arguments;
    var fsiObj = new fsi.FileInfo(rootPath);
    if(fsiObj.flags.isDirectory){
        //tempStr+='—';
        bookItems.push('## '+tempStr+fsiObj.name+' ##');
        fs.readdirSync(rootPath).forEach(file=>{
            args.callee(rootPath+'/'+file);
        });
        //tempStr=tempStr.substr(1);
    }else{
        bookItems.push(fsiObj.name);
    }
};

fs.readdirSync('./').forEach(file=>{
    if(rootDirs.indexOf(file)==-1) return;
    getFileList(file);
});

//更新readme.md
fs.writeFile('./readme.md', `
# 简介

这里存放着本人平时以思维导图形式整理的相关资料信息，如有引用和转载，请注明出处。

# XMind

需要安装免费的[XMind思维导图软件](http://www.xmindchina.net/)，才能打开相应的文件。

----------

# 目录

${bookItems.join('\r\n\r\n')}

----------
本目录更新时间：${dtNow}
`, null, function () {
    console.log('updated readme.md')
});