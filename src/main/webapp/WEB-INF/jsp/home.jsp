
<%@page contentType="text/html; charset=UTF-8"  %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>


<html lang="th">
<head>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Mali:wght@300&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/css/select2.min.css" rel="stylesheet" />

<style>
	a{
	font-size: 14px;
	}
	.card {
      box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
      transition: 0.3s;
      width: 30%;

      padding-top: 10px;
       padding-bottom: 10px;

    }

    .card:hover {
      box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
    }

    .container {
      padding: 2px 16px;
    }
    .jumbotron{
       box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
        transition: 0.3s;
        height :100%;
        background-color:#fff
    }
    .panel{
     border-top-left-radius: 1px;
     border-top-right-radius: 1px;
     border-bottom-left-radius: 1px;
     border-bottom-right-radius: 1px;
     }
     th{
        font-family: 'Mali', cursive;
        text-align:center;
     }
     h5{
        font-family: 'Mali', cursive;
     }
      h3{
             font-size: 20px;
      }
     button{
       border-radius: 0 !important;
     }
     .modal-content {
      border-radius: 0 !important;
     }



</style>
</head>
<body>
<div class="container-fluid ">
    <h1 style="margin-top:10px;">Dashboard</h1>
        <div class="jumbotron col-sm-12">
                <form>
                  <div class="form-group row">
                     <div class="card col-sm-2">
                             <button type="button" class="btn btn-default" onClick="renderPanel('01')"  data-toggle="modal" id="item_1" value="01" data-target="#" >
                             <span class="glyphicon glyphicon-credit-card col-sm-2 active" style="font-size:50px;" aria-hidden="true"></span>
                             <h3 class="col-sm-2" style="margin-top: 10px;padding-left: 50px;">ค่าใช้จ่าย</h3>
                             </button>
                      </div>
                        <div class="card col-sm-2" style="left:15px;width: 330px;">
                             <button type="button" class="btn btn-default"  data-toggle="modal" onClick="renderPanel('02')"   id="item_2" value="02"  data-target="#" >
                                   <span class="glyphicon glyphicon-shopping-cart col-sm-2" style="font-size:50px;" aria-hidden="true"></span>
                                   <h3 class="col-sm-2" style="margin-top: 10px;padding-left: 30px;">ประเภทรายได้/อื่น</h3>
                             </button>

                        </div>
                      <div class="card col-sm-2" style="left:30px;width: 275px;">
                           <button type="button" class="btn btn-default" onClick="renderPanel('03')"   data-toggle="modal"  id="item_3" value="03"  data-target="#" >
                             <span class="glyphicon glyphicon-list-alt col-sm-2" style="font-size:50px;" aria-hidden="true"></span>
                             <h3 class="col-sm-2" style="margin-top: 10px;padding-left: 40px;">รายการที่ต้องซื้อ</h3>
                           </button>
                      </div>
                  </form>

            </div>

        </div>

           <div class="jumbotron col-sm-12" style"margin-top:20px">

            <div class="panel panel-default" >
              <div class="panel-heading"><h4>ค่าใช้จ่าย</h4></div>
              <div class="panel-body" id="panelBodyId">



              </div>
            </div>

             <!-- Modal -->
              <div class="modal fade" id="myModal" role="dialog">
                <div class="modal-dialog">

                  <!-- Modal content-->
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal">&times;</button>
                      <h4 class="modal-title"><b>เพิ่ม Expenditure</b></h4>
                    </div>
                    <div class="modal-body" style="height:130px;">
                   <div class="row">


                       <div class="col-sm-offset-2 col-sm-2">
                            <label for="email">รายการ :</label>
                        </div>
                       <div class="col-sm-4">
                            <input type="email" class="form-control" id="idItem">
                       </div>

                   </div>
                    <div class="row" style="margin-top: 5px;">
                      <div class="col-sm-offset-2 col-sm-2">
                           <label for="email">รายรับ :</label>
                       </div>
                      <div class="col-sm-4">
                           <input type="email" class="form-control" id="idIncome">
                      </div>
                  </div>
                   <div class="row" style="margin-top: 5px;">
                        <div class="col-sm-offset-2 col-sm-2">
                             <label for="email">รายจ่าย :</label>
                         </div>
                        <div class="col-sm-4">
                             <input type="email" class="form-control" id="idAmount">
                        </div>
                    </div>
               </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-success" data-dismiss="modal" onClick="insertExpenditure()">บันทึก</button>
                      <button type="button" class="btn btn-danger" data-dismiss="modal">ยกเลิก</button>
                    </div>
                  </div>

                </div>
              </div>


              <!-- Modal -->
                            <div class="modal fade" id="addItems" role="dialog">
                              <div class="modal-dialog">

                                <!-- Modal content-->
                                <div class="modal-content">
                                  <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title"><b>เพิ่ม ประเภทรายได้/อื่นๆ</b></h4>
                                  </div>
                                  <div class="modal-body" style="height:130px;">
                                 <div class="row">


                                     <div class="col-sm-offset-2 col-sm-2">
                                          <label for="email">รายการ :</label>
                                      </div>
                                     <div class="col-sm-4">
                                          <input type="email" class="form-control" id="idItemInput">
                                     </div>

                                 </div>
                                  <div class="row" style="margin-top: 5px;">
                                    <div class="col-sm-offset-2 col-sm-2">
                                         <label for="email">รายรับ :</label>
                                     </div>
                                    <div class="col-sm-4">
                                        <div class="radio">
                                                   <label style="font-size: 1em">
                                                       <input type="radio" active name="o5" value="IN">
                                                       <span class="cr" style="top: -5;right: 18px;bottom: 6px; "><i class="cr-icon fa fa-circle"></i></span>
                                               </label>
                                       </div>
                                    </div>
                                </div>
                                 <div class="row" style="margin-top: 5px;">
                                      <div class="col-sm-offset-2 col-sm-2">
                                           <label for="email">รายจ่าย :</label>
                                       </div>
                                      <div class="col-sm-4">
                                        <div class="radio">
                                            <label style="font-size: 1em">
                                                       <input type="radio" name="o5" value="OUT">
                                                       <span class="cr"  style="right: 18px;bottom: 6px;"><i class="cr-icon fa fa-circle"></i></span>
                                           </label>
                                            </div>
                                      </div>
                                  </div>
                             </div>
                                  <div class="modal-footer">
                                    <button type="button" class="btn btn-success" data-dismiss="modal" onClick="insertItem()">บันทึก</button>
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">ยกเลิก</button>
                                  </div>
                                </div>

                              </div>
                            </div>


</div>

         <script>
          document.getElementById("main").style.marginLeft = "0px";
         document.body.style.marginLeft = "250px";
         $( document ).ready(function() {

            renderDataExpenditure('NON')
            renderPanel('01')
            findDataItems()
        });

         function renderDataExpenditure(param){
          var render =""
             $.ajax({
                   type: 'GET',
                   url: 'getDataExpenditureById',
                  }).done(function(data){
                   if(data.length!=0){
                    $('#tobodyId').empty();
                    $.each(data,function(index,value){
                             $('#tobodyId').append('<tr>'+
                                           '<td>'+value.items.itemName+'</td>'+
                                           '<td style="text-align:right" >'+value.amount+'</td>'+
                                           '<td style="text-align:right" >'+value.income+'</td>'+
                                         '</tr>'
                                         )

                    })

                   }

                  }).fail(function(){

                  });
         if('NON'===param){

         }else if('PAI'===param){

         }

         }

 function insertExpenditure(){
         var items = $('#idItem').val()
         var incomes = $('#idIncome').val()
         var amount = $('#idAmount').val()
         var json = {"item":items,
         "income":incomes,
         "amount":amount
         }

      jQuery.ajax({
        url : "ajaxInsertExpenditure",
        type : "post",
        contentType : "application/json",
        data : JSON.stringify(json),
        dataType : 'json',
        success : function(obj) {
           $('#myModal').modal('toggle');

        }
    });
 }

 function renderPanel(param){


 $('#panelBodyId').empty()
                if("01"===param){
                $('.panel-heading h4').html('')
                $('.panel-heading h4').append('ค่าใช้จ่าย')
                     $('#panelBodyId').append( '<ul class="nav nav-tabs" style="margin-bottom: 10px;">'+
                                                     '<li class ="active"><a data-toggle="tab" onClick="renderDataExpenditure("NON")" href="#menu1" style="color: black"><h5>NON</h5></a></li>'+
                                                        '<li><a data-toggle="tab" href="#menu2"  onClick="renderDataExpenditure("PAI")" ><h5 style="color: black">PAI FOO</h5></a></li>'+
                                                '</ul>'+
                                            '<div class="tab-content" >'+
                                          '<button type="button" class="btn btn-primary"  data-toggle="modal" data-target="#myModal" >เพิ่ม</button>'+
                                           '<button type="button" class="btn btn-danger">ลบ</button>'+
                                          '<div id="menu1" class="tab-pane fade in active">'+
                                          '<table class="table table-bordered" style="margin-top: 10px;">'+
                                                  '<thead>'+
                                                    '<tr>'+
                                                      '<th>รายการ</th>'+
                                                      '<th>รายจ่าย</th>'+
                                                      '<th>รายรับ</th>'+
                                                    '</tr>'+
                                                  '</thead>'+
                                                  '<tbody id="tobodyId">'+

                                                  '</tbody>'+
                                                  '<tfoot id="tfootId">'+
                                                  '</tfoot>'+

                                                '</table>'+
                                               '</div>'+
                                                '<div id="menu2" class="tab-pane fade">'+
                                                     '<h3>Menu 2</h3>'+
                                                     '<p>Some content in menu 2.</p>'+
                                                   '</div>'+
                                             '</div>'
                     )
                 }else if("02"===param){
                 $('.panel-heading h4').html('')
                 $('.panel-heading h4').append('ประเภทรายได้/อื่นๆ')

                        $('#panelBodyId').append(
                                            '<div class="tab-content" >'+
                                          '<button type="button" class="btn btn-primary"  data-toggle="modal" data-target="#addItems" >เพิ่ม</button>'+
                                           '<button type="button" class="btn btn-danger">ลบ</button>'+
                                          '<div id="menu1" class="tab-pane fade in active">'+
                                          '<table class="table table-bordered" style="margin-top: 10px;">'+
                                                  '<thead>'+
                                                    '<tr>'+
                                                     '<th>รหัส</th>'+
                                                     '<th>ชื่อรายการ(รายรับ)</th>'+
                                                      '<th>ชื่อรายการ(รายจ่าย)</th>'+
                                                    '</tr>'+
                                                  '</thead>'+
                                                  '<tbody id="tobodyIdItem">'+

                                                  '</tbody>'+
                                                  '<tfoot id="tfootId">'+
                                                  '</tfoot>'+

                                                '</table>'+
                                               '</div>'+
                                                '<div id="menu2" class="tab-pane fade">'+
                                                     '<h3>Menu 2</h3>'+
                                                     '<p>Some content in menu 2.</p>'+
                                                   '</div>'+
                                             '</div>'
                     )

renderItemsToTable()
                 }else if("03"===param){

                }

 }

 function insertItem(){
 var statusFlag ='';
     $.each($( "input[name=o5]:checked" ),function(index,value){
      statusFlag = $(this).val()
     })

  var json = {
        'items' : $('#idItemInput').val(),
        'statusFlg' : statusFlag

  }
   jQuery.ajax({
             url : "ajaxInsertItems",
             type : "post",
             contentType : "application/json",
             data : JSON.stringify(json),
             dataType : 'json',
             success : function(obj) {
               $('#addItems').modal('toggle');

             }
         });
 }

 function findDataItems(){
              $.ajax({
                     type: 'GET',
                     async:false,
                     url: 'itemsCon/findAllItems',
                    }).done(function(data){
                    itemsGlobal = data
                })

}

function renderItemsToTable(){
    var strStatus;
        if(itemsGlobal.length!=0){
            $.each(itemsGlobal,function(index,value){
              strStatus = ''
               if(value.flg==="IN"){
               strStatus =   '<td style="text-align:left" >'+value.itemName+'</td>'
                strStatus += '<td style="text-align:center" > - </td>'
               }else{
                strStatus = '<td style="text-align:center" > - </td>'
                strStatus +=   '<td style="text-align:left" >'+value.itemName+'</td>'

               }
               console.log(strStatus)
              $('#tobodyIdItem').append('<tr>'+
                           '<td>'+value.id+'</td>'+
                            strStatus+
                         '</tr>'
                         )

            })
        }

}

 </script>

</div>

	
</body>
</html>