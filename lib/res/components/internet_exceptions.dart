import 'package:flutter/material.dart';

class InternetExceptions extends StatefulWidget {
  const InternetExceptions({super.key});

  @override
  State<InternetExceptions> createState() => _InternetExceptionsState();
}

class _InternetExceptionsState extends State<InternetExceptions> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SizedBox(
      height: height,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.cloud_off,
            size: height * 0.07,
          ),
          SizedBox(
            height: height * 0.02,
          ),
          const Text(
            "Internet Not Available\nPlease Check your data connection",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: height * 0.08,
          ),
          Container(
            width: width * 0.2,
            height: height * 0.04,
            decoration: BoxDecoration(
              color: Colors.redAccent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
              child: Text(
                "Retry",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 19),
              ),
            ),
          )
        ],
      ),
    );
  }
}
