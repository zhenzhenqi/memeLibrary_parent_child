<parent-child>
	<div class="memeMaker">
		<!-- ref or reference attribute is a quick way to "bookmark" an element so we can quickly access it in javascript later. -->
		<!-- E.g. HTML <img ref="xxx"/> -->
		<!-- E.g. JS this.refs.xxx points to the img tag prior -->
		<input type="text" ref="urlEl" placeholder="Enter url">
		<input type="text" ref="captionEl" placeholder="Enter caption">

		<button type="button" onclick={ addMeme }>Add Meme</button>
	</div>

	<div show={ myMemes.length == 0 }>
		<p>NO MEMEs</p>
	</div>

	<child each={ myMemes }>
	</child>

	<script>
		<!-- a js array to store all my Meme info -->
		console.log(this);

		this.myMemes = [
		{
			url: "https://pixel.nymag.com/imgs/daily/selectall/2016/08/11/11-gavin.w700.h700.jpg",
			caption: "when i first heard about js" },
		{
			url: "https://proxy.topixcdn.com/ipicimg/PKACK3N1SJ7P27PO-cp0x0x1328x664-fill810x415x",
			caption:"hihi" },
		{
			url: "http://indiannationalnews.com/wp-content/uploads/2017/10/hqdefault-1.jpg",
			caption: "hihihi" }
		];

		var that  =  this;

		this.remove = function(event) {
			console.log('EVENT:', event);
			// console.log('EVENT.ITEM', event.item);
			var memeObj = event.item;
			//in this context, since this function is invoked by child.tag. so this == child

			var index = that.myMemes.indexOf(memeObj);
			//remember the remove button is called by child. so we cannot type this to refer to the parent
			//we have to give it a new name
			that.myMemes.splice(index, 1);
			//try to comment out this line and see what happens
			//in riot, js object data value only gets updated by user event trigger.
			//since in this case, event is triggered by child, parent data won't be updated until
			//we call it to update manually.
			that.update();
		};

		this.addMeme = function(event) {
			console.log(event);
			var url = this.refs.urlEl.value;
			var caption = this.refs.captionEl.value;
			var meme = { url: url, caption: caption };
			// We are adding a book object to the source of truth array.
			this.myMemes.push(meme);
			// RESET INPUTS this.refs.urlEl.value = "";
			this.refs.captionEl.value = "";
		};
	</script>

	<style>
		:scope {
			display: block;
			background: #cddc39;
			padding: 15px;
		}
		img {
			width: 80%;
		}
	</style>

</parent-child>
