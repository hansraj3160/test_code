import 'package:getx_usage/utils/export_file.dart';
import 'package:http/http.dart' as http;
class TwilioSendMessage extends StatefulWidget {
  const TwilioSendMessage({super.key});

  @override
  State<TwilioSendMessage> createState() => _TwilioSendMessageState();
}

class _TwilioSendMessageState extends State<TwilioSendMessage> {
TextEditingController messageController= TextEditingController();


  sendMessage() async{


    var headers = {
  'Content-Type': 'application/x-www-form-urlencoded',
  'Authorization': 'Basic QUMyMjYzM2NhMjdlOGExM2UwMTNkODhkMzdlMDFmNTk4Mzo4YzRkODdlMjU5Mzk3MDdmZDU2N2U3M2U0M2M4ZDExZQ=='
};
var request = http.Request('POST', Uri.parse('https://api.twilio.com/2010-04-01/Accounts/AC22633ca27e8a13e013d88d37e01f5983/Messages.json'));
request.bodyFields = {
  'To': ' 923023272316',
  'From': ' 14154837285',
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
  backgroundColor: Colors.grey,
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