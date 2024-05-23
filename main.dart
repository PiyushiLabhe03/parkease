import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vehicle and Slot Selection',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthPage(),
    );
  }
}

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login / Sign Up'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text('Login'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpPage()),
                );
              },
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Username'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => VehicleSelectionPage()),
                            (route) => false,
                      );
                    }
                  },
                  child: Text('Login'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Username'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => VehicleSelectionPage()),
                            (route) => false,
                      );
                    }
                  },
                  child: Text('Sign Up'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
class VehicleSelectionPage extends StatefulWidget {
  const VehicleSelectionPage({super.key});

  @override
  State<VehicleSelectionPage> createState() => _VehicleSelectionPageState();
}

class _VehicleSelectionPageState extends State<VehicleSelectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Select Vehicle'),
    ),
    body: Center(
        child: Row(
        children: <Widget>[
          Expanded(
            child: TextButton(
              onPressed:() {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchAreaPage()),
                );
              },
                child: Image.asset('images/vehicle1.png'),
            ),
          ),
          Expanded(
              child: TextButton(
                  onPressed: () {
                      Navigator.push(
                             context,
                             MaterialPageRoute(builder: (context) => SearchAreaPage()),
                               );
                           },
                  child: Image.asset('images/vehicle2.png'),
              ),
          ),
        ],
      ),
    ),
    );
  }
}

class Selectarea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Area'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SearchAreaPage()),
            );
          },
          child: Text('Search Area'),
        ),
      ),
    );
  }
}

class SearchAreaPage extends StatefulWidget {
  @override
  _SearchAreaPageState createState() => _SearchAreaPageState();
}

class _SearchAreaPageState extends State<SearchAreaPage> {
  final _searchController = TextEditingController();
  bool _searchPerformed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Area'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Enter area',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _searchPerformed = true;
                });
              },
              child: Text('Search'),
            ),
            SizedBox(height: 16.0),
            _searchPerformed ? Expanded(child: _buildPlaceList()) : Container(),
          ],
        ),
      ),
    );
  }

  Widget _buildPlaceList() {
    List<Map<String, dynamic>> places = [
      {
        'name': 'Reliance Digital Mart',
        'slots': [
          {'number': 1, 'occupied': false},
          {'number': 2, 'occupied': true},
          {'number': 3, 'occupied': false},
          {'number': 4, 'occupied': false},
          {'number': 5, 'occupied': false},
          {'number': 6, 'occupied': true},
          {'number': 7, 'occupied': true},
          {'number': 8, 'occupied': false},
          {'number': 9, 'occupied': true},
          {'number': 10, 'occupied': true},
          {'number': 11, 'occupied': true},
          {'number': 12, 'occupied': false},
        ],
      },
      {
        'name': 'Dhuniwala Math Chowk',
        'slots': [
          {'number': 13, 'occupied': false},
          {'number': 14, 'occupied': false},
          {'number': 15, 'occupied': true},
          {'number': 16, 'occupied': true},
          {'number': 17, 'occupied': false},
          {'number': 18, 'occupied': true},
          {'number': 19, 'occupied': true},
          {'number': 20, 'occupied': true},
          {'number': 21, 'occupied': false},
          {'number': 22, 'occupied': true},
          {'number': 23, 'occupied': true},
          {'number': 24, 'occupied': false},
          {'number': 25, 'occupied': true},
        ],
      },
      {
        'name': 'Aarti Chowk',
        'slots': [
          {'number': 26, 'occupied': true},
          {'number': 27, 'occupied': false},
          {'number': 28, 'occupied': true},
          {'number': 29, 'occupied': false},
          {'number': 30, 'occupied': true},
          {'number': 31, 'occupied': false},
          {'number': 32, 'occupied': true},
          {'number': 33, 'occupied': true},
          {'number': 34, 'occupied': false},
          {'number': 35, 'occupied': true},
        ],
      },
    ];

    return ListView.builder(
      itemCount: places.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            title: Text(places[index]['name']),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SlotsPage(places[index]['name'], places[index]['slots']),
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}

class SlotsPage extends StatefulWidget {
  final String placeName;
  final List<Map<String, dynamic>> slots;

  SlotsPage(this.placeName, this.slots);

  @override
  _SlotsPageState createState() => _SlotsPageState();
}

class _SlotsPageState extends State<SlotsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.placeName} Slots'),
      ),
      body: ListView.builder(
        itemCount: widget.slots.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              title: Text('Slot ${widget.slots[index]['number']}'),
              subtitle: Text(widget.slots[index]['occupied'] ? 'Occupied' : 'Vacant'),
              trailing: widget.slots[index]['occupied']
                  ? Icon(Icons.close, color: Colors.red)
                  : Icon(Icons.check, color: Colors.green),
              onTap: widget.slots[index]['occupied']
                  ? null
                  : () {
                setState(() {
                  widget.slots[index]['occupied'] = true;
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QRCodePage(widget.placeName, widget.slots[index]['number']),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class QRCodePage extends StatelessWidget {
  final String placeName;
  final int slotNumber;

  QRCodePage(this.placeName, this.slotNumber);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code'),
      ),
      body: Center(
        child: Image.asset('images/qr image.jpeg'),
      ),
    );
  }
}
