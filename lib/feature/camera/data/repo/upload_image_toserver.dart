import 'dart:io';

import 'package:dio/dio.dart';

Future<dynamic> uploadImageToServer(File imageFile) async {
  Dio dio = Dio();
  FormData formData = FormData.fromMap({
    "image": await MultipartFile.fromFile(
      imageFile.path,
      filename: "upload.jpg",
    ),
  });

  final response = await dio.post(
    "https://your-api.com/upload", // 👈 غيره
    data: formData,
    // options: Options(
    //   headers: {
    //     "Authorization": "Bearer TOKEN",
    //   },
    // ),
  );
}
