import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'api_services.dart';
// import 'model.dart';
import 'product_model.dart';
// import 'user_model.dart';
// import 'package:rive/rive.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // brightness: Brightness.dark,
        // shadowColor: Colors.lightGreen,
        primarySwatch: Colors.lightGreen,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // List<PostModel>? postModel = [];
  // getPostList() async {
  //   final data = await ApiServices().getPosts();
  //   setState(() {
  //     postModel = data;
  //   });
  // }
  // List<UserModel>? userModel = [];
  // getUserList() async {
  //   final data = await ApiUserServices().getUsers();
  //   setState(() {
  //     userModel = data?.cast<UserModel>();
  //     if (kDebugMode) {
  //       print(userModel![0].address!.street);
  //     }
  //   });
  // }
  late List<ProductModel> productModel = [];
  getProducts() async {
    final data = await ApiServices().getProducts();
    setState(() {
      productModel = data!;
      if (kDebugMode) {
        print(productModel);
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProducts();
    // getUserList();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 5,
      //   backgroundColor: CupertinoColors.separator,
      //   leading: IconButton(
      //     icon: const Icon(Icons.menu),
      //     onPressed: () {},
      //   ),
      //   actions: [
      //     IconButton(
      //       icon: const Icon(CupertinoIcons.bookmark),
      //       onPressed: () {},
      //     ),
      //     IconButton(
      //       icon: const Icon(CupertinoIcons.book_solid),
      //       onPressed: () {},
      //     ),
      //   ],
      //   centerTitle: true,
      //   title: const Text("Open Books",
      //     style: TextStyle(color: Colors.white,
      //         fontSize: 30),),
      // ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 5),
            child: Column(
              //AppBar with a color gradient style....
              children: [
                ClipPath(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width,
                    height: 120,
                    decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(
                          colors: [Color(0xFFFACCCC), Color(0xFFF6EFE9)],
                          // colors: [Colors.purple, Colors.blueAccent],
                          // begin: Alignment.bottomLeft,
                          // end: Alignment.topRight,
                          // stops: [0.4, 0.7],
                          // tileMode: TileMode.repeated,
                        ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text("Place Your Order",
                        style: TextStyle(fontSize: 35,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal),),
                        Icon(CupertinoIcons.shopping_cart, size: 40,),
                        Icon(Icons.storefront, size: 40,),
                      ],
                    ),
                  ),
                ),
                // SizedBox(
                //   height:500,
                //   width: MediaQuery.of(context).size.width,
                //   child: const RiveAnimation.network(
                //     // "https://rive.app/community/2513-5066-child-walking-loader.riv",
                //     'https://cdn.rive.app/animations/vehicles.riv',
                //     fit: BoxFit.cover,
                //   ),
                // ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.network("https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
                      height: 100, width: 110,),
                    Container(
                      padding: const EdgeInsets.all(2),
                      height: 200,
                      width: 300,
                      color: Colors.orangeAccent,
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: productModel.length,
                          itemBuilder: (BuildContext context, int index){
                            return ListTile(title: Text(productModel[index].title.toString(),
                              style: const TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 20),),
                              leading: const Icon(CupertinoIcons.book),
                              subtitle: Text(productModel[index].id.toString(),
                              style: const TextStyle(fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20),),);
                          }),
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.network( "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg",
                      height: 100, width: 110,),
                    Container(
                      padding: const EdgeInsets.all(2),
                      height: 200,
                      width: 300,
                      color: Colors.redAccent,
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: productModel.length,
                          itemBuilder: (BuildContext context, int index){
                            return ListTile(title: Text(productModel[index].title.toString(),
                              style: const TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 20),),
                              leading: const Icon(Icons.local_laundry_service),
                              subtitle: Text(productModel[index].id.toString(),
                                style: const TextStyle(fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 20),),);
                          }),
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.network("https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg",
                      height: 100, width: 110,),
                    Container(
                      padding: const EdgeInsets.all(2),
                      height: 200,
                      width: 300,
                      color: Colors.pink,
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: productModel.length,
                          itemBuilder: (BuildContext context, int index){
                            return ListTile(title: Text(productModel[index].description.toString(),
                              style: const TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 20),),
                              leading: const Icon(Icons.checkroom_sharp),
                              subtitle: Text(productModel[index].id.toString(),
                                style: const TextStyle(fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 20),),);
                          }),
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.network("https://fakestoreapi.com/img/71YXzeOuslL._AC_UY879_.jpg",
                      height: 100, width: 110,),
                    Container(
                      padding: const EdgeInsets.all(2),
                      height: 200,
                      width: 300,
                      color: Colors.blueGrey,
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: productModel.length,
                          itemBuilder: (BuildContext context, int index){
                            return ListTile(title: Text(productModel[index].title.toString(),
                              style: const TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 20),),
                              leading: const Icon(Icons.man_sharp),
                              subtitle: Text(productModel[index].id.toString(),
                                style: const TextStyle(fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 20),),);
                          }),
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.network("https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_.jpg",
                      height: 100, width: 110,),
                    Container(
                      padding: const EdgeInsets.all(2),
                      height: 200,
                      width: 300,
                      color: Colors.brown,
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: productModel.length,
                          itemBuilder: (BuildContext context, int index){
                            return ListTile(title: Text(productModel[index].title.toString(),
                              style: const TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 20),),
                              leading: const Icon(Icons.account_balance_wallet_sharp),
                              subtitle: Text(productModel[index].id.toString(),
                                style: const TextStyle(fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 20),),);
                          }),
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.network("https://fakestoreapi.com/img/61sbMiUnoGL._AC_UL640_QL65_ML3_.jpg",
                      height: 100, width: 110,),
                    Container(
                      padding: const EdgeInsets.all(2),
                      height: 200,
                      width: 300,
                      color: Colors.indigo,
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: productModel.length,
                          itemBuilder: (BuildContext context, int index){
                            return ListTile(title: Text(productModel[index].title.toString(),
                              style: const TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 20),),
                              leading: const Icon(Icons.watch_sharp),
                              subtitle: Text(productModel[index].id.toString(),
                                style: const TextStyle(fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 20),),);
                          }),
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.network("https://fakestoreapi.com/img/71YAIFU48IL._AC_UL640_QL65_ML3_.jpg",
                      height: 100, width: 110,),
                    Container(
                      padding: const EdgeInsets.all(2),
                      height: 200,
                      width: 300,
                      color: Colors.cyan,
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: productModel.length,
                          itemBuilder: (BuildContext context, int index){
                            return ListTile(title: Text(productModel[index].title.toString(),
                              style: const TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 20),),
                              leading: const Icon(Icons.diamond_sharp),
                              subtitle: Text(productModel[index].id.toString(),
                                style: const TextStyle(fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 20),),);
                          }),
                    ),
                  ],
                ),
              ],
            ),
          ),
      ),
    );
  }
}