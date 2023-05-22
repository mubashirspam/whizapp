// To parse this JSON data, do
//
//     final helpCenterModel = helpCenterModelFromJson(jsonString);

import 'dart:convert';

HelpCenterModel helpCenterModelFromJson(String str) => HelpCenterModel.fromJson(json.decode(str));

String helpCenterToJson(HelpCenterModel data) => json.encode(data.toJson());

class HelpCenterModel {
    HelpCenterModel({
        this.isAvailable,
        this.data,
    });

    bool? isAvailable;
    Data? data;

    factory HelpCenterModel.fromJson(Map<String, dynamic> json) => HelpCenterModel(
        isAvailable: json["isAvailable"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "isAvailable": isAvailable,
        "data": data?.toJson(),
    };
}

class Data {
    Data({
        this.admissionCallNo,
        this.admissionWhatsappNo,
        this.contentCallNo,
        this.contentWhatsappNo,
        this.techCallNo,
        this.techWhatsappNo,
    });

    int? admissionCallNo;
    int? admissionWhatsappNo;
    int? contentCallNo;
    int? contentWhatsappNo;
    int? techCallNo;
    int? techWhatsappNo;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        admissionCallNo: json["admission_call_no"],
        admissionWhatsappNo: json["admission_whatsapp_no"],
        contentCallNo: json["content_call_no"],
        contentWhatsappNo: json["content_whatsapp_no"],
        techCallNo: json["tech_call_no"],
        techWhatsappNo: json["tech_whatsapp_no"],
    );

    Map<String, dynamic> toJson() => {
        "admission_call_no": admissionCallNo,
        "admission_whatsapp_no": admissionWhatsappNo,
        "content_call_no": contentCallNo,
        "content_whatsapp_no": contentWhatsappNo,
        "tech_call_no": techCallNo,
        "tech_whatsapp_no": techWhatsappNo,
    };
}
