import 'dart:async';

import 'package:flutter/material.dart';
import 'package:whizapp/core/them/color.dart';



class OtpWidget extends StatefulWidget {
  final ValueChanged<String>? onCompleted;
  final List<TextEditingController> controllers;

  const OtpWidget({Key? key, this.onCompleted , required this.controllers}) : super(key: key);

  @override
  State<OtpWidget> createState() => _OtpWidgetState();
}

class _OtpWidgetState extends State<OtpWidget> {

  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());
 


  @override
  void initState() {
    super.initState();

    _focusNodes[0].requestFocus();
    for (var i = 0; i < _focusNodes.length; i++) {
      widget.controllers[i].addListener(() {
        if (widget.controllers[i].text.isNotEmpty && i < widget.controllers.length - 1) {
          _focusNodes[i + 1].requestFocus();
        }
        if (widget.controllers[i].text.isNotEmpty && i == widget.controllers.length - 1) {
          var otp = "";
          for (var controller in widget.controllers) {
            otp += controller.text;
          }
          widget.onCompleted?.call(otp);
        }
      });
    }
    //// Timer ==========================
  
  }

  @override
  void dispose() {
    for (var node in _focusNodes) {
      node.dispose();
    }
    for (var controller in widget.controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
              6,
              (index) => Expanded(
                    child: SizedBox(
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: TextField(
                              cursorColor: AppColor.whiteLight,
                              controller: widget.controllers[index],
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              maxLength: 1,
                              focusNode: _focusNodes[index],
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: AppColor.whiteLight.withOpacity(0.1),
                                counter: const Offstage(),
                                enabled: true,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          AppColor.textwhiteLight.withOpacity(0.3),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: AppColor.whiteLight, width: 1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              style: const TextStyle(fontSize: 24.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
        ),
    
      ],
    );
  }
}
