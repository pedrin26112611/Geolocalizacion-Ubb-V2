	$(document).ready(function() {
			$('#tabla').DataTable({
				
				 dom: 'Bfrtip',
			   
				 "pageLength": 5,
			        "ordering": false,
			        "info": false,
			       
			       
			        "language": {
			        	
			        	 "sSearch": "Buscar " ,
			        	 "sLoadingRecords": "Cargando...",
			            "zeroRecords": "No se encontraron resultados",
			            "infoEmpty": "No hay registros",
			            "sLengthMenu":     "Mostrar _MENU_ registros",
			            
			            
			                "paginate": {
					            "first":      "Primero",
					            "last":       "Último",
					            "next":       "Siguiente",
					            "previous":   "Anterior"
					        }
			 
			        }
			   
			});
		});
