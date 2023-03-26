import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

import 'package:get/get.dart';


import 'package:whizapp/core/theme/color.dart';




class PdfPage extends StatelessWidget {
  final String pdfUrl ,pdfName ;
  
  const PdfPage({super.key,required this.pdfUrl,this.pdfName ='' });

  @override
  Widget build(BuildContext context) {
  

    return Scaffold(
     appBar: PreferredSize(
      preferredSize: const Size(double.maxFinite, 50),
       child: AppBar(
        automaticallyImplyLeading: false,
     leading: IconButton(onPressed: (){
       Get.back();
     }, icon: const Icon(Icons.arrow_back_ios,color: AppColor.textPrimeryLight,size:20,)),
        title: Text(pdfName,style: Theme.of(context).textTheme.displayLarge,),
       ),
     ),
      body: SafeArea(child: const PDF(
        
      ).cachedFromUrl(
        pdfUrl
   ,
        placeholder: (double progress) => const Center(child: CircularProgressIndicator()),
        errorWidget: ( error) {
          log(error.runtimeType.toString());
          return const Center(child: Text("Error Occured",style: TextStyle(color: AppColor.redDanger),));
        } 
      ),
        
)
    );
  }
}