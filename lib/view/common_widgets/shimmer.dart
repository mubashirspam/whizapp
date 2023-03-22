import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ShimmerElement extends StatelessWidget {
  final double height,width;
  const ShimmerElement({super.key,required this.height,required this.width});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
    color: Colors.black.withOpacity(.04),
         
          borderRadius: const BorderRadius.all(Radius.circular(16))),
    );
  
  }
}


class ShimmerLoadingScreen extends StatelessWidget {
  const ShimmerLoadingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: 
        Column(
            children: [
              SizedBox(height: 30,),
              ShimmerElement(height: 190, width: double.maxFinite),
                   Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     ShimmerElement(height: 25, width: 140),
                       ShimmerElement(height: 25, width: 140),
                   ],
                 ),
                   Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     ShimmerElement(height: 25, width: 140),
                       ShimmerElement(height: 25, width: 140),
                   ],
                 ),
                 ShimmerElement(height: 240, width: double.maxFinite),
                  ShimmerElement(height: 240, width: double.maxFinite),
            ],
          ),
        
      ),
    );
  }
}