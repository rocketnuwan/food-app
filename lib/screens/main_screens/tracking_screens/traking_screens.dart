import 'dart:async';
import 'package:flutter/material.dart';
import 'package:food_app/compononets/custom_svg.dart';
import 'package:food_app/compononets/custom_text.dart';
import 'package:food_app/utils/constants.dart';
import 'package:food_app/utils/util_functions.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackingScreen extends StatefulWidget {
  const TrackingScreen({Key? key}) : super(key: key);

  @override
  _TrackingScreenState createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    final windowSize = UtilFunctions.windoSize(context);
    return Scaffold(
      body: Stack(
        children: [
          Map(kGooglePlex: _kGooglePlex, controller: _controller),
          FooterSection(windowSize: windowSize)
        ],
      ),
    );
  }
}

class FooterSection extends StatelessWidget {
  const FooterSection({
    Key? key,
    required this.windowSize,
  }) : super(key: key);

  final Size windowSize;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: windowSize.width,
        height: windowSize.height / 20 * 9.5,
        child: Stack(
          children: [
            SizedBox(
              width: windowSize.width,
              height: windowSize.height / 20 * 9.5,
              child: Image.asset(
                Constants.imageAsset("TrackingFooter.png"),
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              top: 87,
              left: 32,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "Delivery time",
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  Row(
                    children: [
                      Icon(Icons.timer),
                      CustomText(
                        text: "20 Min",
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  OrderStatus(
                    status: "Order confirmed",
                    statustext: "Your order has been Confirmed",
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  OrderStatus(
                    status: "Order prepared",
                    statustext: "Your order has been prepared",
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  OrderStatus(
                    status: "Delivery in progress",
                    statustext: "Delivery in progress",
                    isCompleted: false,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderStatus extends StatelessWidget {
  const OrderStatus({
    Key? key,
    this.isCompleted = true,
    required this.status,
    required this.statustext,
  }) : super(key: key);

  final bool isCompleted;
  final String status;
  final String statustext;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomSVG(image: isCompleted ? "Check.svg" : "uncheck.svg"),
        SizedBox(
          width: 24,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: status,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            CustomText(
              text: statustext,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
      ],
    );
  }
}

class Map extends StatelessWidget {
  const Map({
    Key? key,
    required CameraPosition kGooglePlex,
    required Completer<GoogleMapController> controller,
  })  : _kGooglePlex = kGooglePlex,
        _controller = controller,
        super(key: key);

  final CameraPosition _kGooglePlex;
  final Completer<GoogleMapController> _controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 529,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
