import 'package:bloc_state_app/second_bloc.dart';
import 'package:bloc_state_app/secondpage.dart';
import 'package:bloc_state_app/views/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    super.initState();
  homeBloc.add(HomeInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
        bloc: homeBloc,
        listenWhen: (previous, current) => current is HomeActionState,
        buildWhen: (previous, current) => current is! HomeActionState,
        listener: (context, state) {
          if (state is NavigateToSecondPageActionState) {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>
                SecondPage(homeBloc: homeBloc,)));
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case HomeLoadingState:
              return const Center(child: CircularProgressIndicator());
            case InitialState:
              final successState = state as InitialState;
              return Scaffold(
                appBar: AppBar(title: Text("Home"),),
                body: SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(successState.data.toString(),
                        style: TextStyle(fontSize: 30),),
                      ElevatedButton(onPressed: () {
                        homeBloc.add(CounterEvent());
                      },
                        child: Text('Increase'),),
                      ElevatedButton(onPressed: () {
                       homeBloc.add(NavigateToSecondPageEvent());
                      },
                        child: Text('Go to second page'),),
                    ],
                  ),
                ),
              );
            default:
          }
          return const SizedBox();
        }

    );
  }
}
