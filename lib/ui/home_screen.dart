import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:textatize_landing/bloc/home/home_bloc.dart";
import "package:textatize_landing/ui/helpers/share_tile.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is HomeError) {
          return Scaffold(
            body: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.error,
                    size: 64,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Error: ${state.error}\nRefresh to try again",
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          );
        }
        if (state is! HomeLoaded) {
          return const Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Getting Media",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                CircularProgressIndicator(),
              ],
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: const Text("Textatize"),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: CachedNetworkImage(
                  imageUrl: context.read<HomeBloc>().media!.url,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                    color: Colors.red,
                    size: 64,
                  ),
                ),
              ),
              ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  ShareTile(Icon(Icons.copy)),
                  ShareTile(Icon(Icons.save_alt))
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
