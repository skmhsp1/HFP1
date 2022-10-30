
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../base/managerbase.jsp"%>

<!DOCTYPE html>
<html>
<head>

	<title>판매 상품 관리</title>
	<meta charset="utf-8">
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet"
		href="https://fonts.googleapis.com/css?family=Mukta:300,400,700">
	<link rel="stylesheet" href="../fonts/icomoon/style.css">
	<link rel="stylesheet" href="../css/magnific-popup.css">
	<link rel="stylesheet" href="../css/jquery-ui.css">
	<link rel="stylesheet" href="../css/owl.carousel.min.css">
	<link rel="stylesheet" href="../css/owl.theme.default.min.css">
	<link rel="stylesheet" href="../css/aos.css">
	<link rel="stylesheet" href="../css/style.css">
	
	<link rel="stylesheet" href="../css/bootstrap.min.css">
	
	<link rel="stylesheet" href="../css/purchaselistm.css">
	
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript">
			var cappr1 = "${cappr}";
		
			$(function(){<!-- 02 -->
				/* 더보기 눌렀을 때 리스트 불러오기 4번째부터 */
				$("#addbutton1").click(function(){
					
					$("#addbtn").remove();
					
					var chtml = "";
					chtml += "<c:forEach items='${pppclist}' var='pppcdto' begin='3'>";
					chtml += "<tr id='${pppcdto.payDto.py_no}'>";
					chtml += "<td class='product-name'>";
					chtml += "<div id='height1'>";
					chtml += "<div id='num1' class='fontsize1'>${pppcdto.cancelDto.c_reqdate}</div>";
					chtml += "<br>";
					chtml += "<div id='num2' class='fontsize1'>${pppcdto.cancelDto.py_no}</div>";
					chtml += "<br>";
					chtml += "</div>";
					chtml += "</td>";
					chtml += "<td><div class='fontsize1' id='height1'>${pppcdto.pppcDtos[0].purchaseListDto.pl_delivery}</div></td>";
					chtml += "<td class='product-thumbnail'><c:forEach items='${pppcdto.pppcDtos}' var='pldto'>";
					chtml += "<div>";
					chtml += "<div id='font1'>${pldto.productDto.p_name}</div>";
					chtml += "<hr>";
					chtml += "</div>";
					chtml += "</c:forEach></td>";
					chtml += "<td><c:forEach items='${pppcdto.pppcDtos}' var='pldto'>";
					chtml += "<div class='fontsize1' id='height3'>";
					chtml += "<fmt:formatNumber value='${pldto.productDto.p_price}' pattern='#,###'/>";
					chtml += " 원/ ${pldto.purchaseListDto.pl_num} 개</div>";
					chtml += "<hr>";
					chtml += "</c:forEach></td>";
					chtml += "<td>";
					chtml += "<div class='fontsize1' id='height3'>";
					chtml += "<div id='num4' class='fontsize1'>";
					chtml += "<c:if test='${pppcdto.cancelDto.c_appr eq \'N\'}'>";
					chtml += "<button type='button' class='btn btn-primary btn-sm btn-block' id='request1' onclick='apprBtn(${pppcdto.cancelDto.c_no})'>";
					chtml += "<c:if test='${pppcdto.cancelDto.cc_no==1}'>";
					chtml += "<span id='request2'>주문취소</span>";
					chtml += "</c:if>";
					chtml += "<c:if test='${pppcdto.cancelDto.cc_no==2}'>";
					chtml += "<span id='request2'>반품</span>";
					chtml += "</c:if>";
					chtml += "<c:if test='${pppcdto.cancelDto.cc_no==3}'>";
					chtml += "<span id='request2'>교환</span>";
					chtml += "</c:if>";
					chtml += "</button>";
					chtml += "</c:if>";
					chtml += "</div>";
					chtml += "</div>";
					chtml += "</td>";
					chtml += "</tr>";
					chtml += "</c:forEach>";

					$("#tbody1").append(chtml);
				});/* 더보기 버튼 */
				
			});
			/* 승인 버튼 */
			function apprBtn(c_no){
				
				location.href="./man_product_appr?c_no="+c_no;
				
			}
			

		
	</script>

</head>
<body>
	<div class="site-wrap">
		<div class="bg-light py-3"></div>
		<div class="site-section">
			<div class="container" id="container1">
				<hr>
				<div id="title1">주문 취소 관리</div>
				<hr>
				<div id="title2">주문 목록</div>
				<br>
				<div class="row mb-5">
					<form class="col-md-12" method="post">
						<div class="site-blocks-table">
							<table class="table table-bordered">
								<thead>
									<tr>
										<th class="product-thumbnail">날짜/주문번호</th>
										<th class="product-name">배송지</th>
										<th class="product-price">상품명</th>
										<th class="product-quantity">상품금액/수량</th>
										<th class="product-total">주문상태</th>
									</tr>
								</thead>
								<tbody id="tbody1">
								<!-- 02 --><!-- 리스트 3번째까지만 불러오기 -->
									<c:forEach items="${pppclist}" var="pppcdto" begin="0" end="2">

										<tr id="${pppcdto.payDto.py_no}">
											<td class="product-name">
												<div id="height1">
													<div id="num1" class="fontsize1">${pppcdto.cancelDto.c_reqdate}</div>
													<br>
													<div id="num2" class="fontsize1">${pppcdto.cancelDto.py_no}</div>
													<br>

												</div>
											</td>
											<td><div class="fontsize1" id="height1">${pppcdto.pppcDtos[0].purchaseListDto.pl_delivery}</div></td>
											<td class="product-thumbnail"><c:forEach
													items="${pppcdto.pppcDtos}" var="pldto">
													<div>
														<div id="font1">${pldto.productDto.p_name}</div>
														<hr>
													</div>
												</c:forEach></td>
											<td><c:forEach items="${pppcdto.pppcDtos}" var="pldto">
													<div class="fontsize1" id="height3">
													<fmt:formatNumber value="${pldto.productDto.p_price}" pattern="#,###"/><!-- 29 -->
														원/ ${pldto.purchaseListDto.pl_num} 개</div>
													<hr>
												</c:forEach></td>
											<td>

												<div class="fontsize1" id="height3">
													<div id="num4" class="fontsize1">
														<c:if test="${pppcdto.cancelDto.c_appr eq 'N'}">
															<button type="button"
																class="btn btn-primary btn-sm btn-block" id="request1"
																onclick="apprBtn(${pppcdto.cancelDto.c_no})">
																<!-- 승인버튼 -->
																<c:if test="${pppcdto.cancelDto.cc_no==1}">
																	<span id="request2">주문취소</span>
																</c:if>
																<c:if test="${pppcdto.cancelDto.cc_no==2}">
																	<span id="request2">반품</span>
																</c:if>
																<c:if test="${pppcdto.cancelDto.cc_no==3}">
																	<span id="request2">교환</span>
																</c:if>
															</button>

														</c:if>
													</div>
												</div>

											</td>
										</tr>
										
									</c:forEach>
									
									<tr id='addbtn'><!-- 02 -->
										<td colspan="5">
											<div class="btns">
												<a class="btn btn-primary" id="addbutton1">더보기</a>
											</div>
										</td>
									</tr>
									
								</tbody>
							</table>
						</div>
					</form>
				</div>

			</div>
		</div>

	</div>

	<script src="../js/jquery-3.3.1.min.js"></script>
	<script src="../js/jquery-ui.js"></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/owl.carousel.min.js"></script>
	<script src="../js/jquery.magnific-popup.min.js"></script>
	<script src="../js/aos.js"></script>

	<script src="../js/main.js"></script>

</body>
</html>