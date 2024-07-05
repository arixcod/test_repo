// // // // // // // // // // // import 'package:card_swiper/card_swiper.dart';
// // // // // // // // // // // import 'package:flutter/material.dart';
// // // // // // // // // // // import 'package:mandirwiki/util/image_constant.dart';
// // // // // // // // // // //
// // // // // // // // // // // class ExampleVertical extends StatelessWidget {
// // // // // // // // // // //   const ExampleVertical({Key? key}) : super(key: key);
// // // // // // // // // // //
// // // // // // // // // // //   @override
// // // // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // // // //     return Scaffold(
// // // // // // // // // // //       appBar: AppBar(
// // // // // // // // // // //         title: const Text('ExampleVertical'),
// // // // // // // // // // //       ),
// // // // // // // // // // //       body:Swiper(
// // // // // // // // // // //         itemBuilder: (BuildContext context, int index) {
// // // // // // // // // // //           return Image.network(
// // // // // // // // // // //             "https://plus.unsplash.com/premium_photo-1674168439997-b6c549230d71?q=80&w=1587&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
// // // // // // // // // // //             fit: BoxFit.fill,
// // // // // // // // // // //           );
// // // // // // // // // // //         },
// // // // // // // // // // //         itemCount: 10,
// // // // // // // // // // //         itemWidth: 300.0,
// // // // // // // // // // //         itemHeight: 400.0,
// // // // // // // // // // //         layout: SwiperLayout.TINDER,
// // // // // // // // // // //       )
// // // // // // // // // // //       // body: Swiper(
// // // // // // // // // // //       //   itemBuilder: (context, index) {
// // // // // // // // // // //       //     return Image.asset(
// // // // // // // // // // //       //       images[index],
// // // // // // // // // // //       //       fit: BoxFit.fill,
// // // // // // // // // // //       //     );
// // // // // // // // // // //       //   },
// // // // // // // // // // //       //   autoplay: false,
// // // // // // // // // // //       //   itemCount: images.length,
// // // // // // // // // // //       //   layout: SwiperLayout.STACK,
// // // // // // // // // // //       //   scrollDirection: Axis.vertical,
// // // // // // // // // // //       //   // pagination: const SwiperPagination(alignment: Alignment.centerRight),
// // // // // // // // // // //       //   control: const SwiperControl(),
// // // // // // // // // // //       // ),
// // // // // // // // // // //     );
// // // // // // // // // // //   }
// // // // // // // // // // // }
// // // // // // // // // // //
// // // // // // // // // // // final images = <String>[
// // // // // // // // // // //   ImageConstant.logo,
// // // // // // // // // // //   ImageConstant.ram_mandir,
// // // // // // // // // // //   ImageConstant.profile_pic,
// // // // // // // // // // // ];
// // // // // // // // // //
// // // // // // // // // // import 'package:animated_text_kit/animated_text_kit.dart';
// // // // // // // // // // import 'package:flutter/material.dart';
// // // // // // // // // //
// // // // // // // // // // class MyHomePage extends StatelessWidget {
// // // // // // // // // //   List skills = <String>[
// // // // // // // // // //     "Flutter Developer",
// // // // // // // // // //     "Content Creator",
// // // // // // // // // //     "YouTuber",
// // // // // // // // // //     "Blogger",
// // // // // // // // // //     "Public Speaker",
// // // // // // // // // //   ];
// // // // // // // // // //
// // // // // // // // // //   @override
// // // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // // //     return Scaffold(
// // // // // // // // // //       appBar: AppBar(
// // // // // // // // // //         title: Text("Portfolio"),
// // // // // // // // // //       ),
// // // // // // // // // //       body: Center(
// // // // // // // // // //           child: Column(
// // // // // // // // // //             mainAxisAlignment: MainAxisAlignment.center,
// // // // // // // // // //             children: [
// // // // // // // // // //               buildName(),
// // // // // // // // // //               buildAnimatedText(),
// // // // // // // // // //             ],
// // // // // // // // // //           )),
// // // // // // // // // //     );
// // // // // // // // // //   }
// // // // // // // // // //
// // // // // // // // // //   Widget buildName() => Text(
// // // // // // // // // //     "Hai, I'm xyz",
// // // // // // // // // //     style: TextStyle(fontSize: 35.00),
// // // // // // // // // //   );
// // // // // // // // // //
// // // // // // // // // //   Widget buildAnimatedText() => AnimatedTextKit(
// // // // // // // // // //     animatedTexts: [
// // // // // // // // // //       for (var i = 0; i < skills.length; i++) buildText(i),
// // // // // // // // // //     ],
// // // // // // // // // //     repeatForever: true,
// // // // // // // // // //     pause: const Duration(milliseconds: 50),
// // // // // // // // // //     displayFullTextOnTap: true,
// // // // // // // // // //     stopPauseOnTap: true,
// // // // // // // // // //   );
// // // // // // // // // //
// // // // // // // // // //   buildText(int index) {
// // // // // // // // // //     return TypewriterAnimatedText(
// // // // // // // // // //       skills[index],
// // // // // // // // // //       textStyle: const TextStyle(
// // // // // // // // // //         fontSize: 32.0,
// // // // // // // // // //         fontWeight: FontWeight.bold,
// // // // // // // // // //         color: Colors.blue,
// // // // // // // // // //       ),
// // // // // // // // // //       speed: const Duration(milliseconds: 100),
// // // // // // // // // //     );
// // // // // // // // // //   }
// // // // // // // // // // }
// // // // // // // // // import 'package:flutter/material.dart';
// // // // // // // // // import 'package:get/get.dart';
// // // // // // // // //
// // // // // // // // // void main() {
// // // // // // // // //   runApp(MyApp());
// // // // // // // // // }
// // // // // // // // //
// // // // // // // // // // Controller to manage the state
// // // // // // // // // class TextController extends GetxController {
// // // // // // // // //   // Observable variables to store the text for each container
// // // // // // // // //   var text1 = "Text 1".obs;
// // // // // // // // //   var text2 = "Text 2".obs;
// // // // // // // // //   var text3 = "Text 3".obs;
// // // // // // // // //
// // // // // // // // //   // Method to update text on tap
// // // // // // // // //   void changeText(int index) {
// // // // // // // // //     if (index == 1) {
// // // // // // // // //       text1.value = "New Text 1";
// // // // // // // // //     } else if (index == 2) {
// // // // // // // // //       text2.value = "New Text 2";
// // // // // // // // //     } else if (index == 3) {
// // // // // // // // //       text3.value = "New Text 3";
// // // // // // // // //     }
// // // // // // // // //   }
// // // // // // // // // }
// // // // // // // // //
// // // // // // // // // class MyApp extends StatelessWidget {
// // // // // // // // //   @override
// // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // //     return GetMaterialApp(
// // // // // // // // //       home: Scaffold(
// // // // // // // // //         appBar: AppBar(
// // // // // // // // //           title: Text('GetX Example'),
// // // // // // // // //         ),
// // // // // // // // //         body: Center(
// // // // // // // // //           child: Column(
// // // // // // // // //             mainAxisAlignment: MainAxisAlignment.center,
// // // // // // // // //             children: [
// // // // // // // // //               // Container 1
// // // // // // // // //               GestureDetector(
// // // // // // // // //                 onTap: () => Get.find<TextController>().changeText(1),
// // // // // // // // //                 child: Obx(() => Text(Get.find<TextController>().text1.value)),
// // // // // // // // //               ),
// // // // // // // // //               // Container 2
// // // // // // // // //               GestureDetector(
// // // // // // // // //                 onTap: () => Get.find<TextController>().changeText(2),
// // // // // // // // //                 child: Obx(() => Text(Get.find<TextController>().text2.value)),
// // // // // // // // //               ),
// // // // // // // // //               // Container 3
// // // // // // // // //               GestureDetector(
// // // // // // // // //                 onTap: () => Get.find<TextController>().changeText(3),
// // // // // // // // //                 child: Obx(() => Text(Get.find<TextController>().text3.value)),
// // // // // // // // //               ),
// // // // // // // // //             ],
// // // // // // // // //           ),
// // // // // // // // //         ),
// // // // // // // // //       ),
// // // // // // // // //     );
// // // // // // // // //   }
// // // // // // // // // }
// // // // // // // // //
// // // // // // // // //
// // // // // // // // //
// // // // // // // // // class TextController1 extends GetxController {
// // // // // // // // //   // Observable variables to store the text and color for each container
// // // // // // // // //   var texts = ["Text 1", "Text 2", "Text 3"].obs;
// // // // // // // // //   var selectedContainerIndex = 0.obs;
// // // // // // // // //
// // // // // // // // //   // Method to update text and container color on tap
// // // // // // // // //   void changeTextAndColor(int index) {
// // // // // // // // //     // Update the selected container index
// // // // // // // // //     selectedContainerIndex.value = index;
// // // // // // // // //     // Update the text for the selected container
// // // // // // // // //     texts[index] = "New Text ${index + 1}";
// // // // // // // // //   }
// // // // // // // // // }
// // // // // // // // //
// // // // // // // // // class MyApp1 extends StatelessWidget {
// // // // // // // // //   @override
// // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // //     Get.put(TextController1());
// // // // // // // // //     return Scaffold(
// // // // // // // // //       appBar: AppBar(
// // // // // // // // //         title: Text('GetX Example'),
// // // // // // // // //       ),
// // // // // // // // //       body: Center(
// // // // // // // // //         child: Column(
// // // // // // // // //           mainAxisAlignment: MainAxisAlignment.center,
// // // // // // // // //           children: List.generate(
// // // // // // // // //             3,
// // // // // // // // //                 (index) => GestureDetector(
// // // // // // // // //               onTap: () => Get.find<TextController1>().changeTextAndColor(index),
// // // // // // // // //               child: Obx(
// // // // // // // // //                     () => Container(
// // // // // // // // //                   width: 200,
// // // // // // // // //                   height: 50,
// // // // // // // // //                   color: index == Get.find<TextController1>().selectedContainerIndex.value
// // // // // // // // //                       ? Colors.blue // Change color for selected container
// // // // // // // // //                       : Colors.grey, // Change color for unselected containers
// // // // // // // // //                   alignment: Alignment.center,
// // // // // // // // //                   child: Text(
// // // // // // // // //                     Get.find<TextController1>().texts[index],
// // // // // // // // //                     style: TextStyle(
// // // // // // // // //                       color: index == Get.find<TextController1>().selectedContainerIndex.value
// // // // // // // // //                           ? Colors.white // Change text color for selected container
// // // // // // // // //                           : Colors.black, // Change text color for unselected containers
// // // // // // // // //                     ),
// // // // // // // // //                   ),
// // // // // // // // //                 ),
// // // // // // // // //               ),
// // // // // // // // //             ),
// // // // // // // // //           ),
// // // // // // // // //         ),
// // // // // // // // //       ),
// // // // // // // // //     );
// // // // // // // // //   }
// // // // // // // // // }
// // // // // // // // // Carousel Slider with dots indication in a Flutter app by maxonflutter
// // // // // // // // // YT: https://www.youtube.com/@MaxonFlutter/
// // // // // // // // // Courses: https://www.atomsbox.com/
// // // // // // // // import 'package:carousel_slider/carousel_slider.dart';
// // // // // // // // import 'package:dots_indicator/dots_indicator.dart';
// // // // // // // // import 'package:flutter/material.dart';
// // // // // // // //
// // // // // // // // void main() {
// // // // // // // //   runApp(const MyApp());
// // // // // // // // }
// // // // // // // //
// // // // // // // // class MyApp extends StatelessWidget {
// // // // // // // //   const MyApp({super.key});
// // // // // // // //
// // // // // // // //   @override
// // // // // // // //   Widget build(BuildContext context) {
// // // // // // // //     return MaterialApp(
// // // // // // // //       theme: ThemeData.light(useMaterial3: true),
// // // // // // // //       home: const CarouselSliderWithDots(),
// // // // // // // //     );
// // // // // // // //   }
// // // // // // // // }
// // // // // // // //
// // // // // // // // class CarouselSliderWithDots extends StatefulWidget {
// // // // // // // //   const CarouselSliderWithDots({
// // // // // // // //     super.key,
// // // // // // // //     this.items = const [
// // // // // // // //       'https://images.unsplash.com/photo-1688920556232-321bd176d0b4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80',
// // // // // // // //       'https://images.unsplash.com/photo-1689085781839-2e1ff15cb9fe?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80',
// // // // // // // //       'https://images.unsplash.com/photo-1688980034676-7e8ee518e75a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=735&q=80',
// // // // // // // //     ],
// // // // // // // //   });
// // // // // // // //
// // // // // // // //   final List<String> items;
// // // // // // // //
// // // // // // // //   @override
// // // // // // // //   State<CarouselSliderWithDots> createState() => _CarouselSliderWithDotsState();
// // // // // // // // }
// // // // // // // //
// // // // // // // // class _CarouselSliderWithDotsState extends State<CarouselSliderWithDots> {
// // // // // // // //   late CarouselController controller;
// // // // // // // //   int currentIndex = 0;
// // // // // // // //
// // // // // // // //   @override
// // // // // // // //   void initState() {
// // // // // // // //     controller = CarouselController();
// // // // // // // //     super.initState();
// // // // // // // //   }
// // // // // // // //
// // // // // // // //   @override
// // // // // // // //   Widget build(BuildContext context) {
// // // // // // // //     return Scaffold(
// // // // // // // //       appBar: AppBar(title: const Text('Carousel with Dots Indicator')),
// // // // // // // //       body: Stack(
// // // // // // // //         alignment: AlignmentDirectional.topCenter,
// // // // // // // //         children: [
// // // // // // // //           CarouselSlider(
// // // // // // // //             carouselController: controller,
// // // // // // // //             items: widget.items
// // // // // // // //                 .map(
// // // // // // // //                   (item) => Image.network(
// // // // // // // //                 item,
// // // // // // // //                 fit: BoxFit.cover,
// // // // // // // //                 width: double.infinity,
// // // // // // // //               ),
// // // // // // // //             )
// // // // // // // //                 .toList(),
// // // // // // // //             options: CarouselOptions(
// // // // // // // //               height: 400,
// // // // // // // //               autoPlay: true,
// // // // // // // //               onPageChanged: (index, reason) {
// // // // // // // //                 setState(() {
// // // // // // // //                   currentIndex = index;
// // // // // // // //                 });
// // // // // // // //               },
// // // // // // // //             ),
// // // // // // // //           ),
// // // // // // // //           Positioned(
// // // // // // // //             bottom: 8.0,
// // // // // // // //             child: DotsIndicator(
// // // // // // // //               dotsCount: widget.items.length,
// // // // // // // //               position: currentIndex,
// // // // // // // //               onTap: (index) {
// // // // // // // //                 controller.animateToPage(index);
// // // // // // // //               },
// // // // // // // //               decorator: DotsDecorator(
// // // // // // // //                 color: Colors.white,
// // // // // // // //                 activeColor: Colors.amber,
// // // // // // // //                 size: const Size.square(12.0),
// // // // // // // //                 activeSize: const Size(24.0, 12.0),
// // // // // // // //                 activeShape: RoundedRectangleBorder(
// // // // // // // //                   borderRadius: BorderRadius.circular(12.0),
// // // // // // // //                 ),
// // // // // // // //               ),
// // // // // // // //             ),
// // // // // // // //           ),
// // // // // // // //         ],
// // // // // // // //       ),
// // // // // // // //     );
// // // // // // // //   }
// // // // // // // // }
// // // // // // //
// // // // // // //
// // // // // // //
// // // // // // // import 'package:flutter/material.dart';
// // // // // // // import 'package:animated_text_kit/animated_text_kit.dart';
// // // // // // //
// // // // // // // class MyApp1111 extends StatefulWidget {
// // // // // // //   /// This widget is the root of your application.
// // // // // // //   @override
// // // // // // //   _MyAppState createState() => _MyAppState();
// // // // // // // }
// // // // // // //
// // // // // // // class _MyAppState extends State<MyApp1111> {
// // // // // // //   @override
// // // // // // //   Widget build(BuildContext context) {
// // // // // // //     return MaterialApp(
// // // // // // //       title: 'Animated Text Kit',
// // // // // // //       debugShowCheckedModeBanner: false,
// // // // // // //       theme: ThemeData.dark(),
// // // // // // //       home: MyHomePage(),
// // // // // // //     );
// // // // // // //   }
// // // // // // // }
// // // // // // //
// // // // // // // class MyHomePage extends StatefulWidget {
// // // // // // //   MyHomePage({Key? key}) : super(key: key);
// // // // // // //
// // // // // // //   @override
// // // // // // //   _MyHomePageState createState() => _MyHomePageState();
// // // // // // // }
// // // // // // //
// // // // // // // class _MyHomePageState extends State<MyHomePage> {
// // // // // // //   late List<AnimatedTextExample> _examples;
// // // // // // //   int _index = 0;
// // // // // // //   int _tapCount = 0;
// // // // // // //
// // // // // // //   @override
// // // // // // //   void initState() {
// // // // // // //     super.initState();
// // // // // // //     _examples = animatedTextExamples(onTap: () {
// // // // // // //       print('Tap Event');
// // // // // // //       setState(() {
// // // // // // //         _tapCount++;
// // // // // // //       });
// // // // // // //     });
// // // // // // //   }
// // // // // // //
// // // // // // //   @override
// // // // // // //   Widget build(BuildContext context) {
// // // // // // //     final animatedTextExample = _examples[_index];
// // // // // // //
// // // // // // //     return Scaffold(
// // // // // // //       appBar: AppBar(
// // // // // // //         title: Text(
// // // // // // //           animatedTextExample.label,
// // // // // // //           style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
// // // // // // //         ),
// // // // // // //       ),
// // // // // // //       body: Column(
// // // // // // //         children: <Widget>[
// // // // // // //           Expanded(
// // // // // // //             child: Container(),
// // // // // // //           ),
// // // // // // //           Container(
// // // // // // //             decoration: BoxDecoration(color: animatedTextExample.color),
// // // // // // //             height: 300.0,
// // // // // // //             width: 300.0,
// // // // // // //             child: Center(
// // // // // // //               key: ValueKey(animatedTextExample.label),
// // // // // // //               child: animatedTextExample.child,
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //           Expanded(
// // // // // // //             child: Container(
// // // // // // //               alignment: Alignment.center,
// // // // // // //               child: Text('Taps: $_tapCount'),
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //         ],
// // // // // // //       ),
// // // // // // //       floatingActionButton: FloatingActionButton(
// // // // // // //         onPressed: () {
// // // // // // //           setState(() {
// // // // // // //             _index = ++_index % _examples.length;
// // // // // // //             _tapCount = 0;
// // // // // // //           });
// // // // // // //         },
// // // // // // //         tooltip: 'Next',
// // // // // // //         child: const Icon(
// // // // // // //           Icons.play_circle_filled,
// // // // // // //           size: 50.0,
// // // // // // //         ),
// // // // // // //       ),
// // // // // // //     );
// // // // // // //   }
// // // // // // // }
// // // // // // //
// // // // // // // class AnimatedTextExample {
// // // // // // //   final String label;
// // // // // // //   final Color? color;
// // // // // // //   final Widget child;
// // // // // // //
// // // // // // //   const AnimatedTextExample({
// // // // // // //     required this.label,
// // // // // // //     required this.color,
// // // // // // //     required this.child,
// // // // // // //   });
// // // // // // // }
// // // // // // //
// // // // // // // // Colorize Text Style
// // // // // // // const _colorizeTextStyle = TextStyle(
// // // // // // //   fontSize: 50.0,
// // // // // // //   fontFamily: 'Horizon',
// // // // // // // );
// // // // // // //
// // // // // // // // Colorize Colors
// // // // // // // const _colorizeColors = [
// // // // // // //   Colors.purple,
// // // // // // //   Colors.blue,
// // // // // // //   Colors.yellow,
// // // // // // //   Colors.red,
// // // // // // // ];
// // // // // // //
// // // // // // // List<AnimatedTextExample> animatedTextExamples({VoidCallback? onTap}) =>
// // // // // // //     <AnimatedTextExample>[
// // // // // // //       AnimatedTextExample(
// // // // // // //         label: 'Rotate',
// // // // // // //         color: Colors.orange[800],
// // // // // // //         child: ListView(
// // // // // // //           scrollDirection: Axis.horizontal,
// // // // // // //           children: <Widget>[
// // // // // // //             Row(
// // // // // // //               mainAxisSize: MainAxisSize.min,
// // // // // // //               children: <Widget>[
// // // // // // //
// // // // // // //                 const Text(
// // // // // // //                   'Be',
// // // // // // //                   style: TextStyle(fontSize: 43.0),
// // // // // // //                 ),
// // // // // // //                 const SizedBox(
// // // // // // //                   width: 10.0,
// // // // // // //                   height: 10.0,
// // // // // // //                 ),
// // // // // // //                 DefaultTextStyle(
// // // // // // //                   style: TextStyle(
// // // // // // //                     fontSize: 40.0,
// // // // // // //                     fontFamily: 'Horizon',
// // // // // // //                   ),
// // // // // // //                   child: AnimatedTextKit(
// // // // // // //                     animatedTexts: [
// // // // // // //                       RotateAnimatedText('AWESOME'),
// // // // // // //                       RotateAnimatedText('OPTIMISTIC'),
// // // // // // //                       RotateAnimatedText(
// // // // // // //                         'DIFFERENT',
// // // // // // //                         textStyle: const TextStyle(
// // // // // // //                           decoration: TextDecoration.underline,
// // // // // // //                         ),
// // // // // // //                       ),
// // // // // // //                     ],
// // // // // // //                     onTap: onTap,
// // // // // // //                     isRepeatingAnimation: true,
// // // // // // //                     totalRepeatCount: 10,
// // // // // // //                   ),
// // // // // // //                 ),
// // // // // // //               ],
// // // // // // //             ),
// // // // // // //           ],
// // // // // // //         ),
// // // // // // //       ),
// // // // // // //       AnimatedTextExample(
// // // // // // //         label: 'Fade',
// // // // // // //         color: Colors.brown[600],
// // // // // // //         child: DefaultTextStyle(
// // // // // // //           style: const TextStyle(
// // // // // // //             fontSize: 32.0,
// // // // // // //             fontWeight: FontWeight.bold,
// // // // // // //           ),
// // // // // // //           child: AnimatedTextKit(
// // // // // // //             animatedTexts: [
// // // // // // //               FadeAnimatedText('do IT!'),
// // // // // // //               FadeAnimatedText('do it RIGHT!!'),
// // // // // // //               FadeAnimatedText('do it RIGHT NOW!!!'),
// // // // // // //             ],
// // // // // // //             onTap: onTap,
// // // // // // //           ),
// // // // // // //         ),
// // // // // // //       ),
// // // // // // //       AnimatedTextExample(
// // // // // // //         label: 'Typer',
// // // // // // //         color: Colors.lightGreen[800],
// // // // // // //         child: SizedBox(
// // // // // // //           width: 250.0,
// // // // // // //           child: DefaultTextStyle(
// // // // // // //             style: const TextStyle(
// // // // // // //               fontSize: 30.0,
// // // // // // //               fontFamily: 'Bobbers',
// // // // // // //             ),
// // // // // // //             child: AnimatedTextKit(
// // // // // // //               animatedTexts: [
// // // // // // //                 TyperAnimatedText('It is not enough to do your best,'),
// // // // // // //                 TyperAnimatedText('you must know what to do,'),
// // // // // // //                 TyperAnimatedText('and then do your best'),
// // // // // // //                 TyperAnimatedText('- W.Edwards Deming'),
// // // // // // //               ],
// // // // // // //               onTap: onTap,
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //         ),
// // // // // // //       ),
// // // // // // //       AnimatedTextExample(
// // // // // // //         label: 'Typewriter',
// // // // // // //         color: Colors.teal[700],
// // // // // // //         child: SizedBox(
// // // // // // //           width: 250.0,
// // // // // // //           child: DefaultTextStyle(
// // // // // // //             style: const TextStyle(
// // // // // // //               fontSize: 30.0,
// // // // // // //               fontFamily: 'Agne',
// // // // // // //             ),
// // // // // // //             child: AnimatedTextKit(
// // // // // // //               animatedTexts: [
// // // // // // //                 TypewriterAnimatedText('Discipline is the best tool'),
// // // // // // //                 TypewriterAnimatedText('Design first, then code', cursor: '|'),
// // // // // // //                 TypewriterAnimatedText('Do not patch bugs out, rewrite them',
// // // // // // //                     cursor: '<|>'),
// // // // // // //                 TypewriterAnimatedText('Do not test bugs out, design them out',
// // // // // // //                     cursor: '💡'),
// // // // // // //               ],
// // // // // // //               onTap: onTap,
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //         ),
// // // // // // //       ),
// // // // // // //       AnimatedTextExample(
// // // // // // //         label: 'Scale',
// // // // // // //         color: Colors.blue[700],
// // // // // // //         child: DefaultTextStyle(
// // // // // // //           style: const TextStyle(
// // // // // // //             fontSize: 70.0,
// // // // // // //             fontFamily: 'Canterbury',
// // // // // // //           ),
// // // // // // //           child: AnimatedTextKit(
// // // // // // //             animatedTexts: [
// // // // // // //               ScaleAnimatedText('Think'),
// // // // // // //               ScaleAnimatedText('Build'),
// // // // // // //               ScaleAnimatedText('Ship'),
// // // // // // //             ],
// // // // // // //             onTap: onTap,
// // // // // // //           ),
// // // // // // //         ),
// // // // // // //       ),
// // // // // // //       AnimatedTextExample(
// // // // // // //         label: 'Colorize',
// // // // // // //         color: Colors.blueGrey[50],
// // // // // // //         child: AnimatedTextKit(
// // // // // // //           animatedTexts: [
// // // // // // //             ColorizeAnimatedText(
// // // // // // //               'Larry Page',
// // // // // // //               textStyle: _colorizeTextStyle,
// // // // // // //               colors: _colorizeColors,
// // // // // // //             ),
// // // // // // //             ColorizeAnimatedText(
// // // // // // //               'Bill Gates',
// // // // // // //               textStyle: _colorizeTextStyle,
// // // // // // //               colors: _colorizeColors,
// // // // // // //             ),
// // // // // // //             ColorizeAnimatedText(
// // // // // // //               'Steve Jobs',
// // // // // // //               textStyle: _colorizeTextStyle,
// // // // // // //               colors: _colorizeColors,
// // // // // // //             ),
// // // // // // //           ],
// // // // // // //           onTap: onTap,
// // // // // // //         ),
// // // // // // //       ),
// // // // // // //       AnimatedTextExample(
// // // // // // //         label: 'TextLiquidFill',
// // // // // // //         color: Colors.white,
// // // // // // //         child: TextLiquidFill(
// // // // // // //           text: 'LIQUIDY',
// // // // // // //           waveColor: Colors.blueAccent,
// // // // // // //           boxBackgroundColor: Colors.redAccent,
// // // // // // //           textStyle: const TextStyle(
// // // // // // //             fontSize: 70,
// // // // // // //             fontWeight: FontWeight.bold,
// // // // // // //           ),
// // // // // // //           boxHeight: 300,
// // // // // // //         ),
// // // // // // //       ),
// // // // // // //       AnimatedTextExample(
// // // // // // //         label: 'Wavy Text',
// // // // // // //         color: Colors.purple,
// // // // // // //         child: DefaultTextStyle(
// // // // // // //           style: const TextStyle(
// // // // // // //             fontSize: 20.0,
// // // // // // //           ),
// // // // // // //           child: AnimatedTextKit(
// // // // // // //             animatedTexts: [
// // // // // // //               WavyAnimatedText(
// // // // // // //                 'Hello World',
// // // // // // //                 textStyle: const TextStyle(
// // // // // // //                   fontSize: 24.0,
// // // // // // //                   fontWeight: FontWeight.bold,
// // // // // // //                 ),
// // // // // // //               ),
// // // // // // //               WavyAnimatedText('Look at the waves'),
// // // // // // //               WavyAnimatedText('They look so Amazing'),
// // // // // // //             ],
// // // // // // //             onTap: onTap,
// // // // // // //           ),
// // // // // // //         ),
// // // // // // //       ),
// // // // // // //       AnimatedTextExample(
// // // // // // //         label: 'Flicker',
// // // // // // //         color: Colors.pink[300],
// // // // // // //         child: DefaultTextStyle(
// // // // // // //           style: const TextStyle(
// // // // // // //             fontSize: 35,
// // // // // // //             color: Colors.white,
// // // // // // //             shadows: [
// // // // // // //               Shadow(
// // // // // // //                 blurRadius: 7.0,
// // // // // // //                 color: Colors.white,
// // // // // // //                 offset: Offset(0, 0),
// // // // // // //               ),
// // // // // // //             ],
// // // // // // //           ),
// // // // // // //           child: AnimatedTextKit(
// // // // // // //             repeatForever: true,
// // // // // // //             animatedTexts: [
// // // // // // //               FlickerAnimatedText('Flicker Frenzy'),
// // // // // // //               FlickerAnimatedText('Night Vibes On'),
// // // // // // //               FlickerAnimatedText("C'est La Vie !"),
// // // // // // //             ],
// // // // // // //             onTap: onTap,
// // // // // // //           ),
// // // // // // //         ),
// // // // // // //       ),
// // // // // // //       AnimatedTextExample(
// // // // // // //         label: 'Combination',
// // // // // // //         color: Colors.pink,
// // // // // // //         child: AnimatedTextKit(
// // // // // // //           onTap: onTap,
// // // // // // //           animatedTexts: [
// // // // // // //             WavyAnimatedText(
// // // // // // //               'On Your Marks',
// // // // // // //               textStyle: const TextStyle(
// // // // // // //                 fontSize: 24.0,
// // // // // // //               ),
// // // // // // //             ),
// // // // // // //             FadeAnimatedText(
// // // // // // //               'Get Set',
// // // // // // //               textStyle: const TextStyle(
// // // // // // //                 fontSize: 32.0,
// // // // // // //                 fontWeight: FontWeight.bold,
// // // // // // //               ),
// // // // // // //             ),
// // // // // // //             ScaleAnimatedText(
// // // // // // //               'Ready',
// // // // // // //               textStyle: const TextStyle(
// // // // // // //                 fontSize: 48.0,
// // // // // // //                 fontWeight: FontWeight.bold,
// // // // // // //               ),
// // // // // // //             ),
// // // // // // //             RotateAnimatedText(
// // // // // // //               'Go!',
// // // // // // //               textStyle: const TextStyle(
// // // // // // //                 fontSize: 64.0,
// // // // // // //               ),
// // // // // // //               rotateOut: false,
// // // // // // //               duration: const Duration(milliseconds: 400),
// // // // // // //             )
// // // // // // //           ],
// // // // // // //         ),
// // // // // // //       ),
// // // // // // //     ];
// // // // // //
// // // // // // import 'package:flutter/material.dart';
// // // // // // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // // // // // import 'package:get/get.dart';
// // // // // // import 'package:mandirwiki/util/custom_component/custom_text.dart';
// // // // // //
// // // // // // class ContainerColorChanger extends StatelessWidget {
// // // // // //   final RxInt selectedContainer = 0.obs; // Using Rx for reactive programming
// // // // // //
// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     return Scaffold(
// // // // // //       appBar: AppBar(
// // // // // //         title: Text('Container Color Changer'),
// // // // // //       ),
// // // // // //       body: Center(
// // // // // //         child: Row(
// // // // // //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// // // // // //           children: [
// // // // // //             Obx(() => buildContainer(1, "Container 1")),
// // // // // //             Obx(() => buildContainer(2, "Container 2")),
// // // // // //             Obx(() => buildContainer(3, "Container 3")),
// // // // // //           ],
// // // // // //         ),
// // // // // //       ),
// // // // // //     );
// // // // // //   }
// // // // // //
// // // // // //   Widget buildContainer(int containerIndex, String text) {
// // // // // //     return GestureDetector(
// // // // // //       onTap: () {
// // // // // //         selectedContainer.value = containerIndex;
// // // // // //       },
// // // // // //       child: Container(
// // // // // //         padding: EdgeInsets.symmetric(
// // // // // //           horizontal: 14.w,
// // // // // //           vertical: 6.h,
// // // // // //         ),
// // // // // //         margin: EdgeInsets.symmetric(
// // // // // //           horizontal: 6.w,
// // // // // //           vertical: 4.h,
// // // // // //         ),
// // // // // //         decoration: BoxDecoration(
// // // // // //           color: selectedContainer.value == containerIndex
// // // // // //               ? Colors.black
// // // // // //               : Colors.white,
// // // // // //           borderRadius: BorderRadius.circular(
// // // // // //             40.r,
// // // // // //           ),
// // // // // //         ),
// // // // // //         child: Center(
// // // // // //           child: CustomText(
// // // // // //             text: text,
// // // // // //             fontSize: 13.sp,
// // // // // //             color: selectedContainer.value == containerIndex
// // // // // //                 ? Colors.white
// // // // // //                 : Colors.black,
// // // // // //             fontWeight: FontWeight.w600,
// // // // // //           ),
// // // // // //         ),
// // // // // //       ),
// // // // // //     );
// // // // // //   }
// // // // // // }
// // // // // import 'package:get/get.dart';
// // // // // import 'package:flutter/material.dart';
// // // // // import 'package:mandirwiki/util/image_constant.dart';
// // // // //
//
// // // // import 'package:flutter/material.dart';
// // // //
// // // // class MenuItem {
// // // //   final int id;
// // // //   final String label;
// // // //   final IconData icon;
// // // //
// // // //   MenuItem(this.id, this.label, this.icon);
// // // // }
// // // //
// // // // List<MenuItem> menuItems = [
// // // //   MenuItem(1, 'Home', Icons.home),
// // // //   MenuItem(2, 'Profile', Icons.person),
// // // //   MenuItem(3, 'Settings', Icons.settings),
// // // //   MenuItem(4, 'Favorites', Icons.favorite),
// // // //   MenuItem(5, 'Notifications', Icons.notifications),
// // // //   MenuItem(6, 'Messages', Icons.message),
// // // //   MenuItem(7, 'Explore', Icons.explore),
// // // //   MenuItem(8, 'Search', Icons.search),
// // // //   MenuItem(9, 'Chat', Icons.chat),
// // // //   MenuItem(10, 'Calendar', Icons.calendar_today),
// // // // ];
// // // //
// // // // class DropdownMenuSample extends StatefulWidget {
// // // //   const DropdownMenuSample({super.key});
// // // //
// // // //   @override
// // // //   State<DropdownMenuSample> createState() => _DropdownMenuSampleState();
// // // // }
// // // //
// // // // class _DropdownMenuSampleState extends State<DropdownMenuSample> {
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     double width = MediaQuery.of(context).size.width - 16.0;
// // // //     final TextEditingController menuController = TextEditingController();
// // // //     MenuItem? selectedMenu;
// // // //
// // // //     return Scaffold(
// // // //         backgroundColor: Colors.white,
// // // //         appBar: AppBar(
// // // //           title: const Text(
// // // //             'DropdownMenu',
// // // //           ),
// // // //           backgroundColor: Colors.lightBlueAccent,
// // // //         ),
// // // //         body: Padding(
// // // //           padding: const EdgeInsets.all(8.0),
// // // //           child: Column(
// // // //             mainAxisAlignment: MainAxisAlignment.start,
// // // //             children: [
// // // //               const SizedBox(
// // // //                 height: 50.0,
// // // //               ),
// // // //               DropdownMenu<MenuItem>(
// // // //                 //initialSelection: menuItems.first,
// // // //                 controller: menuController,
// // // //                 width: width,
// // // //                 hintText: "Select Menu",
// // // //                 requestFocusOnTap: true,
// // // //                 enableSearch: true,
// // // //                 enableFilter: true,
// // // //                 menuStyle: MenuStyle(
// // // //                   backgroundColor: MaterialStateProperty.all<Color>(
// // // //                       Colors.lightBlue.shade50),
// // // //                 ),
// // // //
// // // //                 label: const Text('Select Menu'),
// // // //                 onSelected: (MenuItem? menu) {
// // // //                   setState(() {
// // // //                     selectedMenu = menu;
// // // //                   });
// // // //                 },
// // // //                 dropdownMenuEntries:
// // // //                 menuItems.map<DropdownMenuEntry<MenuItem>>((MenuItem menu) {
// // // //                   return DropdownMenuEntry<MenuItem>(
// // // //                       value: menu,
// // // //                       label: menu.label,
// // // //                       leadingIcon: Icon(menu.icon));
// // // //                 }).toList(),
// // // //               ),
// // // //             ],
// // // //           ),
// // // //         ));
// // // //   }
// // // // }
// // // import 'package:flutter/material.dart';
// // //
// // //
// // // class ListScreen extends StatefulWidget {
// // //   @override
// // //   _ListScreenState createState() => _ListScreenState();
// // // }
// // //
// // // class _ListScreenState extends State<ListScreen> {
// // //   final List<String> items = [
// // //     'Item 1',
// // //     'Item 2',
// // //     'Item 3',
// // //     'Item 4',
// // //     'Item 5',
// // //     'Item 6',
// // //     'Item 7',
// // //     'Item 8',
// // //   ];
// // //   int selectedIndex = 0;
// // //   final ScrollController _scrollController = ScrollController();
// // //
// // //   void _onItemTapped(int index) {
// // //     setState(() {
// // //       selectedIndex = index;
// // //     });
// // //     _scrollToSelectedIndex(index);
// // //   }
// // //
// // //   void _scrollToSelectedIndex(int index) {
// // //     final screenWidth = MediaQuery.of(context).size.width;
// // //     final itemWidth = screenWidth / 3; // assuming 3 items fit in the screen
// // //     final scrollPosition = itemWidth * index - (screenWidth - itemWidth) / 2;
// // //
// // //     _scrollController.animateTo(
// // //       scrollPosition,
// // //       duration: Duration(milliseconds: 300),
// // //       curve: Curves.easeInOut,
// // //     );
// // //   }
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text('Horizontal and Vertical List'),
// // //       ),
// // //       body: Column(
// // //         children: <Widget>[
// // //           SizedBox(
// // //             height: 100,
// // //             child: ListView.builder(
// // //               controller: _scrollController,
// // //               scrollDirection: Axis.horizontal,
// // //               itemCount: items.length,
// // //               itemBuilder: (context, index) {
// // //                 return GestureDetector(
// // //                   onTap: () => _onItemTapped(index),
// // //                   child: Container(
// // //                     width: 100,
// // //                     alignment: Alignment.center,
// // //                     margin: EdgeInsets.symmetric(horizontal: 8.0),
// // //                     decoration: BoxDecoration(
// // //                       color: selectedIndex == index ? Colors.blue : Colors.grey,
// // //                       borderRadius: BorderRadius.circular(8.0),
// // //                     ),
// // //                     child: Text(
// // //                       items[index],
// // //                       style: TextStyle(
// // //                         color: Colors.white,
// // //                         fontSize: 16.0,
// // //                       ),
// // //                     ),
// // //                   ),
// // //                 );
// // //               },
// // //             ),
// // //           ),
// // //           Expanded(
// // //             child: ListView.builder(
// // //               itemCount: items.length,
// // //               itemBuilder: (context, index) {
// // //                 return ListTile(
// // //                   title: Text(items[index]),
// // //                   onTap: () => _onItemTapped(index),
// // //                 );
// // //               },
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }
// // import 'package:flutter/material.dart';
// //
// // class ListScreen extends StatefulWidget {
// //   @override
// //   _ListScreenState createState() => _ListScreenState();
// // }
// //
// // class _ListScreenState extends State<ListScreen> {
// //   final List<String> items = [
// //     'Item 1',
// //     'Item 2',
// //     'Item 3',
// //     'Item 4',
// //     'Item 5',
// //     'Item 6',
// //     'Item 7',
// //     'Item 8',
// //   ];
// //   final List<String> itemDetails = [
// //     'Details for Item 1',
// //     'Details for Item 2',
// //     'Details for Item 3',
// //     'Details for Item 4',
// //     'Details for Item 5',
// //     'Details for Item 6',
// //     'Details for Item 7',
// //     'Details for Item 8',
// //   ];
// //   int selectedIndex = 0;
// //   final ScrollController _scrollController = ScrollController();
// //
// //   void _onItemTapped(int index) {
// //     setState(() {
// //       selectedIndex = index;
// //     });
// //     _scrollToSelectedIndex(index);
// //   }
// //
// //   void _scrollToSelectedIndex(int index) {
// //     final screenWidth = MediaQuery.of(context).size.width;
// //     final itemWidth = screenWidth / 3; // assuming 3 items fit in the screen
// //     final scrollPosition = itemWidth * index - (screenWidth - itemWidth) / 2;
// //
// //     _scrollController.animateTo(
// //       scrollPosition,
// //       duration: Duration(milliseconds: 300),
// //       curve: Curves.easeInOut,
// //     );
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Horizontal and Vertical List with Expandable Tiles'),
// //       ),
// //       body: Column(
// //         children: <Widget>[
// //           SizedBox(
// //             height: 100,
// //             child: ListView.builder(
// //               controller: _scrollController,
// //               scrollDirection: Axis.horizontal,
// //               itemCount: items.length,
// //               itemBuilder: (context, index) {
// //                 return GestureDetector(
// //                   onTap: () => _onItemTapped(index),
// //                   child: Container(
// //                     width: 100,
// //                     alignment: Alignment.center,
// //                     margin: EdgeInsets.symmetric(horizontal: 8.0),
// //                     decoration: BoxDecoration(
// //                       color: selectedIndex == index ? Colors.blue : Colors.grey,
// //                       borderRadius: BorderRadius.circular(8.0),
// //                     ),
// //                     child: Text(
// //                       items[index],
// //                       style: TextStyle(
// //                         color: Colors.white,
// //                         fontSize: 16.0,
// //                       ),
// //                     ),
// //                   ),
// //                 );
// //               },
// //             ),
// //           ),
// //           Expanded(
// //             child: ListView.builder(
// //               itemCount: items.length,
// //               itemBuilder: (context, index) {
// //                 return ExpansionTile(
// //                   title: Text(items[index]),
// //                   onExpansionChanged: (isExpanded) {
// //                     if (isExpanded) {
// //                       _onItemTapped(index);
// //                     }
// //                   },
// //                   children: <Widget>[
// //                     Padding(
// //                       padding: const EdgeInsets.all(16.0),
// //                       child: Text(itemDetails[index]),
// //                     ),
// //                   ],
// //                 );
// //               },
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
//
// // import 'package:flutter/material.dart';
// //
// // class ListScreen extends StatefulWidget {
// //   @override
// //   _ListScreenState createState() => _ListScreenState();
// // }
// //
// // class _ListScreenState extends State<ListScreen> {
// //
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Horizontal and Vertical List with Expandable Tiles'),
// //       ),
// //       body: Column(
// //         children: <Widget>[
// //           SizedBox(
// //             height: 100,
// //             child: ListView.builder(
// //               controller: _scrollController,
// //               scrollDirection: Axis.horizontal,
// //               itemCount: items.length,
// //               itemBuilder: (context, index) {
// //                 return GestureDetector(
// //                   onTap: () => _onItemTapped(index),
// //                   child: Container(
// //                     width: 100,
// //                     alignment: Alignment.center,
// //                     margin: EdgeInsets.symmetric(horizontal: 8.0),
// //                     decoration: BoxDecoration(
// //                       color: selectedIndex == index ? Colors.blue : Colors.grey,
// //                       borderRadius: BorderRadius.circular(8.0),
// //                     ),
// //                     child: Text(
// //                       items[index],
// //                       style: TextStyle(
// //                         color: Colors.white,
// //                         fontSize: 16.0,
// //                       ),
// //                     ),
// //                   ),
// //                 );
// //               },
// //             ),
// //           ),
// //           Expanded(
// //             child: ListView.builder(
// //               itemCount: items.length,
// //               itemBuilder: (context, index) {
// //                 return ExpansionTile(
// //                   title: Text(items[index]),
// //                   initiallyExpanded: selectedIndex == index,
// //                   onExpansionChanged: (isExpanded) {
// //                     if (isExpanded) {
// //                       _onItemTapped(index);
// //                     }
// //                   },
// //                   children: <Widget>[
// //                     Padding(
// //                       padding: const EdgeInsets.all(16.0),
// //                       child: Text(itemDetails[index]),
// //                     ),
// //                   ],
// //                 );
// //               },
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:qr_flutter/qr_flutter.dart';
//
// import '../util/image_constant.dart';
//
// class SlotController extends GetxController {
//   var availableSlots = [
//     "05-09",
//     "06-10",
//     "07-11",
//     "08-12",
//     "16-20",
//     "17-21",
//   ].obs;
//
//   var selectedSlot = ''.obs;
//
//   void selectSlot(String slot) {
//     selectedSlot.value = slot;
//   }
// }
//
// class SlotPage extends StatelessWidget {
//   final SlotController slotController = Get.put(SlotController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Available Slots'),
//       ),
//       body: GridView.builder(
//         itemCount: slotController.availableSlots.length,
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           mainAxisSpacing: 8.0,
//           crossAxisSpacing: 8.0,
//         ),
//         itemBuilder: (context, index) {
//           String slot = slotController.availableSlots[index];
//           bool isSelected = slotController.selectedSlot.value == slot;
//           return GestureDetector(
//             onTap: () {
//               slotController.selectSlot(slot);
//             },
//             child: Container(
//               color: isSelected ? Colors.blue : Colors.white,
//               child: Center(
//                 child: Text(
//                   slot,
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: isSelected ? Colors.white : Colors.black,
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//
// class MyHomePage extends StatelessWidget {
//   final List<String> availableSlot = [
//     "05-09",
//     "06-10",
//     "07-11",
//     "08-12",
//     "16-20",
//     "17-21"
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     List<String> filteredSlots = availableSlot
//         .where((slot) => isSlotAfterCurrentTime(
//             slot)) // Filter slots based on time comparison
//         .toList();
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Filtered Slots'),
//       ),
//       body: GridView.builder(
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 10,
//           mainAxisSpacing: 10,
//         ),
//         itemCount: filteredSlots.length,
//         itemBuilder: (context, index) {
//           return GestureDetector(
//             onTap: () {
//               // Handle slot selection
//             },
//             child: Container(
//               color: Colors.blue, // Set color as needed
//               child: Center(
//                 child: Text(filteredSlots[index]),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   bool isSlotAfterCurrentTime(String slot) {
//     List<String> parts = slot.split("-");
//     if (parts.length == 2) {
//       String startTime = parts[0];
//       String endTime = parts[1];
//       DateTime startDateTime = DateTime.now().add(Duration(
//           hours: int.parse(startTime.split(":")[0]),
//           minutes: int.parse(startTime.split(":")[1])));
//       DateTime endDateTime = DateTime.now().add(Duration(
//           hours: int.parse(endTime.split(":")[0]),
//           minutes: int.parse(endTime.split(":")[1])));
//
//       // Compare with current time
//       return startDateTime.isAfter(DateTime.now()) &&
//           endDateTime.isAfter(DateTime.now());
//     }
//     return false;
//   }
// }
//
// class MyHomePage1 extends StatelessWidget {
//   final List<String> availableSlot = [
//     "05-09",
//     "06-10",
//     "07-11",
//     "08-12",
//     "16-20",
//     "17-21"
//   ];
//
//   List<String> filterSlotsByTime() {
//     // Get current time
//     final currentTime = DateTime.now();
//
//     // Filter slots that are after the current time
//     return availableSlot.where((slot) {
//       final slotTime = DateTime.parse("2024-05-28 $slot:00");
//       return slotTime.isAfter(currentTime);
//     }).toList();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final filteredSlots = filterSlotsByTime();
//
//     return Scaffold(
//       appBar: AppBar(title: Text('Available Slots')),
//       body: GridView.builder(
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 10.0,
//           mainAxisSpacing: 10.0,
//         ),
//         itemCount: filteredSlots.length,
//         itemBuilder: (context, index) {
//           return GestureDetector(
//             onTap: () {
//               // Handle slot selection
//               print('Selected slot: ${filteredSlots[index]}');
//             },
//             child: Container(
//               color: Colors.green, // Change color as needed
//               child: Center(
//                 child: Text(filteredSlots[index]),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//
// class MyHomePage123 extends StatefulWidget {
//   MyHomePage123({Key? key, required this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   _MyHomePage123State createState() => _MyHomePage123State();
// }
//
// class _MyHomePage123State extends State<MyHomePage123> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             // Handle back button press
//           },
//         ),
//         title: Text(widget.title),
//         actions: [
//           TextButton(
//             onPressed: () {
//               // Handle Tutorial button press
//             },
//             child: Text(
//               'Tutorial',
//               style: TextStyle(color: Colors.white),
//             ),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Terms & Conditions',
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 16),
//               ExpansionTile(
//                 title: Text(
//                   'Acceptance of Terms',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Text(
//                       'By using the \'rent a locker\' service from Saasbox Technologies, you agree to comply with and be bound by these terms and conditions.',
//                     ),
//                   ),
//                 ],
//               ),
//               ExpansionTile(
//                 title: Text(
//                   'Locker Usage',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Text(
//                       'The lockers can be booked up to 30 days in advance and will be available during the temple\'s opening hours. Users can reserve additional lockers as needed.',
//                     ),
//                   ),
//                 ],
//               ),
//               ExpansionTile(
//                 title: Text(
//                   'Items Allowed in Smart Lockers',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Text(
//                       'Lockers can accommodate various items and personal belongings according to temple rules.',
//                     ),
//                   ),
//                 ],
//               ),
//               ExpansionTile(
//                 title: Text(
//                   'Access Code',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Text(
//                       'Users will receive a unique booking ID and a QR code to operate the locker. Access codes must be kept confidential to avoid any unauthorised use',
//                     ),
//                   ),
//                 ],
//               ),
//               ExpansionTile(
//                 title: Text(
//                   'Rental Extension',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Text(
//                       'Usage periods may be extended, subject to availability and additional fees.',
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 16),
//               Row(
//                 children: [
//                   Checkbox(
//                     value: false,
//                     onChanged: (value) {
//                       // Handle checkbox change
//                     },
//                   ),
//                   Text('I agree with the Terms & Conditions'),
//                 ],
//               ),
//               SizedBox(height: 16),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {
//                       // Handle Cancel button press
//                     },
//                     child: Text('Cancel'),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       // Handle Next button press
//                     },
//                     child: Text('Next'),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.black,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class RentLockerPage extends StatelessWidget {
//   final RxBool isAgreed = false.obs;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             // Handle back button action
//           },
//         ),
//         title: Text("Rent a Locker"),
//         actions: [
//           TextButton(
//             onPressed: () {
//               // Handle tutorial button action
//             },
//             child: Text(
//               "Tutorial",
//               style: TextStyle(color: Colors.black),
//             ),
//           ),
//         ],
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Terms & Conditions",
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 16),
//             Expanded(
//               child: ListView(
//                 children: [
//                   buildTermItem("Acceptance of Terms",
//                       "By using the ‘rent a locker’ service from Saasbox Technologies, you agree to comply with and be bound by these terms and conditions."),
//                   buildTermItem("Locker Usage",
//                       "The lockers can be booked up to 30 days in advance and will be available during the temple's opening hours. Users can reserve additional lockers as needed."),
//                   buildTermItem("Items Allowed in Smart Lockers",
//                       "Lockers can accommodate various items and personal belongings according to temple rules."),
//                   buildTermItem("Access Code",
//                       "Users will receive a unique booking ID and a QR code to operate the locker. Access codes must be kept confidential to avoid any unauthorised use."),
//                   buildTermItem("Rental Extension",
//                       "Usage periods may be extended, subject to availability and additional fees."),
//                 ],
//               ),
//             ),
//             Row(
//               children: [
//                 Obx(() => Checkbox(
//                       value: isAgreed.value,
//                       onChanged: (value) {
//                         isAgreed.value = value!;
//                       },
//                     )),
//                 Text("I agree with the Terms & Conditions"),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     // Handle cancel button action
//                   },
//                   child: Text("Cancel"),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.grey, // Cancel button color
//                   ),
//                 ),
//                 ElevatedButton(
//                   onPressed: isAgreed.value
//                       ? () {
//                           // Handle next button action
//                         }
//                       : null,
//                   child: Text("Next"),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget buildTermItem(String title, String content) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             title,
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 8),
//           Text(content),
//         ],
//       ),
//     );
//   }
// }
//
// class LockerController extends GetxController {
//   final lockerNo = [1, 2, 3, 4, 5].obs;
//
//   List<QrImageView> get qrCodeWidgets => lockerNo.map((number) {
//         return QrImageView(
//           data: 'This QR code has an embedded image as well',
//           version: QrVersions.auto,
//           size: 120.r,
//           gapless: false,
//           embeddedImageStyle: QrEmbeddedImageStyle(
//             size: Size(
//               80.w,
//               80.h,
//             ),
//           ),
//         );
//       }).toList();
// }
// // Update the path to your controller
//
// class LockerScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final LockerController controller = Get.put(LockerController());
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Locker QR Codes'),
//       ),
//       body: Obx(
//         () => SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Row(
//             children: controller.qrCodeWidgets,
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class CarouselController extends GetxController {
//   var currentIndex = 0.obs;
//   List<String> imagePaths = [
//     ImageConstant.car_rentals,
//     ImageConstant.location,
//     ImageConstant.share,
//
//     // Add paths for all your 10 images
//   ];
//
//   void nextImage() {
//     if (currentIndex.value < imagePaths.length - 1) {
//       currentIndex.value++;
//     }
//   }
//
//   void previousImage() {
//     if (currentIndex.value > 0) {
//       currentIndex.value--;
//     }
//   }
// }
//
// class CarouselView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final CarouselController controller = Get.put(CarouselController());
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Image Carousel'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Obx(() {
//               return Image.asset(
//                   controller.imagePaths[controller.currentIndex.value]);
//             }),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 IconButton(
//                   icon: Icon(Icons.arrow_left),
//                   onPressed: controller.previousImage,
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.arrow_right),
//                   onPressed: controller.nextImage,
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class LockerController1 extends GetxController {
//   final lockerNo = [1, 2, 3, 4, 5].obs;
//   final scrollController = ScrollController().obs;
//   var currentIndex = 0.obs;
//
//   void nextPage() {
//     if (currentIndex.value < lockerNo.length - 1) {
//       currentIndex.value++;
//       scrollController.value.animateTo(
//         currentIndex.value *
//             200.0, // Adjust the 200.0 to the width of each item if different
//         duration: Duration(milliseconds: 300),
//         curve: Curves.easeInOut,
//       );
//     }
//   }
//
//   void previousPage() {
//     if (currentIndex.value > 0) {
//       currentIndex.value--;
//       scrollController.value.animateTo(
//         currentIndex.value *
//             200.0, // Adjust the 200.0 to the width of each item if different
//         duration: Duration(milliseconds: 300),
//         curve: Curves.easeInOut,
//       );
//     }
//   }
// } // Update the path to your controller
//
// class LockerScreen1 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final LockerController1 controller = Get.put(LockerController1());
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Locker QR Codes'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: Obx(
//               () => ListView.builder(
//                 controller: controller.scrollController.value,
//                 scrollDirection: Axis.horizontal,
//                 itemCount: controller.lockerNo.length,
//                 itemBuilder: (context, index) {
//                   return Container(
//                     width: 500.0, // Adjust this width if needed
//                     child: Center(
//                       child: QrImageView(
//                         data: 'This QR code has an embedded image as well',
//                         version: QrVersions.auto,
//                         size: 120.r,
//                         gapless: false,
//                         embeddedImageStyle: QrEmbeddedImageStyle(
//                           size: Size(
//                             80.w,
//                             80.h,
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               IconButton(
//                 icon: Icon(Icons.arrow_left),
//                 onPressed: controller.previousPage,
//               ),
//               IconButton(
//                 icon: Icon(Icons.arrow_right),
//                 onPressed: controller.nextPage,
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class ExpansionTileController extends GetxController {
//   var expandedIndex = (-1).obs;
//
//   void changeExpandedIndex(int index) {
//     if (expandedIndex.value == index) {
//       expandedIndex.value = -1; // Collapse if already expanded
//     } else {
//       expandedIndex.value = index; // Expand the new tile
//     }
//   }
// } // Import your controller
//
// class ExpansionTileList extends StatelessWidget {
//   final ExpansionTileController controller = Get.put(ExpansionTileController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView.builder(
//         itemCount: 5,
//         itemBuilder: (context, index) {
//           return ExpansionTile(
//             title: Text('Tile $index'),
//             children: <Widget>[
//               ListTile(title: Text('Item 1')),
//               ListTile(title: Text('Item 2')),
//             ],
//             initiallyExpanded: controller.expandedIndex.value == index,
//             onExpansionChanged: (bool expanded) {
//               controller.changeExpandedIndex(expanded ? index : -1);
//             },
//           );
//         },
//       ),
//     );
//   }
// }
//
// class MyExpansionPanel extends StatefulWidget {
//   @override
//   _MyExpansionPanelState createState() => _MyExpansionPanelState();
// }
//
// class _MyExpansionPanelState extends State<MyExpansionPanel> {
//   int _selectedPanelIndex = -1;
//
//   void _openPanel(int index) {
//     setState(() {
//       _selectedPanelIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Expansion Panel Example'),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // Open the second panel programmatically
//           _openPanel(1);
//         },
//         child: Icon(Icons.open_in_new),
//       ),
//       body: Column(
//         children: [
//           ExpansionPanelList(
//             expansionCallback: (int panelIndex, bool isExpanded) {
//               setState(() {
//                 _selectedPanelIndex = panelIndex;
//               });
//             },
//             children: [
//               ExpansionPanel(
//                 headerBuilder: (BuildContext context, bool isExpanded) {
//                   return Text('Panel 1');
//                 },
//                 body: Text('Content of Panel 1'),
//                 isExpanded: _selectedPanelIndex == 0,
//               ),
//               ExpansionPanel(
//                 headerBuilder: (BuildContext context, bool isExpanded) {
//                   return Text('Panel 2');
//                 },
//                 body: Text('Content of Panel 2'),
//                 isExpanded: _selectedPanelIndex == 1,
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// // Example usage:
//
// class QRController extends GetxController {
//   var currentIndex = 0.obs;
//
//   void nextQR(int total) {
//     if (currentIndex < total - 1) {
//       currentIndex++;
//     }
//   }
//
//   void previousQR() {
//     if (currentIndex > 0) {
//       currentIndex--;
//     }
//   }
// }
//
// class QRCodeScreen extends StatelessWidget {
//   final QRController qrController = Get.put(QRController());
//   final List<int> lockerNo = [1, 2, 3, 4, 5]; // Your list
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('QR Code Viewer'),
//       ),
//       body: Center(
//           child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Expanded(
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: lockerNo.length,
//               controller: PageController(viewportFraction: 0.9),
//               itemBuilder: (context, index) {
//                 return Container(
//                   width: MediaQuery.of(context).size.width * 0.8,
//                   child: Center(
//                     child: QrImageView(
//                       data: lockerNo[index].toString(),
//                       version: QrVersions.auto,
//                       size: 200.0,
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           SizedBox(height: 20),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               IconButton(
//                 icon: Icon(Icons.arrow_left),
//                 onPressed: () {
//                   qrController.previousQR();
//                 },
//               ),
//               IconButton(
//                 icon: Icon(Icons.arrow_right),
//                 onPressed: () {
//                   qrController.nextQR(lockerNo.length);
//                 },
//               ),
//             ],
//           ),
//         ],
//       )),
//     );
//   }
// }
