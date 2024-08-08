import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/services/get_connect_controller.dart';

class GetConnectView extends GetView<GetConnectController> {
  const GetConnectView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Articles'),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (controller.articles.isEmpty) {
          return Center(child: Text('No articles found.'));
        }

        return ListView.builder(
          itemCount: controller.articles.length,
          itemBuilder: (context, index) {
            final article = controller.articles[index];
            return Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                leading: article.urlToImage != null
                    ? Image.network(article.urlToImage!,
                        width: 100, fit: BoxFit.cover)
                    : Text("Image not found"),
                title: Text(article.title),
                subtitle: article.description != null
                    ? Text(article.description!)
                    : Text("No description"),
                onTap: () {
                  // You can add functionality here for tapping on an article
                },
              ),
            );
          },
        );
      }),
    );
  }
}
