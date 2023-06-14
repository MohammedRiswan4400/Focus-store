import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:focus_store/core/widgets/focus_widgets.dart';
import 'package:focus_store/presentation/extraS/widgets/extra_screens_main_widgets.dart';

import '../../../core/color/colors.dart';

class ScreenProfile extends StatefulWidget {
  const ScreenProfile({super.key, this.profile});
  final ModelProfile? profile;
  @override
  State<ScreenProfile> createState() => _ScreenProfileState();
}

class _ScreenProfileState extends State<ScreenProfile> {
  @override
  void initState() {
    super.initState();
    userNameController = TextEditingController(text: widget.profile?.userName);
    nickNameController =
        TextEditingController(text: widget.profile?.userNickName);
    ageController = TextEditingController(text: widget.profile?.dob);
    // useremailContrller = TextEditingController(text: widget.profile?.eMail);
    phoneController = TextEditingController(text: widget.profile?.phone);
    // sexController = TextEditingController(text: widget.profile?.sex);
  }

  PlatformFile? pickedFile;
  String? urlDownload;
  UploadTask? uploadTask;

  Future uploadFile() async {
    final path = "files/${pickedFile!.name}";
    final file = File(pickedFile!.path!);
    final ref = FirebaseStorage.instance.ref().child(path);

    setState(() {
      uploadTask = ref.putFile(file);
    });
    final snapshot = await uploadTask!.whenComplete(() {});

    urlDownload = await snapshot.ref.getDownloadURL();
    // print("Download Link: $urlDownload");

    setState(() {
      uploadTask = null;
    });
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    setState(() {
      pickedFile = result.files.first;
    });
  }

  TextEditingController? userNameController;

  TextEditingController? nickNameController;

  TextEditingController? ageController;

  TextEditingController? useremailContrller;

  TextEditingController? phoneController;

  TextEditingController? sexController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        leading: const AppbarPop(),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: AppBArTitle(title: "Edit Profile"),
        backgroundColor: Colors.white.withAlpha(200),
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
        shadowColor: colorTransperant,
        toolbarHeight: 60,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 35,
          right: 35,
          top: 10,
        ),
        child: ListView(
          children: [
            // const MySizedBox(h: 30, w: 0),
            Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: colorBlack,
                  radius: 40,
                  child: Center(
                    child: pickedFile != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.file(
                              File(
                                pickedFile!.path!,
                              ),
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(
                              50,
                            ),
                            child: Image.asset(
                              "assets/blank-profile-picture-973460__340.png",
                            ),
                          ),
                  ),
                ),
                Positioned(
                  left: 60,
                  bottom: 1,
                  right: 1,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          selectFile();
                          // log("message");
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: navBarColor,
                              border: Border.all(
                                color: unselectedItemsColor,
                                width: 2,
                              )),
                          height: 25,
                          width: 25,
                          child: const Icon(
                            Icons.edit,
                            size: 15,
                            color: colorBlack,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const MySizedBox(h: 20, w: 0),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: ConstrainedBox(
                constraints: const BoxConstraints.tightFor(height: 45),
                child: GestureDetector(
                  onTap: () {},
                  child: TextFormField(
                    controller: userNameController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      // suffixIcon: icon,
                      hintText: "Name",
                      // prefixIcon: const Icon(Icons.search_rounded),
                      hintStyle: const TextStyle(
                        fontFamily: "Ubuntu",
                        color: hintTextColor,
                        fontSize: 14,
                      ),
                      filled: true,
                      fillColor: navBarColor,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: ConstrainedBox(
                constraints: const BoxConstraints.tightFor(height: 45),
                child: GestureDetector(
                  onTap: () {},
                  child: TextFormField(
                    controller: nickNameController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      // suffixIcon: icon,
                      hintText: "Nick Name",
                      // prefixIcon: const Icon(Icons.search_rounded),
                      hintStyle: const TextStyle(
                        fontFamily: "Ubuntu",
                        color: hintTextColor,
                        fontSize: 14,
                      ),
                      filled: true,
                      fillColor: navBarColor,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: ConstrainedBox(
                constraints: const BoxConstraints.tightFor(height: 45),
                child: GestureDetector(
                  onTap: () {},
                  child: TextFormField(
                    controller: ageController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      suffixIcon: const Icon(Icons.calendar_month_rounded),
                      hintText: "Age",
                      // prefixIcon: const Icon(Icons.search_rounded),
                      hintStyle: const TextStyle(
                        fontFamily: "Ubuntu",
                        color: hintTextColor,
                        fontSize: 14,
                      ),
                      filled: true,
                      fillColor: navBarColor,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                    ),
                  ),
                ),
              ),
            ),
            // ProfileWithTextField(
            //   hintText: "Age",
            //   icon: const Icon(Icons.calendar_month_rounded),
            //   onTap: () {},
            //   keyboardType: TextInputType.datetime,
            // ),

            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: ConstrainedBox(
                constraints: const BoxConstraints.tightFor(height: 45),
                child: GestureDetector(
                  onTap: () {},
                  child: TextFormField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      suffixIcon: const Icon(Icons.phone_android_rounded),
                      hintText: "Phone",
                      // prefixIcon: const Icon(Icons.search_rounded),
                      hintStyle: const TextStyle(
                        fontFamily: "Ubuntu",
                        color: hintTextColor,
                        fontSize: 14,
                      ),
                      filled: true,
                      fillColor: navBarColor,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                    ),
                  ),
                ),
              ),
            ),

            ElevatedButton(
              onPressed: () async {
                await uploadFile();
                const CircularProgressIndicator();
                log(urlDownload!);
                final unerName = userNameController!.text.trim();
                final userNick = nickNameController!.text.trim();
                // final userMail = useremailContrller!.text.trim();
                final userAge = ageController!.text.trim();
                final userPhone = phoneController!.text.trim();
                // final usersex = sexController!.text.trim();
                userData(
                  userName: unerName,
                  userNickName: userNick,
                  dob: userAge,
                  // eMail: userMail,
                  phone: userPhone,
                  // sex: usersex,
                  pofilePhoto: urlDownload!,
                );

                // ignore: use_build_context_synchronously
                Navigator.of(context).pop();
                // ignore: use_build_context_synchronously
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Center(
                      child: Text(
                        "Profile Updated",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        30,
                      ),
                    ),
                    behavior: SnackBarBehavior.floating,
                    width: 200,
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  navBarColor,
                ),
              ),
              child: const Text(
                "Submit",
                style: TextStyle(
                  fontFamily: "Ubuntu",
                  color: unselectedItemsColor,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ModelProfile {
  String id;
  final String profilePhoto;
  final String userName;
  final String userNickName;
  final String dob;
  // final String eMail;
  final String phone;
  // final String sex;

  ModelProfile({
    this.id = "",
    required this.profilePhoto,
    required this.userName,
    required this.userNickName,
    required this.dob,
    // required this.eMail,
    required this.phone,
    // required this.sex,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "userName": userName,
        "userNickName": userNickName,
        "dob": dob,
        // "eMail": eMail,
        "phone": phone,
        // "sex": sex,
        "profilePhoto": profilePhoto,
      };
  static ModelProfile? fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }

    return ModelProfile(
      userName: json["userName"],
      profilePhoto: json["profilePhoto"],
      userNickName: json["userNickName"],
      dob: json["dob"],
      // eMail: json["eMail"],
      phone: json["phone"],
      // sex: json["sex"],
      id: json["id"],
    );
  }
}

// Stream<List<ModelProfile>> fetchDataFromProfile()

Future userData({
  required String userName,
  required String pofilePhoto,
  required String userNickName,
  required String dob,
  // required String eMail,
  required String phone,
  // required String sex,
}) async {
  final docUserData = FirebaseFirestore.instance
      .collection("user")
      .doc(FirebaseAuth.instance.currentUser!.email)
      .collection("profile")
      .doc("userProfile");

  final profile = ModelProfile(
    id: docUserData.id,
    profilePhoto: pofilePhoto,
    userName: userName,
    userNickName: userNickName,
    dob: dob,
    // eMail: eMail,
    phone: phone,
    // sex: sex,
  );
  final json = profile.toJson();

  await docUserData.set(json);
}
