import 'package:flutter/material.dart';
import '../models/joke.dart';
import '../services/api_services.dart';

class JokesScreen extends StatefulWidget {
  @override
  _JokesScreenState createState() => _JokesScreenState();
}

class _JokesScreenState extends State<JokesScreen> {
  late Future<List<Joke>> jokes;
  late String type;

  @override
  // Прифаќање на типот на шега преку аргументите на рутата
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments as String;
    type = args;
    jokes = ApiService.getJokesByType(type);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$type Jokes'),
      ),
      body: FutureBuilder<List<Joke>>(
        future: jokes,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final jokesList = snapshot.data!;
            return ListView.builder(
              itemCount: jokesList.length,
              itemBuilder: (context, index) {
                final joke = jokesList[index];
                return ListTile(
                  title: Text(joke.setup),
                  subtitle: Text(joke.punchline),
                );
              },
            );
          }
        },
      ),
    );
  }
}
