function comment() {
	const submit = document.getElementById("submit");
	submit.addEventListener("click", (e) => {
		const formData = new FormData(document.getElementById("form"));
		console.log(...formData.entries());
		const XHR = new XMLHttpRequest();
		XHR.open("POST", `/lectures/${gon.lecture.id}/comments`, true);
		XHR.responseType = "json";
		XHR.send(formData);
		XHR.onload = function(){
			if (XHR.status != 200) {
				alert(`Error ${XHR.status}: ${XHR.statusText}`);
				return null;
			}
			const item = XHR.response.post;
			const list = document.getElementById("list");
			const formText = document.getElementById("content");
			const HTML = `
       			<div class="comment" data-id=${item.id}>
       		  		<div class="comment-date">
						投稿日時：${item.created_at}
       				</div>
         			<div class="post-content">
         				${item.text}
         			</div>
       			</div>`;
			list.insertAdjacentHTML("afterend", HTML);
			formText.value = "";
		};
		e.preventDefault();
	});

}
window.addEventListener("load", comment);