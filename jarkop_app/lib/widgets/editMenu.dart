import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jarkop_app/Pages/modules/controllers/add_product_controller.dart';
import 'package:image_picker/image_picker.dart';
import '../Pages/modules/controllers/switch.dart';
// import '../Pages/modules/controllers/imageController.dart';

class EditMenu extends GetView<AddProductController> {
  bool isSwitched = false;
  String selectedValue = 'Kopi';

  var items = [
    'Kopi',
    'Makanan',
    'Snack',
  ];

  final ImagePicker imagePicker = ImagePicker();
  late ImageSource imageSource;
  late PickedFile _imageFile;
  String imageUrl = '';

  void uploadImage(ImageSource imageSource) async {
    final pickedImage = await imagePicker.pickImage(
        source: imageSource,
        preferredCameraDevice: CameraDevice.rear,
        imageQuality: 50);
    print('${pickedImage?.path}');
    if (pickedImage != null) {
      String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();

      /*Step 2: Upload to Firebase storage*/
      //Install firebase_storage
      //Import the library

      //Get a reference to storage root
      Reference referenceRoot = FirebaseStorage.instance.ref();
      Reference referenceDirImages = referenceRoot.child('images');

      //Create a reference for the image to be stored
      Reference referenceImageToUpload = referenceDirImages.child('name');

      //Handle errors/success
      try {
        //Store the file
        await referenceImageToUpload.putFile(File(pickedImage.path));
        //Success: get the download URL
        imageUrl = await referenceImageToUpload.getDownloadURL();
      } catch (error) {
        //Some error occurred
      }
    } else {
      print('No image selected.');
    }
  }

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    Get.put(AddProductController());
    return Scaffold(
        backgroundColor: Color(0xffF5ECE3),
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          backgroundColor: Colors.white,
          title: const Text(
            'Edit Item',
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
              SizedBox(height: 20),
              Container(
                width: 344,
                padding: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  controller: controller.nameC,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelStyle: TextStyle(color: Colors.grey),
                      labelText: "Nama"),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 344,
                padding: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  controller: controller.typesC,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelStyle: TextStyle(color: Colors.grey),
                      labelText: "Category (Kopi/Snack/Makanan)"),
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 80,
                width: 344,
                padding: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  controller: controller.descriptionC,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelStyle: TextStyle(color: Colors.grey),
                      labelText: "Description"),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 344,
                padding: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  controller: controller.priceC,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelStyle: TextStyle(color: Colors.grey),
                      labelText: "Price"),
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 30),
                      child: Text(
                        "Available",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'NotoSans'),
                      ),
                    ),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.only(right: 30),
                      child: MySwitch(initialValue: isSwitched),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 51,
                      width: 158,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton(
                        onPressed: () {
                          controller.addProduct(
                            controller.nameC.text,
                            controller.priceC as int,
                            controller.descriptionC.text,
                            controller.typesC.text,
                            imageUrl,
                          );
                        },
                        child: const Text(
                          "Edit",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'NotoSans'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              )
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
                onPressed: () {
                  uploadImage(ImageSource.camera);
                },
                tooltip: "Camera",
              ),
              IconButton(
                icon: Icon(Icons.image),
                onPressed: () {
                  uploadImage(ImageSource.gallery);
                },
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
                // image: DecorationImage(
                //   image: ,
                //   fit: BoxFit.cover)
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
