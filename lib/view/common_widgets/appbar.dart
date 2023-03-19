import 'package:flutter/material.dart';

PreferredSizeWidget appBar(
    BuildContext context, String title, String countAndName) {
  return AppBar(
    centerTitle: false,
   title:  Text(
            title,
            style: Theme.of(context).textTheme.headlineLarge,
            overflow: TextOverflow.ellipsis,
          ), 
    
    automaticallyImplyLeading: false,
    actions: [
     
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: SizedBox(width: 80,
              child: Text(
                    countAndName,
                    //overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headlineSmall,maxLines: 1,
              ),
            ),
          ),
        ),SizedBox()
      ],
   
  );
}
