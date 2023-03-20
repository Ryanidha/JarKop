import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jarkop_app/Pages/modules/controllers/add_product_controller.dart';
import 'package:image_picker/image_picker.dart';

class AddMenu extends GetView<AddProductController> {
  late PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    Get.put(AddProductController());
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          backgroundColor: Colors.white,
          title: const Text(
            'Add Item',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'NotoSans',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              productImage(context),
            ],
          ),
        ));
  }

  Widget bottomSheet(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Photo",
            style: TextStyle(fontFamily: 'NotoSans'),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.camera),
                onPressed: () {},
                tooltip: "Camera",
              ),
              IconButton(
                icon: Icon(Icons.image),
                onPressed: () {},
                tooltip: "Gallery",
              ),
            ],
          )
        ],
      ),
    );
  }

 

  Widget productImage(BuildContext context) {
    return Center(
      child: Stack(
        children: <Widget>[
          Container(
              height: 274,
              width: 344,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey,
              )),
          Positioned(
            bottom: 20.0,
            right: 20.0,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: ((builder) => bottomSheet(context)));
              },
              child: Icon(
                Icons.camera_alt,
                color: Colors.white,
                size: 28.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
