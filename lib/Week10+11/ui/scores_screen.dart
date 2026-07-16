import 'package:flutter/material.dart';
import 'package:flutter_dart/Week10+11/data/repositories/scores_repository.dart';
import 'package:flutter_dart/Week10+11/data/services/auth_service.dart';
 
import '../model/score.dart';

class ScoresScreen extends StatefulWidget {
  const ScoresScreen({super.key});

  @override
  State<ScoresScreen> createState() => _ScoresScreenState();
}

class _ScoresScreenState extends State<ScoresScreen> {
  List<Score>? scores;
  String? error;

  @override
  void initState() {
    super.initState();
 
    fetchSCores();
  }

  void fetchSCores() async {

     // Ask the ScoresRepository instance to fetch the scores
    try {
      final List<Score> fetchedScores = await ScoresRepository.instance
          .getSCores();

      if (!mounted) return;

      // if succes, update the scores list and refresh
      setState(() {
        scores = fetchedScores;
        error = null;
      });
    } catch (exception) {
      if (!mounted) return;

      // If failure, update the error and refresh
      setState(() {
        error = exception.toString();
      });
    }
  }

  String? get userName {
    // Ask the AuthenticationService instance the current user nale (if any)
    return AuthenticationService.instance.session?.user.name;
  }
  Widget get content {

     // If scores list => dispaly the list using the ScoreTile
    if (scores != null) {
      return ListView.builder(
        itemCount: scores!.length,
        itemBuilder: (context, index) {
          return ScoreTile(score: scores![index]);
        },
      );
    }

    // if error, dispaly the erro in red, centered
    if (error != null) {
      return Text(
        error!,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.red, fontWeight: FontWeight.w500),
      );
    }

    // otherwise, we disaply the  CircularProgressIndicator
    return CircularProgressIndicator();
  }

  String get welcomeLabel => "Welcome ${userName != null ? userName! : ""} !";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(welcomeLabel)),
      body: Center(
        child: Padding(padding: const EdgeInsets.all(20.0), child: content),
      ),
    );
  }
}

class ScoreTile extends StatelessWidget {
  const ScoreTile({super.key, required this.score});

  final Score score;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(title: Text(score.title)),
    );
  }
}
