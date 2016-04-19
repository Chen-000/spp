// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery-1.4.2.min
//= require jquery.tabso_yeso
//= require jquery-1
//= require focus
//= require select2
//= require zh-CN


  function selectTag(showContent,selfObj){
    // 操作标签
    var tag = document.getElementById("tags").getElementsByTagName("li");
    var taglength = tag.length;
    for(i=0; i<taglength; i++){
      tag[i].className = "";
    }
    selfObj.parentNode.className = "selectTag";
    // 操作内容
    for(i=0; j=document.getElementById("tagContent"+i); i++){
      j.style.display = "none";
    }
    document.getElementById(showContent).style.display = "block";    
  }  


  //   $(document).ready(function(){
  //   $("#q_title_cont").select2({
  //      placeholder: "请输入",
  //      theme: "classic",
  //      allowClear: true,
  //      ajax: {
  //        type: 'GET',
  //        url: '/home/ajax_query',
  //        dataType: 'json',            //传输的数据类型
  //        delay: 500,
  //        data: function(params){
  //          return { 
  //            search: params.term,
  //            page: 10
  //          };
  //        },
  //        processResults: function(data, page){
  //          return {results: data.users};
  //        }
  //     },
  //     tags: true,
  //     //selectOnBlur: true,
  //     selectOnClose: true,    //当下拉菜单关闭时，选择选中的值
  //     minimumInputLength: 1,
  //     language: "zh-CN",
  //     openOnEnter: false
  //   });
  // });

