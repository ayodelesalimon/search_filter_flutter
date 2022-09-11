

import 'package:api_database/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'product_model.dart';

class ApiServices{
  Future <List<ProductModel>?> getProducts() async{
    try{
      var url = Uri.parse(APIConstants.baseUrl);
      var response = await http.get(url);
      if(response.statusCode == 200){
        List<ProductModel> productModel = productModelFromJson(response.body);
        if (kDebugMode) {
          print(productModel);
        }
            return productModel;
      }
      else {
        if (kDebugMode) {
          print('response.statusCode');
        }
        if (kDebugMode) {
          print('response.body');
        }
      }
    }
    catch (e){
      if (kDebugMode) {
        print(e.toString());
      }
    }
    return null;
  }
}

// class ApiUserServices{
//   Future <List<UserModel>?> getUsers() async{
//     try{
//       var url = Uri.parse(APIConstants.baseUrl + APIConstants.userUrl);
//       var response = await http.get(url);
//       if(response.statusCode == 200){
//         List<UserModel> userModel = userModelFromJson(response.body);
//         if (kDebugMode) {
//           print(userModel);
//         }
//         return userModel;
//       }
//       else {
//         if (kDebugMode) {
//           print('response.statusCode');
//         }
//         if (kDebugMode) {
//           print('response.body');
//         }
//       }
//     }
//     catch (e){
//       if (kDebugMode) {
//         print(e.toString());
//       }
//     }
//   }
// }

  // Future <List<ProductModel>?> products(ProductModel productModel) async{
  //   try{
  //     var url = Uri.parse(APIConstants.productUrl);
  //     var response = await http.get(url);
  //     if(response.statusCode == 200){
  //       List<ProductModel> productModel = productModelfromJson(response.body);
  //       if (kDebugMode) {
  //         print(productModel);
  //       }
  //       return productModel;
  //     }
  //     else {
  //       if (kDebugMode) {
  //         print('response.statusCode');
  //       }
  //       if (kDebugMode) {
  //         print('response.body');
  //       }
  //     }
  //   }
  //   catch (e){
  //     if (kDebugMode) {
  //       print(e.toString());
  //     }
  //   }
  // }