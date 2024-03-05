import 'package:api_del_up_creat/screen/home/home_screen.dart';
import 'package:api_del_up_creat/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context)  {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ScreenUtilInit(
      designSize: Size(width, height),
      builder: (context, child){
        ScreenUtil.init(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.cFFFFFF
          ),
          home: child
        );
      },
      child: const HomeScreen(),
    );
  }


}