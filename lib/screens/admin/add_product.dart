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
import 'package:food_app/providers/home/product_provider.dart';
import 'package:food_app/providers/home/reasturent_provider.dart';
import 'package:food_app/utils/app_colors.dart';
import 'package:food_app/utils/util_functions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  @override
  Widget build(BuildContext context) {
    final windowSize = UtilFunctions.windoSize(context);
    return Scaffold(
      body: FadeInRight(
        duration: Duration(seconds: 1),
        child: Consumer<ProductProvider>(
          builder: (context, value, child) {
            return Container(
              width: windowSize.width,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Header(
                      head1: "Products",
                      head2: "Add New Products",
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
                                hint: "Reasturent ID",
                                controller: value.reasIDController,
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              CustomTextFeild(
                                hint: "product name",
                                controller: value.productNameController,
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              CustomTextFeild(
                                hint: "product Price",
                                controller: value.productPriceController,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 21,
                        ),
                        SizedBox(
                          height: 21,
                        ),
                        value.isLording
                            ? CustomLorder()
                            : CustomButton(
                                windowSize: windowSize,
                                name: "Add New Product",
                                onPress: () async {
                                  value.addProduct(context);
                                },
                              ),
                        SizedBox(
                          height: 20,
                        ),
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: "I dot wont Add Products ",
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
