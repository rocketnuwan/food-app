import 'package:animate_do/animate_do.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_app/compononets/custom_header.dart';
import 'package:food_app/compononets/custom_lorder.dart';
import 'package:food_app/compononets/custom_svg.dart';
import 'package:food_app/compononets/custom_text.dart';
import 'package:food_app/compononets/custom_textFeild.dart';
import 'package:food_app/compononets/custom_button.dart';
import 'package:food_app/providers/auth/registration_provider.dart';
import 'package:food_app/providers/home/reasturent_provider.dart';
import 'package:food_app/utils/app_colors.dart';
import 'package:food_app/utils/util_functions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddReasturent extends StatefulWidget {
  const AddReasturent({Key? key}) : super(key: key);

  @override
  _AddReasturentState createState() => _AddReasturentState();
}

class _AddReasturentState extends State<AddReasturent> {
  @override
  Widget build(BuildContext context) {
    final windowSize = UtilFunctions.windoSize(context);
    return Scaffold(
      body: FadeInRight(
        duration: Duration(seconds: 1),
        child: Consumer<ReasturentProvider>(
          builder: (context, value, child) {
            return Container(
              width: windowSize.width,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Header(
                      head1: "Reasturent",
                      head2: "Create New Reasturent",
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              value.image.path != ""
                                  ? GestureDetector(
                                      onTap: () {
                                        value.selectImage();
                                      },
                                      child: Image.file(
                                        value.image,
                                        width: windowSize.width - 60,
                                        height: windowSize.width - 200,
                                        fit: BoxFit.fill,
                                      ),
                                    )
                                  : IconButton(
                                      onPressed: () {
                                        value.selectImage();
                                      },
                                      icon: Icon(Icons.image)),
                              SizedBox(
                                height: 16,
                              ),
                              CustomTextFeild(
                                hint: "Reasturent name",
                                controller: value.nameController,
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              CustomTextFeild(
                                hint: "about reasturent",
                                controller: value.aboutController,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 21,
                        ),
                        Consumer<ReasturentProvider>(
                          builder: (context, value, child) {
                            return Container(
                              padding: EdgeInsets.symmetric(horizontal: 42),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      CustomSVG(
                                        image: "location.svg",
                                      ),
                                      SizedBox(
                                        width: 13,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomText(text: "Your Location"),
                                          SizedBox(
                                            width: 300,
                                            child: CustomText(
                                              text: value.address,
                                              fontSize: 14,
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  InkWell(
                                    onTap: () {
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (context) => PlacePicker(
                                      //       apiKey: GlobalData
                                      //           .API_KEYY, // Put YOUR OWN KEY here. Should be the same for android and ios
                                      //       onPlacePicked: (result) {
                                      //         Logger().i(result.formattedAddress);
                                      //         Navigator.of(context).pop();
                                      //       },
                                      //       initialPosition: LatLng(7.8731, 80.7718),
                                      //       useCurrentLocation: true,
                                      //     ),
                                      //   ),
                                      // );

                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              actionsPadding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 118.0),
                                              actions: [
                                                ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          primary:
                                                              primaryColor),
                                                  onPressed: () {
                                                    value.setAddress();
                                                    Navigator.pop(context);
                                                  },
                                                  child: CustomText(
                                                    text: "OK",
                                                    alignment: Alignment.center,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: CustomText(
                                                    text: "Cancel",
                                                    alignment: Alignment.center,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                )
                                              ],
                                              backgroundColor:
                                                  Colors.transparent,
                                              content: Container(
                                                height: 200,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                                child: Column(
                                                  children: [
                                                    CustomTextFeild(
                                                      hint:
                                                          "Enter Reasturent address here",
                                                      controller: value
                                                          .addressController,
                                                      align: TextAlign.center,
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    CustomTextFeild(
                                                      hint:
                                                          "Enter Reasturent latitude",
                                                      controller:
                                                          value.latController,
                                                      align: TextAlign.center,
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    CustomTextFeild(
                                                      hint:
                                                          "Enter Reasturent  longitude",
                                                      controller:
                                                          value.lngController,
                                                      align: TextAlign.center,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              contentPadding: EdgeInsets.all(0),
                                            );
                                          });
                                    },
                                    child: CustomSVG(
                                      image: "settings.svg",
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: 21,
                        ),
                        value.isLording
                            ? CustomLorder()
                            : CustomButton(
                                windowSize: windowSize,
                                name: "ADD NEW REASTURENT",
                                onPress: () async {
                                  value.addReasturent(context);
                                },
                              ),
                        SizedBox(
                          height: 20,
                        ),
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: "I dot wont create Reasturent ",
                              style: GoogleFonts.poppins(
                                color: greyColor,
                                fontSize: 15,
                              ),
                            ),
                            TextSpan(
                                text: "  Cancel",
                                style: GoogleFonts.poppins(
                                  color: kblack,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    UtilFunctions.goBack(
                                      context,
                                    );
                                  }),
                          ]),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
