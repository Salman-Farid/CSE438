import 'package:flutter/material.dart';
import 'package:wallpapers_hub/views/home_page.dart';

void main() {
  runApp(MaterialApp(
    home: WallpaperSuggestionPage(),
  ));
}

class WallpaperSuggestionPage extends StatefulWidget {
  @override
  _WallpaperSuggestionPageState createState() => _WallpaperSuggestionPageState();
}

class _WallpaperSuggestionPageState extends State<WallpaperSuggestionPage> {
  String gender = '';
  String emotion = '';
  String ageRange = '';

  final List<String> genderOptions = ['Gender: ', 'Male', 'Female'];
  final List<String> emotionOptions = ['Emotional Status: ','Sad', 'Happy', 'Joy', 'Excited', 'Playful'];
  final List<String> ageRangeOptions = ['Age: ', '5-10', '10-18', '18-35', '35-55'];

  String? selectedGender;
  String? selectedEmotion;
  String? selectedAgeRange;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('asset/Images/1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 60.0,
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.4),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    value: selectedGender,
                    items: genderOptions.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Center(
                          child: Text(
                            value,
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        selectedGender = newValue;
                      });
                    },
                  ),
                ),
                SizedBox(height: 30.0),
                SizedBox(
                  height: 60.0,
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.4),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    value: selectedAgeRange,
                    items: ageRangeOptions.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Center(
                          child: Text(
                            value,
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        selectedAgeRange = newValue;
                      });
                    },
                  ),
                ),
                SizedBox(height: 30.0),
                SizedBox(
                  height: 60.0,
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.4),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    value: selectedEmotion,
                    items: emotionOptions.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Center(
                          child: Text(
                            value,
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        selectedEmotion = newValue;
                      });
                    },
                  ),
                ),
                SizedBox(height: 30.0),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 0, 45, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (selectedGender != null && selectedAgeRange != null && selectedEmotion != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Please fill all fields"),
                              actions: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("OK"),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.blue, // background color
                                    onPrimary: Colors.white, // text color
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    minimumSize: Size(70, 36),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: Text(
                      'Get Wallpaper Suggestions',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.deepPurpleAccent, // text color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      fixedSize: Size(70, 40),
                    ),
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}

