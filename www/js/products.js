jQuery("document").ready(function() {
	new ProductRouter();
});

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
	
	sUrlprefix:"",
	onDeviceReady:function() {
		this.sUrlprefix = "http://prog1520-anorris.rhcloud.com/";
		this.getProducts();
	},
	
	initialize : function() {	
		document.addEventListener('deviceready', jQuery.proxy(this.onDeviceReady,this), false);	
		this.getProducts();
	},
	
	getProducts:function() {
		jQuery.ajax({url: this.sUrlprefix + "products.jsp", dataType: "json"})
		.done(jQuery.proxy(this.renderList, this))
		.fail(function(err){
			console.log(err);
		});
	}
});
