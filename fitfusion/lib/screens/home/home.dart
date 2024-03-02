// ignore_for_file: use_build_context_synchronously
import 'package:fitfusion/constant.dart';
import 'package:fitfusion/global_variables.dart';
import 'package:fitfusion/models/user_model.dart';
import 'package:fitfusion/provider/providers.dart';
import 'package:fitfusion/screens/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isUser = false;
  User user = User(
    id: "",
    name: "",
    age: 0,
    height: 0,
    weight: 0.0,
    email: "",
    gender: "",
    bmi: "",
    bmiRange: "",
    workouts: {},
  );

  @override
  void initState() {
    super.initState();
    setState(() {
      _isUser = Provider.of<UserProvider>(context, listen: false).user.id != "";
      if (!_isUser) {
        getUserData();
      } else {
        user = Provider.of<UserProvider>(context, listen: false).user;
      }
    });
    // debugPrint(user.workouts.toString());
  }

  void getUserData() async {
    try {
      String userid =
          Provider.of<GlobalProvider>(context, listen: false).userid;

      http.Response response = await http.get(
        Uri.parse('$uri/api/user/$userid'),
      );

      debugPrint(response.body);

      if (response.statusCode == 200) {
        Provider.of<UserProvider>(context, listen: false)
            .setUser(response.body);
        setState(() {
          _isUser = true;
          user = Provider.of<UserProvider>(context, listen: false).user;
        });

        debugPrint(Provider.of<UserProvider>(context, listen: false).user.bmi);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        title: const Text(
          'Home',
          style: TextStyle(color: textColors, fontSize: 20),
        ),
        leading: IconButton(
          icon: const CircleAvatar(
            backgroundColor: popColors,
            child: Icon(
              Icons.menu,
              color: textColors,
            ),
          ),
          onPressed: () {},
        ),
      ),
      body: _isUser
          ? Column(
              children: [
                ElevatedButton(
                  onPressed: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    debugPrint(prefs.get("user").toString());
                    prefs.remove("user");
                    debugPrint(prefs.get("user").toString());

                    setState(() {
                      Provider.of<UserProvider>(context, listen: false)
                          .resetUser();
                      Provider.of<GlobalProvider>(context, listen: false)
                          .resetUserid();
                    });

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WelcomScreen(),
                      ),
                    );
                  },
                  child: const Text("Clear"),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Name: ${user.name}'),
                          Text('Height: ${user.height}'),
                          Text('Weight: ${user.weight}'),
                          Text('Gender: ${user.gender}'),
                          Text('BMI: ${user.bmi}'),
                          Text('BMI Range: ${user.bmiRange}'),
                          Text('Age: ${user.age}'),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        WorkoutCategory(
                            categoryName: "fullBody", workouts: user.workouts),
                        WorkoutCategory(
                            categoryName: "legs", workouts: user.workouts),
                        WorkoutCategory(
                            categoryName: "chest", workouts: user.workouts),
                        WorkoutCategory(
                            categoryName: "arms", workouts: user.workouts),
                      ],
                    ),
                  ),
                )
              ],
            )
          : const Center(
              child: Text(
                "Loading..",
                style: TextStyle(color: textColors),
              ),
            ),
    );
  }
}

class WorkoutCategory extends StatelessWidget {
  final String categoryName;
  final Map<String, dynamic> workouts;

  const WorkoutCategory(
      {super.key, required this.categoryName, required this.workouts});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            categoryName.toUpperCase(),
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: textColors),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: workouts[categoryName]!.length,
          itemBuilder: (context, index) {
            return WorkoutCard(
              workout: workouts[categoryName]![index],
            );
          },
        ),
      ],
    );
  }
}

class WorkoutCard extends StatelessWidget {
  final Map<String, dynamic> workout;

  const WorkoutCard({super.key, required this.workout});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: const Icon(Icons.fitness_center),
        title: Text(workout['name']),
        subtitle: Text('Sets: ${workout['sets']}, Reps: ${workout['reps']}'),
      ),
    );
  }
}
