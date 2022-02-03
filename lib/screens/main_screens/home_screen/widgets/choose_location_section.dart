import 'package:flutter/material.dart';
import 'package:food_app/compononets/custom_svg.dart';
import 'package:food_app/compononets/custom_text.dart';
import 'package:food_app/compononets/custom_textFeild.dart';
import 'package:food_app/providers/user_provider.dart';
import 'package:food_app/utils/app_colors.dart';
import 'package:food_app/utils/global_data.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class ChooseLocationSection extends StatelessWidget {
  ChooseLocationSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, value, child) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 42),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                              const EdgeInsets.symmetric(horizontal: 118.0),
                          actions: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: primaryColor),
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
                          backgroundColor: Colors.transparent,
                          content: Container(
                            height: 110,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              children: [
                                CustomTextFeild(
                                  hint: "Enter your address here",
                                  controller: value.addressController,
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
    );
  }
}
