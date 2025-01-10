
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geminiaibloc/presentation/blocs/home/picker_bloc.dart';
import 'package:geminiaibloc/presentation/blocs/starter_page/starter_event.dart';
import 'package:geminiaibloc/presentation/blocs/starter_page/starter_state.dart';
import 'package:video_player/video_player.dart';

import '../../pages/home_page.dart';
import '../home/home_bloc.dart';

class StarterBloc extends Bloc<StarterEvent,StarterState>{
  late VideoPlayerController playerController;

  StarterBloc(): super (StarterInitialState()){
    on<StarterVideoEvent>(_onStarterVideoEvent);
  }

  Future<void> _onStarterVideoEvent(StarterVideoEvent event, Emitter<StarterState> emit)async {
    playerController.play();
    playerController.setLooping(true);
    emit(StarterVideoState());
  }

  initVideoController()async{
    playerController=VideoPlayerController.asset("assets/videos/gemini_video.mp4")
        ..initialize();
  }
  exitVideoController()async{
    playerController.dispose();
  }

  callHomePage(BuildContext context){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context){
      return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context)=>HomeBloc()),
          BlocProvider(
              create: (context)=>PickerBloc()),
        ],
        child: HomePage(),
      );
    }));
  }
}