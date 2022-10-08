import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'api_services.dart';
import 'product_model.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key, required this.id}) : super(key: key);
  final int id;
  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  ProductModel productModel = ProductModel();
  bool isLoading = false;
  

  getDetail() async {
    setState(() {
      isLoading = true;
    });

    final data =
        await ApiServices().getProductsDetails(widget.id);
    setState(() {
      productModel = data!;
      isLoading = false;
      if (kDebugMode) {
        print(productModel);
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDetail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productModel.title.toString() ),
      ),

      body: isLoading ? const Center(
        child: CircularProgressIndicator(),
      ) : Center(
        child: Text(productModel.description!),
      ),
    );
  }
}
