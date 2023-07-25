

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

import '../Repository/Firestore.dart';
import '../Repository/Validators.dart';
import '../Widgets/Simple_Text.dart';
import '../Widgets/Text_Feild.dart';
import 'Dashboard.dart';


class VideoApp extends StatefulWidget {
  const VideoApp({Key? key}) : super(key: key);

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset("assets/Vids/final_vid.mp4")
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        _controller.setLooping(true);
        Timer(Duration(milliseconds: 100), () {
          setState(() {
            _controller.play();
          });
        });
      });
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

  }
  final _formKey = GlobalKey<FormState>();
  bool? isChecked1 = false;
  bool? isChecked2 = false;
  bool? isChecked3 = false;
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.white;
  }



  TextEditingController _namecontroller = new TextEditingController();
  TextEditingController _phonecontroller = new TextEditingController();
  TextEditingController _emailcontroller = new TextEditingController();
  TextEditingController _passwordcontroller = new TextEditingController();







  @override
  Widget build(BuildContext context) {

    FireStore fireStore = new FireStore();
    Validators validators = new Validators();

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.topStart,
        children: [
          Positioned(child: videoplayer(controller: _controller)),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(width / 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: height / 20,
                  ),
                  Image.asset(
                    "assets/photo/logo.png",
                    width: width / 3,

                  ),
                  SizedBox(
                    height: height / 20,
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Text_Feild(
                              validate: (a) => validators.validatename(a!),
                              ccontroller: _namecontroller,
                              text: "Name",
                              icon: Icon(Icons.person)),
                          SizedBox(height: height / 60),
                          Text_Feild(
                              validate: (a) => validators.validatephone(a!),
                              ccontroller: _phonecontroller,
                              text: "Phone",
                              icon: Icon(Icons.phone)),
                          SizedBox(height: height / 60),
                          Text_Feild(
                              validate: (a) => validators.validateEmail(a!),
                              ccontroller: _emailcontroller,
                              text: "Email",
                              icon: Icon(Icons.email_outlined)),
                          SizedBox(height: height / 60),
                          Text_Feild(
                              validate: (a) => validators.validatePassword(a!),
                              ccontroller: _passwordcontroller,
                              text: "Password",
                              icon: Icon(Icons.lock)),
                          SizedBox(height: height / 100),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: height / 80),




                  Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Checkbox(
                            checkColor: Colors.white,
                            value: isChecked1,
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                            onChanged: (bool? value) {
                              setState(() {
                                print(isChecked1);
                                print("tapped");
                                isChecked1 = value;
                                print(value);
                                print(isChecked1);
                              });
                            },
                          ),
                          Simple_Text(
                              text: "Land Investments",
                              color: Colors.white,
                              size: 16),
                        ],
                      ),
                      Row(
                        children: <Widget>[


                          Checkbox(
                            value: isChecked2,
                            fillColor: MaterialStateProperty.resolveWith(getColor),
                            onChanged: (bool? value) {
                              setState((){
                                print("tapped");
                                isChecked2 = value;
                                print(value);
                                print(isChecked2);
                              });

                            },
                          ),
                          Simple_Text(
                              text: "Commercial Investments",
                              color: Colors.white,
                              size: 16),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                      Checkbox(
                        value: isChecked3,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        activeColor: Colors.white,

                        onChanged: (bool? value) {
                          setState(() {
                            print("tapped");
                            isChecked3 = value!;
                            print(value);
                            print(isChecked3);
                          });
                        },
                      ),
                          Simple_Text(
                              text: "Residential Investments",
                              color: Colors.white,
                              size: 16),
                        ],
                      ),
                      SizedBox(height: height / 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                fireStore.CreateUser(
                                    name: _namecontroller.text.toString(),
                                    phone: _phonecontroller.text.toString(),
                                    email: _emailcontroller.text.toString(),
                                    password: _passwordcontroller.text.toString(),
                                    li: isChecked1!,
                                    ci: isChecked2!,
                                    ri: isChecked3!);


                                _namecontroller.clear();
                                _phonecontroller.clear();
                                _emailcontroller.clear();
                                _passwordcontroller.clear();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Dashboard()),
                                );
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(width / 20),
                                color: Colors.blue,
                              ),
                              width: 200,
                              height: 50,
                              child: Center(
                                child: Text(
                                  "Register",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _namecontroller.clear();
    _phonecontroller.clear();
    _emailcontroller.clear();
_formKey.currentState?.reset();
_formKey.currentState?.dispose();
    _passwordcontroller.clear();


    isChecked1 = false;
    isChecked2 = false;
    isChecked3 = false;

    _controller.dispose();
    super.dispose();
  }

}

class videoplayer extends StatelessWidget {
  const videoplayer({
    super.key,
    required VideoPlayerController controller,
  }) : _controller = controller;

  final VideoPlayerController _controller;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SizedBox.expand(
          child: FittedBox(
            fit: BoxFit.cover,
            child: SizedBox(
              width: _controller.value.size.width,
              height: _controller.value.size.height,
              child: VideoPlayer(_controller),
            ),
          ),
        ));
  }
}
