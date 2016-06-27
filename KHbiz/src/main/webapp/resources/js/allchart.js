$(function(){
   			$("#go").click(function(){
   				$.ajax({
   					url : "searchChart",
   					type : "get",
   					data : {
   						curpage : 1,
   						search : $(".select").val(),
   						text : $("#text").val()
   					},
   					success : function(result){
   						$(".table-search").html(result);
   					}
   				});
   			});
   		
	   		$(".updateChart").click(function(){	   			
	   			$.ajax({
   					url : "updateChart",
   					type : "get",
   					data : {
   						id : $("#id"+$(this).val()).text(),
   						pw : $("#pw"+$(this).val()).val()
   					},
   					success : function(result){
   						$(".modal-content").html(result);
   						$("#modal-update").modal("show");
   					}
   				});
	   	    });
   		});