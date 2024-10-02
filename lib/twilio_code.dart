import 'dart:convert';

import 'package:getx_usage/utils/export_file.dart';
import 'package:http/http.dart' as http;
class TwilioSendMessage extends StatefulWidget {
  const TwilioSendMessage({super.key});

  @override
  State<TwilioSendMessage> createState() => _TwilioSendMessageState();
}

class _TwilioSendMessageState extends State<TwilioSendMessage> {
TextEditingController messageController= TextEditingController();
 static String  username="AC57ed72763b66b5f09ecb4127ccde2c68";
 static String password ="3b7a4d0afc0b19d52de4c658e83eff80";

  sendMessage() async{
    var auth = 'Basic ${base64Encode(utf8.encode('$username:$password'))}';
  print(auth);
    var headers = {
  'Content-Type': 'application/x-www-form-urlencoded',
  'Authorization': auth
};
var request = http.Request('POST', Uri.parse('https://api.twilio.com/2010-04-01/Accounts/AC57ed72763b66b5f09ecb4127ccde2c68/Messages.json'));
request.bodyFields = {
  'To': ' 923023272316',
  'From': ' 12089845027 ',
  'Body': messageController.text
};
request.headers.addAll(headers);

http.StreamedResponse response = await request.send();

if (response.statusCode == 200) {
  print(await response.stream.bytesToString());
}
else {
  print(response.reasonPhrase);
}

  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
                child: TextField
                ( 
                  strutStyle: StrutStyle(),
                  
                  controller: messageController,
                  
                  cursorColor: Colors.black,
                ),
              ),
             const SizedBox(height: 15,),
              ElevatedButton( style: ButtonStyle(backgroundColor:  MaterialStatePropertyAll<Color>(Colors.green),), onPressed: (){
                sendMessage();
              }, child:const Text("Send Message")),
             const SizedBox(height: 15,),
              
            ],
          ),
        ),
      ),
    );
  }
}