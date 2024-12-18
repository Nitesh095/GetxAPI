import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({
    super.key,
    required this.url,
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.isPresent,
  });

  final String url;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final bool isPresent;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  double height = Get.height;
  double width = Get.width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: width * 1,
        height: height * 0.08,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey)),
        child: Padding(
          padding: EdgeInsets.only(
            top: height * 0.01,
            bottom: height * 0.01,
            left: width * 0.03,
            right: width * 0.025,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: Colors.cyanAccent,
                radius: width * 0.06,
                child: ClipOval(
                  child: Image(
                    image: NetworkImage(widget.url),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: width * 0.05,
              ),
              SizedBox(
                width: width * 0.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                          color: Colors.black, fontSize: width * 0.045),
                    ),
                    SizedBox(
                      height: height * 0.001,
                    ),
                    Text(
                      widget.subtitle,
                      style: TextStyle(
                          color: Colors.black, fontSize: width * 0.03),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: width * 0.09,
              ),
              GestureDetector(
                onTap: widget.onTap,
                child: Icon(
                  widget.isPresent
                      ? Icons.circle_notifications
                      : Icons.circle_notifications_outlined,
                  color: widget.isPresent ? Colors.grey : Colors.grey,
                  size: height * 0.03,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


//// component_view [FIle]
/// ComponetView [class]
/// getComponet [method]
/// GetBuilder [id]