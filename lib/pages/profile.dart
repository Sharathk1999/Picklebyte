import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yumbite/core/colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  padding:
                      const EdgeInsets.only(top: 45.0, left: 20.0, right: 20.0),
                  height: MediaQuery.of(context).size.height / 4.3,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: btnColor,
                      borderRadius: BorderRadius.vertical(
                          bottom: Radius.elliptical(
                              MediaQuery.of(context).size.width, 105.0))),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 6.5),
                    child: Material(
                      elevation: 10.0,
                      borderRadius: BorderRadius.circular(60),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: GestureDetector(
                          onTap: () {},
                          child:  Image.asset(
                                  "assets/images/person.jpg",
                                  height: 120,
                                  width: 120,
                                  fit: BoxFit.cover,
                                ),
                              // : Image.network(
                              //     profile!,
                              //     height: 120,
                              //     width: 120,
                              //     fit: BoxFit.cover,
                              //   ),
                        ),
                        // Image.file(selectedImage!,  height: 120,
                        //     width: 120,
                        //     fit: BoxFit.cover,),
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 70.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Sharath",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 23.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Lato'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Material(
                borderRadius: BorderRadius.circular(10),
                elevation: 2.0,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15.0,
                    horizontal: 10.0,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Row(
                    children: [
                      Icon(
                        CupertinoIcons.person,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Name",
                            style: TextStyle(
                                fontFamily: 'Lato',
                                color: Colors.black,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "Sharath",
                            style: TextStyle(
                                fontFamily: 'Lato',
                                color: Colors.black,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Material(
                borderRadius: BorderRadius.circular(10),
                elevation: 2.0,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15.0,
                    horizontal: 10.0,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Row(
                    children: [
                      Icon(
                        CupertinoIcons.mail,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Email",
                            style: TextStyle(
                                fontFamily: 'Lato',
                                color: Colors.black,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "sharath@gmail.com",
                            style: TextStyle(
                                fontFamily: 'Lato',
                                color: Colors.black,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Material(
                borderRadius: BorderRadius.circular(10),
                elevation: 2.0,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15.0,
                    horizontal: 10.0,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Row(
                    children: [
                      Icon(
                        CupertinoIcons.doc_plaintext,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Terms and Condition",
                            style: TextStyle(
                                fontFamily: 'Lato',
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Material(
                  borderRadius: BorderRadius.circular(10),
                  elevation: 2.0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 10.0,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Row(
                      children: [
                        Icon(
                          CupertinoIcons.delete,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Delete Account",
                              style: TextStyle(
                                  fontFamily: 'Lato',
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Material(
                  borderRadius: BorderRadius.circular(10),
                  elevation: 2.0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 10.0,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.door_back_door_outlined,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Logout",
                              style: TextStyle(
                                  fontFamily: 'Lato',
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
