
import 'package:flutter/material.dart';
import 'package:project/constant_file/contsant.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DemoUrlLauncher extends StatefulWidget {
  const DemoUrlLauncher({super.key});

  @override
  State<DemoUrlLauncher> createState() => _DemoUrlLauncherState();
}

class _DemoUrlLauncherState extends State<DemoUrlLauncher> {
  final videoUrl = "https://www.youtube.com/shorts/BywXS1X2ZcY";

  YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(
          "https://www.youtube.com/shorts/BywXS1X2ZcY")!,
      flags: YoutubePlayerFlags(autoPlay: true));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back,color: Colors.white,)),

        title: Text("Try This", style: myStyle(25, Colors.white, FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height*0.9,
                  width: MediaQuery.of(context).size.width*0.9,
                  child: YoutubePlayer(
                    controller: _controller,
                    showVideoProgressIndicator: true,
                  ),
                ),
                Text("vghj", style: myStyle(30),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
