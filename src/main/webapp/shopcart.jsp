<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>shopcart</title>
<link rel="stylesheet" href="css/font.css" type="text/css">
<link rel="stylesheet" href="css/shopcart.css" type="text/css">

<link
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined"
	rel="stylesheet" />
</head>


<body>
	<%@ include file="header.jsp"%>

	<div class="content_box">
		<div class="container">
			<div class="top">
				<div class="pro_box lay">
					<div>PRODUCT</div>
				</div>
				<div class="total_box lay">
					<div>Total Amount</div>
				</div>
				<div class="amount_box lay">
					<div>one Amount</div>
				</div>
				<div class="check_box lay">
					<div>CHECK</div>
				</div>
			</div>


			<div class="mid">
				<div class="item_box">
					<div class="product_item bc">
						<div class="img_box">
							<img src="img/shop-cart/jupiter1.png" alt="img" width="100%"
								height="100%">
						</div>
						<div class="title_box">{{ jupiter }}</div>
					</div>
					<div class="total_item bc">
						<div class="text_box">{{ datas.price }}</div>
					</div>
					<div class="amount_item bc">
						<div class="text_box">{{ 3000 }}</div>
					</div>
					<div class="check_item bc">
						<label class="check_icon_box"> <input type="checkbox"
							value="jupiter" name="selectedList"
							onclick="selectItem(value,3000)">
							<div class="circle">
								<span class="material-symbols-outlined">&#xe876</span>
							</div>

						</label>
					</div>
				</div>


				<!-- 반복문으로 바꿀 영역 -->
				<div class="item_box">
					<div class="product_item bc">
						<div class="img_box">
							<img src="img/shop-cart/jupiter1.png" alt="img" width="100%"
								height="100%">
						</div>
						<div class="title_box">{{ moon }}</div>
					</div>
					<div class="total_item bc">
						<div class="text_box">{{ datas.price }}</div>
					</div>
					<div class="amount_item bc">
						<div class="text_box">{{ 1000 }}</div>
					</div>
					<div class="check_item bc">
						<label class="check_icon_box"> <input type="checkbox"
							value="moon" name="selectedList" onclick="selectItem(value,1000)">
							<div class="circle">
								<span class="material-symbols-outlined">&#xe876</span>
							</div>
						</label>
					</div>
				</div>
				<div class="item_box">
					<div class="product_item bc">
						<div class="img_box">
							<img src="img/shop-cart/jupiter1.png" alt="img" width="100%"
								height="100%">
						</div>
						<div class="title_box">{{ earth }}</div>
					</div>
					<div class="total_item bc">
						<div class="text_box">{{ datas.price }}</div>
					</div>
					<div class="amount_item bc">
						<div class="text_box">{{ 1500 }}</div>
					</div>
					<div class="check_item bc">
						<label class="check_icon_box"> <input type="checkbox"
							value="earth" name="selectedList"
							onclick="selectItem(value,1500)">
							<div class="circle">
								<span class="material-symbols-outlined">&#xe876</span>
							</div>
						</label>
					</div>
				</div>
				<div class="item_box">
					<div class="product_item bc">
						<div class="img_box">
							<img src="img/shop-cart/jupiter1.png" alt="img" width="100%"
								height="100%">
						</div>
						<div class="title_box">{{ sun }}</div>
					</div>
					<div class="total_item bc">
						<div class="text_box">{{ datas.price }}</div>
					</div>
					<div class="amount_item bc">
						<div class="text_box">{{ 2000 }}</div>
					</div>
					<div class="check_item bc">
						<label class="check_icon_box"> <input type="checkbox"
							value="sun" name="selectedList" onclick="selectItem(value,2000)">
							<div class="circle">
								<span class="material-symbols-outlined">&#xe876</span>
							</div>
						</label>
					</div>
				</div>
				<div class="item_box">
					<div class="product_item bc">
						<div class="img_box">
							<img src="img/shop-cart/jupiter1.png" alt="img" width="100%"
								height="100%">
						</div>
						<div class="title_box">{{ mars }}</div>
					</div>
					<div class="total_item bc">
						<div class="text_box">{{ datas.price }}</div>
					</div>
					<div class="amount_item bc">
						<div class="text_box">{{ 4000 }}</div>
					</div>
					<div class="check_item bc">
						<label class="check_icon_box"> <input type="checkbox"
							value="mars" name="selectedList" onclick="selectItem(value,4000)">
							<div class="circle">
								<span class="material-symbols-outlined">&#xe876</span>
							</div>
						</label>
					</div>
				</div>
				<div class="item_box">
					<div class="product_item bc">
						<div class="img_box">
							<img src="img/shop-cart/jupiter1.png" alt="img" width="100%"
								height="100%">
						</div>
						<div class="title_box">{{ zeus }}</div>
					</div>
					<div class="total_item bc">
						<div class="text_box">{{ datas.price }}</div>
					</div>
					<div class="amount_item bc">
						<div class="text_box">{{ 5000 }}</div>
					</div>
					<div class="check_item bc">
						<label class="check_icon_box"> <input type="checkbox"
							value="zeus" name="selectedList" onclick="selectItem(value,5000)">
							<div class="circle">
								<span class="material-symbols-outlined">&#xe876</span>
							</div>
						</label>
					</div>
				</div>
				<!-- 반복문으로 바꿀 영역 -->

			</div>


			<div class="bot">
				<div class="bot_left" onclick="checkValue()">
					<div class="delete">삭제하기</div>

				</div>
				<div class="bot_right">
					<div class="right">Total:</div>
					<div class="text_box2">{{ datas.price }}</div>
				</div>
			</div>
		</div>
	</div>

</body>

<script>
	let priceAmount = 0;
	let selectedList = [];

	console.log('선택된 영역');

	function checkValue() {
		console.log(priceAmount);
		console.log(selectedList);

	}

	function selectItem(value, price) {

		console.log(value);
		console.log(price);

		priceAmount += price;
		selectedList.push(value);
		
		const target = document.querySelector('.text_box2');
		console.log('이벤트타겟');
		/* console.log(target); */

		target.innerText = priceAmount;
		
		
		
		 
		 console.log(event.target.parentElement.lastElementChild.classList);
		 event.target.parentElement.lastElementChild.classList.toggle('checked');
	}
</script>




</html>