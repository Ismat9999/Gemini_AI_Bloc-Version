import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geminiaibloc/presentation/blocs/starter_page/starter_bloc.dart';
import 'package:geminiaibloc/presentation/blocs/starter_page/starter_event.dart';
import 'package:geminiaibloc/presentation/blocs/starter_page/starter_state.dart';
import 'package:video_player/video_player.dart';

class StarterPage extends StatefulWidget {
  const StarterPage({super.key});

  @override
  State<StarterPage> createState() => _StarterPageState();
}

class _StarterPageState extends State<StarterPage> {
  late StarterBloc starterBloc;

  @override
  void initState() {
    super.initState();
    starterBloc= context.read<StarterBloc>();
    starterBloc.initVideoController();
    starterBloc.add(StarterVideoEvent());
  }

  @override
  void dispose(){
    super.dispose();
    starterBloc.exitVideoController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<StarterBloc, StarterState>(
        builder: (context, state){
          return Container(
            padding:  EdgeInsets.all(40),
            child: Column(
              children: [
                Container(
                  child: Image(
                    width: 150,
                    image: AssetImage("assets/images/gemini_logo.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: starterBloc.playerController.value.isInitialized
                  ? VideoPlayer(starterBloc.playerController):Container(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        starterBloc.callHomePage(context);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey,width: 2),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Row(
                          children: [
                            Text("Chat with Gemini",style: TextStyle(color: Colors.grey[400],fontSize: 18),),
                            const Icon(
                              Icons.arrow_forward,color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
