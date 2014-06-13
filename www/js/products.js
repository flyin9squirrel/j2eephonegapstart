var app = null;

jQuery("document").ready(function() {
	app = new ProductRouter();
	
});

//var httpReq = new XMLHttpRequest();
//httpReq.setRequestHeader("Access-Control-Allow-Origin", "*");
//httpReq.setRequestHeader('Content-type', 'application/ecmascript');
//    httpReq.setRequestHeader('Access-Control-Allow-Origin', '*');
//    console.log('ok');
// var url = "http://prog1520-anorris.rhcloud.com/";
// var xhr = createCORSRequest('GET', url);
// xhr.send();

var ProductRouter = Backbone.Router.extend({
	fTemplateList : _.template(jQuery("#productTemplate").html()),
	aProducts : null,
	renderList : function(aProduct) {
		this.aProducts = aProduct;
		jQuery("#productList").html("");
		for (var n = 0; n < aProduct.length; n++) {
			var oProduct = aProduct[n];
			oProduct.id = n;
			jQuery("#productList").append(this.fTemplateList(oProduct));
			jQuery("#product" + n).load(oProduct.paypal);
		}
	},
	
	sUrlprefix:"http://prog1520-anorris.rhcloud.com/",
	onDeviceReady:function() {
		app.sUrlprefix = "http://prog1520-anorris.rhcloud.com/";
		app.getProducts(); 
	},
	
	initialize : function() {	
		document.addEventListener('deviceready', this.onDeviceReady.bind(this), false);	
		this.getProducts();
	},
	
	getProducts:function() {
		jQuery.ajax({url: this.sUrlprefix + "products.jsp", dataType: "json"})
		.done(jQuery.proxy(this.renderList, this))
		.fail(function(err){
			console.log(err);
		});
	},
});