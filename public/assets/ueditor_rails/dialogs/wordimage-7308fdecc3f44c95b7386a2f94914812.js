function hideFlash(){flashObj=null,flashContainer.innerHTML=""}function addOkListener(){dialog.onok=function(){if(imageUrls.length){for(var e,t=domUtils.getElementsByTagName(editor.document,"img"),a=0;e=t[a++];){var i=e.getAttribute("word_img");if(i)for(var n,r=0;n=imageUrls[r++];)if(-1!=i.indexOf(n.original.replace(" ",""))){e.src=editor.options.wordImagePath+n.url,e.setAttribute("data_ue_src",editor.options.wordImagePath+n.url),e.setAttribute("title",n.title),parent.baidu.editor.dom.domUtils.removeAttributes(e,["word_img","style","width","height"]),editor.fireEvent("selectionchange");break}}hideFlash()}},dialog.oncancel=function(){hideFlash()}}function addUploadListener(){g("upload").onclick=function(){flashObj.upload(),this.style.display="none"}}function showLocalPath(e){var t=editor.selection.getRange().getClosedNode();if(1==editor.word_img.length||t&&"IMG"==t.tagName)return void(g(e).value=editor.word_img[0]);var a=editor.word_img[0],i=a.lastIndexOf("/")||0,n=a.lastIndexOf("\\")||0,r=i>n?"/":"\\";a=a.substring(0,a.lastIndexOf(r)+1),g(e).value=a}function createFlashUploader(e,t){var a=utils.extend({},lang.flashI18n);for(var i in a)i in{lang:1,uploadingTF:1,imageTF:1,textEncoding:1}||!a[i]||(a[i]=encodeURIComponent(editor.options.langPath+editor.options.lang+"/images/"+a[i]));e=utils.extend(e,a,!1);var n={createOptions:{id:"flash",url:e.flashUrl,width:e.width,height:e.height,errorMessage:lang.flashError,wmode:browser.safari?"transparent":"window",ver:"10.0.0",vars:e,container:e.container}};n=extendProperty(t,n),flashObj=new baidu.flash.imageUploader(n),flashContainer=$G(e.container)}function extendProperty(e,t){for(var a in e)t[a]||(t[a]=e[a]);return t}function getPasteData(e){return baidu.g("msg").innerHTML=lang.copySuccess+"</br>",setTimeout(function(){baidu.g("msg").innerHTML=""},5e3),baidu.g(e).value}function createCopyButton(e,t){baidu.swf.create({id:"copyFlash",url:"fClipboard_ueditor.swf",width:"58",height:"25",errorMessage:"",bgColor:"#CBCBCB",wmode:"transparent",ver:"10.0.0",vars:{tid:t}},e);var a=baidu.swf.getMovie("copyFlash"),i=setInterval(function(){a&&a.flashInit&&(clearInterval(i),a.setHandCursor(!0),a.setContentFuncName("getPasteData"))},500)}var wordImage={},g=baidu.g,flashObj,flashContainer;wordImage.init=function(e,t){showLocalPath("localPath"),createFlashUploader(e,t),addUploadListener(),addOkListener()},createCopyButton("clipboard","localPath");