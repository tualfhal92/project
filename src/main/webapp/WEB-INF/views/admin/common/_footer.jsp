<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

				</div><!-- /.container-fluid -->
			</div><!-- /#page-wrapper -->
		</div><!-- /#wrapper -->
		<!-- Charts JavaScript -->
		<script>
			$(function() {
				$('#dynamicModal').on('hidden.bs.modal', function() {
					$('#modalContent').html(null);
				});
			});
		</script>
		
		<div id="dynamicModal">
			<div class="modal fade dynamicModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-md">
					<div class="modal-content" id="modalContent" style="padding: 15px;"></div>
				</div>
			</div>
		</div>
	</body>
	
</html>