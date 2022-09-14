
import 'package:api_database/details.dart';
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
  TextEditingController searchTEC = TextEditingController();
  bool isLoading = false;
  late List<ProductModel> productModel = [];
  late List<ProductModel> searchProductList = [];

  getProducts() async {
    setState(() {
      isLoading = true;
    });

    final data = await ApiServices().getProducts();
    setState(() {
      productModel = data!;
      searchProductList = data;
      isLoading = false;
      if (kDebugMode) {
        print(productModel);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getProducts();
    // getUserList();
  }

  searchProducts(String? search) {
    List<ProductModel> searchList = [];
    searchList.addAll(searchProductList);
    if (search!.isNotEmpty) {
      List<ProductModel> searchResults = [];
      for (var item in searchList) {
        if (item.title!.toLowerCase().contains(search.toLowerCase())) {
          searchResults.add(item);
        }
      }
      setState(() {
        productModel = searchResults;
      });

      return;
    } else {
      productModel = searchProductList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(),
          body: isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                )
              : productModel.isNotEmpty
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: SingleChildScrollView(
                        child: Column(
                          //AppBar with a color gradient style....
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  child: ListView.builder(
                                      physics: const BouncingScrollPhysics(),
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: productModel.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return ListTile(
                                          onTap: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return DetailScreen(
                                                  id: productModel[index].id!);
                                            }));
                                          },
                                          title: Text(
                                            productModel[index]
                                                .title
                                                .toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                          leading: Image.network(
                                            productModel[index]
                                                .image
                                                .toString(),
                                            height: 100,
                                            width: 100,
                                            fit: BoxFit.cover,
                                          ),
                                          subtitle: Text(
                                            "NGN " +
                                                productModel[index]
                                                    .price
                                                    .toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red,
                                                fontSize: 14),
                                          ),
                                        );
                                      }),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  : const Center(
                      child: Text("No Product is available"),
                    )),
    );
  }
}
