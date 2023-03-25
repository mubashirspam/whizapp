import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:whizapp/view/common_widgets/appbar.dart';



class PdfPage extends StatelessWidget {
  final String pdfUrl ;
  const PdfPage({super.key,required this.pdfUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: appBar(context, 'pdf', ''),
      body: SafeArea(child: const PDF(
        
      ).cachedFromUrl(
     pdfUrl ,
        placeholder: (double progress) => const Center(child: CircularProgressIndicator()),
        errorWidget: (dynamic error) => Center(child: Text("Error Occured")),
      ),
        
)
    );
  }
}