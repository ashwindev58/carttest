class model_productdata {
  String productname;
  int price;
  int quantity;

  model_productdata({
    required this.productname,
    required this.price,
    this.quantity = 0,
  });
}

List<model_productdata> listProducts = [
  model_productdata(
    productname: "Acer Lap",
    price: 25000,
  ),
  model_productdata(
    productname: "Hp mouse",
    price: 15000,
  ),
  model_productdata(
    productname: "intex",
    price: 1500,
  ),
  model_productdata(
    productname: "inet Lap",
    price: 2300,
  ),
  model_productdata(
    productname: "apple Lap",
    price: 25800,
  ),
  model_productdata(
    productname: "keyboard",
    price: 25300,
  ),
];
List<model_productdata> listCart = [
  model_productdata(productname: "keyboard", price: 25000, quantity: 3),
  model_productdata(productname: "mouse", price: 2500, quantity: 5),
  model_productdata(productname: "screen", price: 1340, quantity: 5),
];
