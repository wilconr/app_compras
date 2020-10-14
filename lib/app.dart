import 'package:compras/models/products_model.dart';
import 'package:compras/pages/list_orders.dart';
import 'package:compras/pages/next_pages.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Compras',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'App Compras'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ProductsModel> _productsModel = List<ProductsModel>();
  List<ProductsModel> _listaCarrito = List<ProductsModel>();

  @override
  void initState() {
    super.initState();
    _productsDb();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              right: 16.0,
              top: 8.0,
            ),
            child: GestureDetector(
              child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Icon(
                    Icons.shopping_cart,
                    size: 38,
                  ),
                  if (_listaCarrito.length > 0)
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 2.0,
                      ),
                      child: CircleAvatar(
                        radius: 8.0,
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        child: Text(
                          _listaCarrito.length.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                    )
                ],
              ),
              onTap: () {
                if (_listaCarrito.isNotEmpty)
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Cart(_listaCarrito),
                    ),
                  );
              },
            ),
          )
        ],
      ),
      drawer: Container(
        width: 170.0,
        child: Drawer(
          child: Container(
            // width: MediaQuery.of(context).size.width = 0.5,
            color: Colors.green,
            child: ListView(
              padding: EdgeInsets.only(top: 50.0),
              children: [
                Container(
                  height: 120,
                  child: UserAccountsDrawerHeader(
                    accountName: Text(''),
                    accountEmail: Text(''),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        // fit: BoxFit.fill,
                        image: AssetImage(
                            'assets/images/shoping.png'),
                      ),
                    ),
                  ),
                ),
                Divider(
                  color: Colors.white,
                ),
                ListTile(
                  title: Text(
                    'Home',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  trailing: Icon(
                    Icons.home,
                    size: 30.0,
                    color: Colors.white,
                  ),
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => NextPage())),
                ),
                Divider(
                  color: Colors.white,
                ),
                ListTile(
                  title: Text(
                    'Cupones',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  trailing: Icon(
                    Icons.card_membership,
                    size: 30.0,
                    color: Colors.white,
                  ),
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => NextPage())),
                ),
                Divider(
                  color: Colors.white,
                ),
                ListTile(
                  title: Text(
                    'Tiendas',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  trailing: Icon(
                    Icons.place,
                    size: 30.0,
                    color: Colors.white,
                  ),
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => NextPage())),
                ),
                Divider(
                  color: Colors.white,
                ),
                ListTile(
                  title: Text(
                    'Productos',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  trailing: Icon(
                    Icons.fastfood,
                    size: 30.0,
                    color: Colors.white,
                  ),
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => NextPage())),
                ),
                Divider(
                  color: Colors.white,
                ),
                ListTile(
                  title: Text(
                    'QR Code',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  trailing: Icon(
                    Icons.qr_code,
                    size: 30.0,
                    color: Colors.white,
                  ),
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => NextPage())),
                ),
                Divider(
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
      body: _squareProducts(),
    );
  }

  GridView _squareProducts() {
    return GridView.builder(
      padding: const EdgeInsets.all(4.0),
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: _productsModel.length,
      itemBuilder: (context, index) {
        final String image = _productsModel[index].image;
        var item = _productsModel[index];
        return Card(
          elevation: 4.0,
          child: Stack(
            fit: StackFit.loose,
            alignment: Alignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      child: Image.asset(
                    "assets/images/$image",
                    fit: BoxFit.contain,
                  )),
                  Text(
                    item.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20.0),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        item.price.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 23.0,
                            color: Colors.black),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 8.0,
                          bottom: 8.0,
                        ),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: GestureDetector(
                            child: (!_listaCarrito.contains(item))
                                ? Icon(
                                    Icons.shopping_cart,
                                    color: Colors.green,
                                    size: 38,
                                  )
                                : Icon(
                                    Icons.shopping_cart,
                                    color: Colors.red,
                                    size: 38,
                                  ),
                            onTap: () {
                              setState(() {
                                if (!_listaCarrito.contains(item))
                                  _listaCarrito.add(item);
                                else
                                  _listaCarrito.remove(item);
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  void _productsDb() {
    var list = <ProductsModel>[
      ProductsModel(
        name: 'Burger King',
        image: 'food1.png',
        price: 12000,
      ),
      ProductsModel(
        name: 'Empanadas',
        image: 'food2.png',
        price: 2000,
      ),
      ProductsModel(
        name: 'Pizza',
        image: 'food3.png',
        price: 5000,
      ),
      ProductsModel(
        name: 'Postre',
        image: 'food4.png',
        price: 10000,
      ),
      ProductsModel(
        name: 'Asado',
        image: 'food5.png',
        price: 15000,
      ),
      ProductsModel(
        name: 'Desayuno',
        image: 'food6.png',
        price: 6000,
      ),
      ProductsModel(
        name: 'Guisado',
        image: 'food7.png',
        price: 9000,
      ),
      ProductsModel(
        name: 'Panqueque',
        image: 'food8.png',
        price: 4000,
      ),ProductsModel(
        name: 'Sushi',
        image: 'food9.png',
        price: 25000,
      ),ProductsModel(
        name: 'Waffle',
        image: 'food10.png',
        price: 7000,
      ),
    ];

    setState(() {
      _productsModel = list;
    });
  }
}
