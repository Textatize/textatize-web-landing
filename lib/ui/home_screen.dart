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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "Getting Media",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                CircularProgressIndicator(),
              ],
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: const Text(
              "Textatize",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Colors.black,
              ),
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: CachedNetworkImage(
                  imageUrl: context.read<HomeBloc>().media!.url,
                  placeholder: (context, url) => const Center(
                    child: SizedBox(
                      width: 64,
                      height: 64,
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  errorWidget: (context, url, error) {
                    print("URL: $url");
                    print(error);
                    return const Icon(
                      Icons.error,
                      color: Colors.red,
                      size: 64,
                    );
                  },
                ),
              ),
              SizedBox(
                height: 64,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ShareTile(
                      const Icon(Icons.copy),
                      "Copy to Clipboard",
                      context.read<HomeBloc>().media!.url,
                    ),
                    ShareTile(
                      const Icon(Icons.save_alt),
                      "Save Photo",
                      context.read<HomeBloc>().media!.url,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
