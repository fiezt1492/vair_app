import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:vair_app/controllers/product_detail_screen_controller.dart';
import 'package:vair_app/routes/app_pages.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductDetailScreenController _controller =
      Get.put(ProductDetailScreenController(), tag: Get.parameters['id']);

  ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: RefreshIndicator(
            onRefresh: _controller.onRefresh,
            child: _controller.obx(
                (state) => SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            if (state!.logo != null)
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CachedNetworkImage(
                                    imageUrl: state.logo!.uri.toString(),
                                    height: 80, // Adjust the height as needed
                                    width: 80, // Adjust the width as needed
                                    fit: BoxFit.cover,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ), // Add spacing between image and name
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ListTile(
                                          title: Text(state.name!),
                                          subtitle: Text(state.subtitle),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            const SizedBox(height: 10),
                            SizedBox(
                              width: double.infinity,
                              child: Obx(() => _controller
                                              .downloadStatus.value ==
                                          DownloadTaskStatus.running ||
                                      (_controller.isInstalling.isTrue &&
                                          _controller.isInstalled.isFalse)
                                  ? LinearProgressIndicator(
                                      value:
                                          _controller.downloadProgress.value > 0
                                              ? (_controller.downloadProgress
                                                          .value /
                                                      100)
                                                  .toDouble()
                                              : null,
                                    )
                                  : ElevatedButton(
                                      onPressed: _controller.token.value != null
                                          ? _controller.installClick
                                          : null,
                                      onLongPress: null,
                                      style: ButtonStyle(
                                        minimumSize: MaterialStateProperty.all(
                                            const Size(double.infinity,
                                                35)), // Adjust the height as needed
                                      ),
                                      child: Text(
                                          "${_controller.installButtonText}"),
                                    )),
                            ),
                            const SizedBox(height: 10),
                            if (state.banners != null &&
                                state.banners!.isNotEmpty)
                              Container(
                                height: 200,
                                child: PageView.builder(
                                  itemCount: state.banners!.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 3.0),
                                      child: CachedNetworkImage(
                                        imageUrl: state.banners![index].uri
                                            .toString(),
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            const SizedBox(height: 10),
                            ListTile(
                              contentPadding: const EdgeInsets.all(0),
                              title: const Text('Description'),
                              subtitle: Text(state.description!),
                            ),
                          ],
                        ),
                      ),
                    ),
                onLoading: const Padding(
                    padding: EdgeInsets.all(30),
                    child: CircularProgressIndicator()),
                onEmpty: const Text("No data found"),
                onError: (error) => Text(error!))));
  }
}
