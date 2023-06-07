import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:textatize_landing/bloc/home/home_bloc.dart";
import "package:textatize_landing/ui/home_screen.dart";
import "package:url_strategy/url_strategy.dart";

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Textatize Media",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      routes: {
        "/": (context) => BlocProvider(
          create: (context) => HomeBloc()..add(GetMedia(mediaId: "default", context: context)),
          child: const HomeScreen(),
        ),
      },
      onGenerateRoute: (settings) {
        // Parse the route
        String mediaId = settings.name!.substring(1);

        return MaterialPageRoute(builder: (context) {
          return BlocProvider(
            create: (context) => HomeBloc()..add(GetMedia(mediaId: mediaId, context: context)),
            child: const HomeScreen(),
          );
        },);
      },
      initialRoute: "/",
    );
  }
}
