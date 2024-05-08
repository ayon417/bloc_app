import 'package:bloc_state_app/second_bloc.dart';
import 'package:bloc_state_app/views/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'controller.dart';

class SecondPage extends StatefulWidget {
  final HomeBloc? homeBloc;

  const SecondPage({this.homeBloc, Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  SecondBloc secondBloc=SecondBloc();
  @override
  void initState() {
    super.initState();
 secondBloc.add(SecondInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SecondBloc, SecondState>(
      bloc: secondBloc,
      listenWhen: (previous,current)=>current is SecondActionState,
      buildWhen: (previous,current)=>current is !SecondActionState,
      listener: (context, state) {
        if(state is NavigateBackActionState)
          {
            widget.homeBloc!.add(HomeInitialEvent());
            Navigator.pop(context);
          }
      },
      builder: (context, state) {
        switch(state.runtimeType){
          case SecondInitialState:
            final successState= state as SecondInitialState;
            return Scaffold(
              appBar: AppBar(title: Text("Second Page"),
              leading: GestureDetector(
                onTap: (){
                  secondBloc.add(NavigateToBackEvent());
                },
                  child: Icon(Icons.arrow_back)),),
              body: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(successState.data.toString(),
                      style: TextStyle(fontSize: 30),),
                    ElevatedButton(onPressed: () {
                      secondBloc.add(SecondDecreaseEvent());

                    }, child: Text("Decrease")),
                    ElevatedButton(onPressed: (){
                      secondBloc.add(NavigateToBackEvent());
                    }, child: Text("back")),

                  ],
                ),
              ),
            );

          default:
            }
            return SizedBox();
        }

    );
  }
}
