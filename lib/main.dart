import 'dart:convert';

// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_quill/flutter_quill.dart';
import 'package:getx_usage/routes/app_routes.dart';
import 'package:getx_usage/utils/export_file.dart';
import 'package:logger/logger.dart';
import 'package:quill_html_editor/quill_html_editor.dart';
// import 'package:vsc_quill_delta_to_html/vsc_quill_delta_to_html.dart';

import 'firebase_options.dart';
import 'utils/color_constant.dart';

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
// }
// Future<void> backgroundHandler(RemoteMessage message) async {
//   print(message.data.toString());
//   print(message.notification!.title);
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // FirebaseMessaging.onBackgroundMessage(backgroundHandler);

  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        // initialRoute: AppRoutes.initial,
       home: Boxes(),
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: ColorConstant.gray51,
          // secondary: Colors.yellow.shade700,
        )));
  }
}
 



 
class Boxes extends StatelessWidget{
   Boxes ({super.key});
 List<Map<String, dynamic>> boxData = [
    {
      "count": '0',
      "label": 'Upcoming',
      "color":Colors.orangeAccent
     
    },
    {
       "count": '0',
      "label": "Live Job",
      "color":Colors.blue
     
    },
    {
       "count": '0',
      "label": 'Missed',
      "color":Colors.red
     
    },
    {
       "count": '0',
      "label": 'Completed',
      "color":Colors.green
     
    },
 ];
  @override
  Widget build(BuildContext context){
    return  Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(width: 10,),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: boxData.length,
                    itemBuilder: (context,index)
                  {
                    return  CustomBox(
                    count: boxData[index]['count'],
                    label:  boxData[index]['label'],
                    bgColor: boxData[index]['color'],
                  );
                  })
                
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomBox extends StatelessWidget {
  String label;
  String count;
  Color? bgColor;
  
   CustomBox({super.key,required this.label,required this.count, this.bgColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 90,
          width: 90,
          decoration: BoxDecoration(
            color:bgColor?.withOpacity(0.3)??Colors.orangeAccent.withOpacity(0.4) ,
            border:Border.all(color: bgColor??Colors.orangeAccent,width: 3),
            borderRadius: BorderRadius.circular(15)
          ),
          child: Center(child: Text(count.toString())) ,
        ),
        
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(label,style: TextStyle(fontWeight: FontWeight.w500),),
        )
      ],
    );
  }
}
// import 'package:flutter/material.dart';

// import 'package:flutter_tawk/flutter_tawk.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Flutter Tawk'),
//           backgroundColor: const Color(0XFFF7931E),
//           elevation: 0,
//         ),
//         body: Tawk(
//           directChatLink: 'https://tawk.to/chat/6576afd107843602b8006126/1hhbptjsg',
//           visitor: TawkVisitor(
//             name: 'Hans Raj',
//             email: 'rajh8157@gmail.com',
//           ),
//           onLoad: () {
//             print('Hello Tawk!');
//           },
//           onLinkTap: (String url) {
//             print(url);
//           },
//           placeholder: const Center(
//             child: Text('Loading...'),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class QuillEditorc extends StatefulWidget {
//   @override
//   State<QuillEditorc> createState() => _QuillEditorState();
// }

// class _QuillEditorState extends State<QuillEditorc> {
//   QuillController _controller = QuillController.basic();
//   @override
//   void initState() {
//     var myJSON = jsonDecode(r'[{"insert":"Hhjbh hh jass "},{"insert":"\n","attributes":{"indent":1,"list":"ordered"}}]');
//     _controller = QuillController(
//       document: Document.fromJson(myJSON),
//       selection: TextSelection.collapsed(offset: 0),
//     );
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: QuillProvider(
//           configurations: QuillConfigurations(
//             controller: _controller,
//             sharedConfigurations: const QuillSharedConfigurations(),
//           ),
//           child: Column(
//             children: [
//               QuillToolbar(
//                 configurations: QuillToolbarConfigurations(
//                   toolbarIconAlignment: WrapAlignment.start,
//                   toolbarSectionSpacing: 0,
//                   // multiRowsDisplay: true,
//                   // showSmallButton: true,
                
//                   // showAlignmentButtons: true
//                 ),
//               ),
//               Expanded(
//                 child: QuillEditor.basic(
//                   configurations: const QuillEditorConfigurations(
//                     readOnly: false,
//                   ),
//                 ),
//               ),
//               ElevatedButton(
//                               onPressed: () {
//                     setState(() {
//                       String txt=QuillDeltaToHtmlConverter(List.castFrom( _controller.document.toDelta().toJson()),ConverterOptions.forEmail()).convert();
//                       debugPrint(
//                           "Text Controller toPlainText ${_controller.document.toPlainText()}");
//                       debugPrint(
//                           "Text Controller ${txt}");
//                                     debugPrint(
//                           "Text Controller ${txt.toString()}");
//                     });
//                   },
//                   child: Text(
//                       "Text Controller ${_controller.document.toPlainText()}",style: TextStyle(color: Colors.amber),)),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


// // // Convert HTML to Quill Delta
// // String htmlToDelta(String htmlContent) {
// //   final parsedHTML = html.parse(htmlContent);
// //   final deltaList = <Delta>[];

// //   // Extract text and attributes from HTML elements
// //   for (final element in parsedHTML.nodes) {
// //     final text = element.text ?? '';
// //     final attributes = {};

// //     if (element is html.Element) {
// //       attributes = element.attributes;
// //     }

// //     // Construct Quill Delta operations
// //     final delta = Delta()..insert(text);

// //     // Apply attributes to delta if present
// //     if (attributes.isNotEmpty) {
// //       for (final attribute in attributes.entries) {
// //         delta.attributes[attribute.key] = attribute.value;
// //       }
// //     }

// //     deltaList.add(delta);
// //   }

// //   return Delta.stringify(deltaList);
// // }


// class QuillEditorc extends StatefulWidget {
//   @override
//   State<QuillEditorc> createState() => _QuillEditorState();
// }

// class _QuillEditorState extends State<QuillEditorc> {
//   QuillController _controller = QuillController.basic();
//   @override
//   void initState() {
//     var myJSON = jsonDecode(r'[{"insert":"Hhjbh hh jass "},{"insert":"\n","attributes":{"indent":1,"list":"ordered"}}]');
//     _controller = QuillController(
//       document: Document.fromJson(myJSON),
//       selection: TextSelection.collapsed(offset: 0),
//     );
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: QuillProvider(
//           configurations: QuillConfigurations(
//             controller: _controller,
//             sharedConfigurations: const QuillSharedConfigurations(),
//           ),
//           child: Column(
//             children: [
//               QuillToolbar(
//                 configurations: QuillToolbarConfigurations(
//                   toolbarIconAlignment: WrapAlignment.start,
//                   toolbarSectionSpacing: 0,
//                 ),
//               ),
//               Expanded(
//                 child: QuillEditor.basic(
//                   configurations: const QuillEditorConfigurations(
//                     readOnly: false,
//                   ),
//                 ),
//               ),
//               ElevatedButton(
//                               onPressed: () {
//                     setState(() {
//                       String txt=QuillDeltaToHtmlConverter(List.castFrom( _controller.document.toDelta().toJson()),ConverterOptions.forEmail()).convert();
//                       debugPrint(
//                           "Text Controller toPlainText ${_controller.document.toPlainText()}");
//                       debugPrint(
//                           "Text Controller ${txt}");
//                                     debugPrint(
//                           "Text Controller ${txt.toString()}");
//                     });
//                   },
//                   child: Text(
//                       "Text Controller ${_controller.document.toPlainText()}",style: TextStyle(color: Colors.amber),)),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


class QuillEditorc extends StatefulWidget {
  const QuillEditorc({super.key});

  @override
  State<QuillEditorc> createState() => _QuillEditorState();
}

class _QuillEditorState extends State<QuillEditorc> {
final QuillEditorController controller = QuillEditorController();
@override
  void initState() {
     
    super.initState();
  }
  setText(var text)async{
   controller.clear();
   await  controller.setText(text);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              ToolBar(
              // toolBarColor: Colors.cyan.shade50,
              activeIconColor: Colors.green,
              padding: const EdgeInsets.all(8),
              iconSize: 20,
              controller: controller,
             
              ),
            QuillHtmlEditor(
        
          hintText: 'Hint text goes here',
          controller: controller,
          isEnabled: true,
          height: 250,
          onTextChanged: (text) => debugPrint('widget text change $text'),
              ),
              ElevatedButton(
                              onPressed: ()async {
                  
                     String? htmlText = await controller.getText();
                     Logger().d(htmlText);
                   setText(htmlText+"<br><p>This is a quill html editor example 😊gghvbb</p>");
                  },
                  child: Text(
                      "Text Controller ${controller}",style: TextStyle(color: Colors.amber),)),
            ],
          ),
        ),
      ),
    );
  }
}



