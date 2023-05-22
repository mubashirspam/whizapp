import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whizapp/application/initialiize/initilize_bloc.dart';
import 'package:whizapp/core/theme/color.dart';

class ForceUpdate extends StatelessWidget {
  const ForceUpdate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // SizedBox(
          //   width: 70,
          //   child: Image.asset(
          //     Img.scheduleAlert,
          //     fit: BoxFit.cover,
          //   ),
          // ),
          const Padding(
            padding: EdgeInsets.only(top: 17),
            child: Text(
              'Your app version is out of date',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          BlocSelector<InitilizeBloc, InitilizeState, String>(
            selector: (state) {
              return state.message;
            },
            builder: (context, state) {
              return BlocBuilder<InitilizeBloc, InitilizeState>(
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      state.message,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  );
                },
              );
            },
          ),
          const SizedBox(
            height: 24,
          ),
          InkWell(
            onTap: () {
              forceUpdate();
            },
            child: Container(
              width: 132,
              height: 44,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.red,
              ),
              child: const Center(
                child: Text(
                  'Update Now',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }

  forceUpdate() async {
    if (Platform.isAndroid) {
      const url =
          'https://play.google.com/store/apps/details?id=com.irah.eduportlms';
      final uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalNonBrowserApplication);
      } else {
        throw 'Could not launch $url';
      }
    } else if (Platform.isIOS) {
      const url =
          'https://apps.apple.com/in/app/eduport-sslc-11-12-science/id6443499408';
      final uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalNonBrowserApplication);
      } else {
        throw 'Could not launch $url';
      }
    }
  }
}
