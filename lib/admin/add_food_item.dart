import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';
import 'package:yumbite/core/colors.dart';
import 'package:yumbite/services/db_service.dart';
import 'package:yumbite/widgets/helper_widget.dart';

class AddFoodItem extends StatefulWidget {
  const AddFoodItem({super.key});

  @override
  State<AddFoodItem> createState() => _AddFoodItemState();
}

class _AddFoodItemState extends State<AddFoodItem> {

  //Dropdown Category items
  final List<String> foodItems = ['Ice Cream', 'Pizza', 'Salad', 'Burger'];
  //current category item
  String? value;

  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  //Image Picker variables
  final ImagePicker _imagePicker = ImagePicker();
  File? selectedImg;
  
  //Getting the food item image
  Future getItemImage()async{
    var image = await _imagePicker.pickImage(source: ImageSource.gallery);
    selectedImg = File(image!.path);
    setState(() {
      
    });
  }

  //upload food item to db
  uploadFoodItemToDB()async{
    if (selectedImg!=null && nameController.text!="" && priceController.text!=""&&descriptionController.text!="") {
      String id = randomAlphaNumeric(10);
      Reference reference = FirebaseStorage.instance.ref().child("foodItemImages").child(id);
      final UploadTask task = reference.putFile(selectedImg!);
      
      //image download url
      var downloadUrl = await (await task).ref.getDownloadURL();

      Map<String, dynamic> addFoodItem = {
        "name": nameController.text.trim(),
        "price":priceController.text.trim(),
        "description":descriptionController.text.trim(),
        "image":downloadUrl,
      };
      //Adding foodItem to db(vale -> category value)
      await DataBaseServiceMethods().addFoodItemToDB(addFoodItem, value!).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green.shade300,
            content: const Text(
              "Food item upload successful...🍱👍",
              style: TextStyle(fontFamily: 'Lato', fontSize: 18),
            ),
          ),
        );
      });
    }
  }
  

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    priceController.dispose();
    descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Color(0xFF373866),
            )),
        centerTitle: true,
        title: Text(
          "Add Item",
          style: HelperWidget.headerTextStyle(),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(
              left: 20.0, right: 20.0, top: 20.0, bottom: 50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Upload Item Image",
                style: HelperWidget.semiBoldTextStyle(),
              ),
              const SizedBox(
                height: 20.0,
              ),
              selectedImg == null ? GestureDetector(
                onTap: () {
                  getItemImage();
                },
                child: Center(
                  child: Material(
                    elevation: 4.0,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: btnColor.withOpacity(0.3),
                        border: Border.all(color: Colors.black, width: 1.5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ): Center(
                child: Material(
                  elevation: 4.0,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1.5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.file(
                        selectedImg!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Text(
                "Item Name",
                style: HelperWidget.semiBoldTextStyle(),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: btnColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter item name",
                      hintStyle: HelperWidget.lightTextStyle()),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Text(
                "Item Price",
                style: HelperWidget.semiBoldTextStyle(),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: btnColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: priceController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter item price",
                      hintStyle: HelperWidget.lightTextStyle()),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Text(
                "Item Description",
                style: HelperWidget.semiBoldTextStyle(),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: btnColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  maxLines: 6,
                  controller: descriptionController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter item description",
                    hintStyle: HelperWidget.lightTextStyle(),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                "Select Category",
                style: HelperWidget.semiBoldTextStyle(),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: btnColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10)),
                child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                  items: foodItems
                      .map(
                        (item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          
                        ),
                        
                      )
                      .toList(),
                  onChanged: (newValue) => setState(() {
                    value=newValue;
                  }),
                  dropdownColor: Colors.white,
                  hint: const Text("Select Category"),
                  iconSize: 36,
                  icon: const Icon(
                    CupertinoIcons.chevron_down_circle,
                    size: 26,
                    color: btnColor,
                  ),
                  value: value,
                )),
              ),
              const SizedBox(
                height: 30.0,
              ),
              GestureDetector(
                onTap: () {
                  uploadFoodItemToDB();
                },
                child: Center(
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      width: 150,
                      decoration: BoxDecoration(
                          color: btnColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                        child: Text(
                          "Add Item",
                          style: TextStyle(
                              fontFamily: 'Lato',
                              color: Colors.white,
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
