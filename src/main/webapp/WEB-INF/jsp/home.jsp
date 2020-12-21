
<%@page contentType="text/html; charset=UTF-8"  %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>


<html lang="th">
<head>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Mali:wght@300&display=swap" rel="stylesheet">

<link href="https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/css/select2.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/js/select2.min.js"></script>

<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.js"></script>

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


table.dataTable thead th, table.dataTable thead td {
    padding: 10px 18px;
    border-bottom: 1px solid #ddd;
}
table.dataTable.no-footer {
    border-bottom: 1px solid  #ddd;
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
                    <div class="modal-body" style="height:220px;">
                   <div class="row">

                       <div class="col-sm-offset-2 col-sm-2" style="text-align:right">
                            <label for="email">รายการ :</label>
                        </div>
                       <div class="col-sm-4">
                             <select class="form-control" id="selectItemsId" style="width: 100%;" data-placeholder="เลือก" onChange="">
                                    <option>...</option>
                            </select>
                       </div>

                   </div>
                    <div class="row" style="margin-top: 5px;">
                      <div class="col-sm-offset-2 col-sm-2" style="text-align:right">
                           <label for="email">รายรับ :</label>
                       </div>
                      <div class="col-sm-4">
                           <input type="email" class="form-control" id="idIncome">
                      </div>
                  </div>
                   <div class="row" style="margin-top: 5px;">
                        <div class="col-sm-offset-2 col-sm-2" style="text-align:right">
                             <label for="email">รายจ่าย :</label>
                         </div>
                        <div class="col-sm-4">
                             <input type="email" class="form-control" id="idAmount">
                        </div>
                   </div>
                    <div class="row" style="margin-top: 5px;">
                           <div class="col-sm-offset-2 col-sm-2" style="text-align:right">
                                <label for="email">วันที่ :</label>
                            </div>

                           <div class="col-sm-4">
                                  <div class='input-group date' id='datetimepicker'>
                                     <input type="text" class="form-control" id="idCreateDate">
                                        <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                                 </div>
                           </div>
                      </div>

                       <div class="row" style="margin-top: 5px;">
                                              <div class="col-sm-offset-2 col-sm-2" style="text-align:right">
                                                   <label for="email">Remark :</label>
                                               </div>
                                              <div class="col-sm-4">
                                                   <input type="email" class="form-control" id="idRemark">
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
                                          <input type="text" class="form-control" id="idItemInput">

                                        </select>
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
                 $(".datepicker").css({"top": "542px", "left": "540px","z-index":"1060","display":"block"});
            ajaxGetExpenditureByUserId('NON');
            renderPanel('01')
            findDataItems()

            $('#datetimepicker').datepicker({
                    orientation: "auto",
                    autoclose: true,
                    format: 'dd/mm/yyyy',
                    todayHighlight: true
                });
                $('#datetimepicker').click(function(){


                      });


        });




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
    var user;

     $('#panelBodyId').empty()
                if("01"===param){
                user ='NON'
                $('.panel-heading h4').html('')
                $('.panel-heading h4').append('ค่าใช้จ่าย')
                     $('#panelBodyId').append( '<ul class="nav nav-tabs" style="margin-bottom: 10px;">'+
                                                     '<li class ="active"><a data-toggle="tab" onClick="ajaxGetExpenditureByUserId("01")" href="#menu1" style="color: black"><h5>NON</h5></a></li>'+
                                                        '<li><a data-toggle="tab" href="#menu2"  onClick="ajaxGetExpenditureByUserId("02")"  ><h5 style="color: black">PAI FOO</h5></a></li>'+
                                                '</ul>'+
                                            '<div class="tab-content" >'+
                                          '<button type="button" class="btn btn-primary"  data-toggle="modal" data-target="#myModal"  style="margin-bottom:10px;" >เพิ่ม</button>'+
                                           '&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-danger" style="margin-bottom:10px;">ลบ</button>'+
                                          '<div id="menu1" class="tab-pane fade in active">'+
                                          '<table class="table table-striped table-bordered" style="margin-top: 10px;" id="table_id">'+
                                                  '<thead class="tbHeader">'+
                                                    '<tr>'+
                                                      '<th class="text-center">รายการ</th>'+
                                                      '<th class="text-center">รายจ่าย</th>'+
                                                      '<th class="text-center">รายรับ</th>'+
                                                      '<th class="text-center">วันที่</th>'+
                                                      '<th class="text-center">Remark</th>'+
                                                    '</tr>'+
                                                  '</thead>'+
                                                  '<tbody id="tobodyId">'+

                                                  '</tbody>'+
                                                  '<tfoot id="tfootId">'+
                                                  '</tfoot>'+

                                                '</table>'+
                                               '</div>'+
                                                '<div id="menu2" class="tab-pane fade">'+
                                                    '<table class="table table-bordered" style="margin-top: 10px;">'+
                                                                                                     '<thead class="tbHeader" >'+
                                                                                                       '<tr>'+
                                                                                                         '<th>รายการ</th>'+
                                                                                                         '<th>รายจ่าย</th>'+
                                                                                                         '<th>รายรับ</th>'+
                                                                                                       '</tr>'+
                                                                                                     '</thead>'+

                                                                                                     '<tfoot id="tfootId">'+
                                                                                                     '</tfoot>'+

                                                                                                   '</table>'+
                                             '</div>'
                     )
                 }else if("02"===param){
                 $('.panel-heading h4').html('')
                 $('.panel-heading h4').append('ประเภทรายได้/อื่นๆ')
                        $('#panelBodyId').append(
                                            '<div class="tab-content" >'+
                                          '<button type="button" class="btn btn-primary"  data-toggle="modal" data-target="#addItems" style="margin-bottom:10px;" >เพิ่ม</button>'+
                                           '&nbsp;&nbsp;&nbsp;<button type="button" style="margin-bottom:10px;"  class="btn btn-danger">ลบ</button>'+
                                          '<div id="menu1" class="tab-pane fade in active">'+
                                          '<table class="table table-bordered" style="margin-top: 10px;" id="table_id_items" >'+
                                                  '<thead class="tbHeader">'+
                                                    '<tr>'+
                                                     '<th class="text-center" >รหัส</th>'+
                                                     '<th class="text-center" >ชื่อรายการ(รายรับ)</th>'+
                                                      '<th class="text-center" >ชื่อรายการ(รายจ่าย)</th>'+
                                                    '</tr>'+
                                                  '</thead>'+

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

                 ajaxGetExpenditureByUserId(user)

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
             url : "itemsCon/ajaxInsertItems",
             type : "post",
             contentType : "application/json",
             data : JSON.stringify(json),
             dataType : 'json',
             success : function(obj) {
               $('#addItems').hide();
            findDataItems()
            renderItemsToTable()
            $('#idItemInput').val('')
             }
         });
 }

 function findDataItems(){
              $.ajax({
                     type: 'GET',
                     async:false,
                     url: 'itemsCon/findAllItems',
                    }).done(function(obj){

                    if(obj.length!=0){
                    var select = document.getElementById('selectItemsId');
                     $('#selectItemsId').find('option').remove().end();

                       	for (var i = 0; i < obj.length; i++) {
	                    var opt = document.createElement('option');
						opt.value = obj[i].id;
						opt.innerHTML = obj[i].itemName;
						select.appendChild(opt);
						}

                                     itemsGlobal = obj
                    }

                })
                  $('#selectItemsId').select2({
                        dropdownAutoWidth: true,
                        width: 'auto'
                     });

}

function renderItemsToTable(){
    var strStatus;
     $('#tobodyIdItem').empty();
        if(itemsGlobal.length!=0){
                  $('#table_id_items tbody').remove();
                             $.each(itemsGlobal,function(index,value){
                                  $('#table_id_items').dataTable({
           	    	            "searching" : false,
           	    	            "bSort" : true,
           	    	            "paging" : true,
           	    	            "bFilter" : false,
           	    	            "data" : itemsGlobal,
           	    	            "destroy": true,
           	    	            "info" : false,
           	    	            "pageLength": 10,
           	    	            "aaSorting": [],
           	    	            "responsive": true,
           	    	            "dom": 'lrtip',
           	    	            "columns" : [
                                       {"data" : "id","className" : "text-center text-nowrap" ,"value":"ITEM_NAME", orderable : true},
                                       {"data" : null,"className" : "text-left text-nowrap","id":"productId", orderable : true, render :
                                        function(o) {
                                          var ret ;
                                                    if(o.flg=='IN'){
                                                    ret ="<td class='text-left text-nowrap' name='itemName'>"+o.itemName+"</td>"
                                                    }else{
                                                        ret = "-"
                                                    }
                                                  return ret;
                                            }
                                        },
                                        {"data" : null,"className" : "text-left text-nowrap","id":"productId", orderable : true, render :
                                                                              function(o) {
                                                                                var ret ;
                                                                                          if(o.flg=='OUT'){
                                                                                          ret ="<td class='text-center text-nowrap' name='itemName'>"+o.itemName+"</td>"
                                                                                          }else{
                                                                                          ret = "-"
                                                                                          }
                                                                                        return ret;
                                                                                  }
                                                                              },
           	    	            ],
           	    	            "language": {
           	    	                "emptyTable": "-- ไม่พบข้อมูลที่ค้นหา --",
           	    	                "info": "แสดง _START_ ถึง _END_ จากทั้งหมด _TOTAL_ รายการ",
           	    	                "lengthMenu": "แสดง _MENU_ รายการ",
           	    	                "paginate" : {
           	    	                    "first":      "หน้าแรก",
           	    	                    "previous":   "ก่อนหน้า",
           	    	                    "next":       "ถัดไป",
           	    	                    "last":       "หน้าสุดท้าย"
           	    	                }
           	    	            },
           	    	            "columnDefs" : [{}]
           	    	            ,"initComplete" : function(row, data, index) {

           	    	            }
           	    	        });

                             })


        }

}


 function insertExpenditure(){
 var statusFlag ='';


  var json = {
        'income' : $('#idIncome').val() == "" ? 0 : $('#idIncome').val(),
        'amount' : $('#idAmount').val() == "" ? 0 : $('#idAmount').val(),
        'itemId' :  $('#selectItemsId').val(),
        'user' : '1737',
        'createDate':$('#idCreateDate').val()=="" ? null :$('#idCreateDate').val() ,
        'remark' : $('#idRemark').val()=="" ? null :$('#idRemark').val()

  }
   jQuery.ajax({
             url : "expenditureCon/ajaxInsertExpenditureCon",
             type : "post",
             contentType : "application/json",
             data : JSON.stringify(json),
             dataType : 'json',
             success : function(obj) {
               $('#myModal').hide();
               $('#myModal').val('')
               ajaxGetExpenditureByUserId('NON')
             }
         });
 }

 function ajaxGetExpenditureByUserId(param){
    $('#table_id').DataTable();
    var userId;
           if('NON'===param){
            userId = '1737'
           }else if('PAI'===param){
            userId = '2839'
          }
           var render =""
           $.ajax({
                 type: 'GET',
                 url: 'expenditureCon/ajaxGetExpenditureByUserId?userId='+userId,
                }).done(function(data){
                 if(data.length!=0){
                   $('#table_id tbody').remove();
                  $.each(data,function(index,value){
                       $('#table_id').dataTable({
	    	            "searching" : false,
	    	            "bSort" : true,
	    	            "paging" : true,
	    	            "bFilter" : false,
	    	            "data" : data,
	    	            "destroy": true,
	    	            "info" : false,
	    	            "pageLength": 10,
	    	            "aaSorting": [],
	    	            "responsive": true,
	    	            "dom": 'lrtip',
	    	            "columns" : [
                            {"data" : "ITEM_NAME","className" : "text-left text-nowrap" ,"value":"ITEM_NAME", orderable : true},
                               {"data" : null,"className" : "text-right text-nowrap","id":"productId", orderable : true, render :
                                                          function(o) {

                                                                      ret ="<td class='text-right text-nowrap' name='itemName'>"+formatCurry(o.AMOUNT)+"</td>"

                                                                    return ret;
                                                              }
                                      },
                            {"data" : null,"className" : "text-right text-nowrap","id":"productId", orderable : true, render :
                             function(o) {
                                   ret ="<td class='text-right text-nowrap' name='itemName'>"+formatCurry(o.INCOME)+"</td>"
                                   return ret;
                                 }
                             },
                             {"data" : "CREATE_DATE","className" : "text-center text-nowrap" ,"value":"CREATE_DATE", orderable : true},
                             {"data" : "REMARK","className" : "text-center text-nowrap" ,"value":"REMARK", orderable : true},
	    	            ],
	    	            "language": {
	    	                "emptyTable": "-- ไม่พบข้อมูลที่ค้นหา --",
	    	                "info": "แสดง _START_ ถึง _END_ จากทั้งหมด _TOTAL_ รายการ",
	    	                "lengthMenu": "แสดง _MENU_ รายการ",
	    	                "paginate" : {
	    	                    "first":      "หน้าแรก",
	    	                    "previous":   "ก่อนหน้า",
	    	                    "next":       "ถัดไป",
	    	                    "last":       "หน้าสุดท้าย"
	    	                }
	    	            },
	    	            "columnDefs" : [{}]
	    	            ,"initComplete" : function(row, data, index) {

	    	            }
	    	        });

                  })

                 }

                }).fail(function(){

                });

 }

     function formatCurry(val){
   return val.toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,');
 }

 </script>

</div>

	
</body>
</html>