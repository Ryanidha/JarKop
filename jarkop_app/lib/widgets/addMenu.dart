import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jarkop_app/controllers/add_product_controller.dart';
import 'package:image_picker/image_picker.dart';
import '../controllers/switch.dart';
// import '../Pages/modules/controllers/imageController.dart';

class AddMenu extends GetView<AddProductController> {
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
      Reference referenceDirImages = referenceRoot.child(pickedImage.path);

      //Create a reference for the image to be stored
      Reference referenceImageToUpload =
          referenceDirImages.child(pickedImage.path);

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
        backgroundColor: const Color(0xffF5ECE3),
        appBar: AppBar(
          iconTheme: const IconThemeData(
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
              const SizedBox(height: 20),
              productImage(context),
              const SizedBox(height: 20),
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
              const SizedBox(height: 20),
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
              const SizedBox(height: 20),
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
              const SizedBox(height: 20),
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
              const SizedBox(height: 20),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 30),
                      child: const Text(
                        "Available",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'NotoSans'),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.only(right: 30),
                      child: MySwitch(initialValue: isSwitched),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
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
                            controller.priceC.text ,
                            controller.descriptionC.text,
                            controller.typesC.text,
                            imageUrl,
                          );
                        },
                        child: const Text(
                          "Save",
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
              const SizedBox(
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
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          const Text(
            "Choose Photo",
            style: TextStyle(fontFamily: 'NotoSans'),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.camera),
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
          (imageUrl != null)
                              ? Container(
                                  height: 274,
                                  width: 344,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              imageUrl),
                                          fit: BoxFit.cover)))
                              : Container(
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
              child: const Icon(
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
