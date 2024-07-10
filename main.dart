import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';


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
            CircleAvatar(
              radius: 100.0,
              backgroundImage: AssetImage('images/Logo ParkEase.jpg'),
            ),
            SizedBox( height: 20.0,
              width: 150,
            ),
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
  const VehicleSelectionPage({Key? key}) : super(key: key);

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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchAreaPage()),
                  );
                },
                child: Image.asset('images/vehicle1.png', width: 150, height: 150),
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
                child: Image.asset('images/vehicle2.png', width: 150, height: 150),
              ),
            ),
          ],
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
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

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
              onPressed: () => _selectDate(context),
              child: Text(_selectedDate == null ? 'Select Date' : 'Selected Date: ${_selectedDate!.toLocal()}'.split(' ')[0]),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
            onPressed: () => _selectTime(context),
    child: Text(_selectedTime == null ? 'Select Time' : 'Selected Time: ${_selectedTime
    !.format(context)}'),
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

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedTime)
      setState(() {
        _selectedTime = picked;
      });
  }

  Widget _buildPlaceList() {
    List<Map<String, dynamic>> places = [
      {
        'name': 'Reliance Digital Mart',
        'slots': _generateSlots(_selectedDate, _selectedTime)
      },
      {
        'name': 'Dhuniwala Math Chowk',
        'slots': _generateSlots(_selectedDate, _selectedTime)
      },
      {
        'name': 'Arvi Naka',
        'slots': _generateSlots(_selectedDate, _selectedTime)
      },
      {
        'name': 'Varco Pinnacle',
        'slots': _generateSlots(_selectedDate, _selectedTime)
      },
    {
    'name': 'Shivaji Chowk',
    'slots': _generateSlots(_selectedDate, _selectedTime)
    },
    ];

    return ListView.builder(
      itemCount: places.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(places[index]['name']),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SlotSelectionPage(
                  slots: places[index]['slots'],
                  placeName: places[index]['name'],
                ),
              ),
            );
          },
        );
      },
    );
  }

  List<Map<String, dynamic>> _generateSlots(DateTime? date, TimeOfDay? time) {
    List<Map<String, dynamic>> slots = [];
    bool isWeekend = date != null && (date.weekday == DateTime.saturday || date.weekday == DateTime.sunday);
    bool isPeakTime = time != null && (time.hour >= 17 && time.hour < 20);

    int availableSlots = isWeekend || isPeakTime ? 5 : 10;
    double price = isWeekend || isPeakTime ? 100.0 : 40.0;

    for (int i = 1; i <= availableSlots; i++) {
      slots.add({
        'slot': 'Slot $i',
        'price': price,
        'status': i % 2 == 0 ? 'occupied' : 'vacant',
      });
    }

    return slots;
  }
}

class SlotSelectionPage extends StatefulWidget {
  final List<Map<String, dynamic>> slots;
  final String placeName;

  SlotSelectionPage({required this.slots, required this.placeName});

  @override
  _SlotSelectionPageState createState() => _SlotSelectionPageState();
}

class _SlotSelectionPageState extends State<SlotSelectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Slot for ${widget.placeName}'),
      ),
      body: ListView.builder(
        itemCount: widget.slots.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(widget.slots[index]['slot']),
            subtitle: Text('Price: ₹${widget.slots[index]['price']}'),
            trailing: Text(
              widget.slots[index]['status'].toUpperCase(),
              style: TextStyle(
                color: widget.slots[index]['status'] == 'occupied' ? Colors.red : Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              if (widget.slots[index]['status'] == 'vacant') {
                _bookSlot(index);
              } else {
                _navigateToQRPage(widget.slots[index]['slot'], widget.slots[index]['price'], widget.placeName);
              }
            },
          );
        },
      ),
    );
  }

  void _bookSlot(int index) {
    setState(() {
      widget.slots[index]['status'] = 'occupied';
    });
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PaymentPage(
          slot: widget.slots[index]['slot'],
          price: widget.slots[index]['price'],
          placeName: widget.placeName,
        ),
      ),
    );
  }

  void _navigateToQRPage(String slot, double price, String placeName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QrCodePage(
          data: 'Slot: $slot, Place: $placeName, Price: ₹${price.toString()}',
          onVacateSlot: () {
            setState(() {
              widget.slots.firstWhere((element) => element['slot'] == slot)['status'] = 'vacant';
            });
          },
        ),
      ),
    );
  }
}

class PaymentPage extends StatelessWidget {
  final String slot;
  final double price;
  final String placeName;

  PaymentPage({required this.slot, required this.price, required this.placeName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Slot: $slot', style: TextStyle(fontSize: 20)),
            Text('Place: $placeName', style: TextStyle(fontSize: 20)),
            Text('Price: ₹${price.toString()}', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ConfirmationPage(slot: slot, price: price, placeName: placeName),
                  ),
                );
              },
              child: Text('Pay'),
            ),
          ],
        ),
      ),
    );
  }
}

class ConfirmationPage extends StatelessWidget {
  final String slot;
  final double price;
  final String placeName;

  ConfirmationPage({required this.slot, required this.price, required this.placeName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Confirmation'),
        ),
        body: Padding(
        padding: const EdgeInsets.all(16.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text('Slot: $slot', style: TextStyle(fontSize: 20)),
    Text('Place: $placeName', style: TextStyle(fontSize: 20)),
    Text('Price: ₹${price.toString()}', style: TextStyle(fontSize: 20)),
    SizedBox(height: 20),
    ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => QrCodePage(data: 'Slot: $slot, Place: $placeName, Price: ₹${price.toString()}'),
            ),
          );
        },
        child: Text('Confirm'),
      ),
      SizedBox(height: 20),
      ElevatedButton(
        onPressed: () {
          Navigator.popUntil(context, ModalRoute.withName('/'));
        },
        child: Text('Cancel'),
      ),
    ],
    ),
        ),
    );
  }
}

class QrCodePage extends StatelessWidget {
  final String data;
  final VoidCallback? onVacateSlot;

  QrCodePage({required this.data, this.onVacateSlot});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QrImageView(
              data: data,
              version: QrVersions.auto,
              size: 200.0,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (onVacateSlot != null) {
                  _showConfirmationDialog(context);
                }
              },
              child: Text('Vacate Slot'),
            ),
          ],
        ),
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Vacate Slot'),
          content: Text('Are you sure you want to vacate this slot?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('No'),
            ),
            ElevatedButton(
              onPressed: () {
                onVacateSlot!();
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Slot vacated successfully!'),
                  duration: Duration(seconds: 2),
                ));
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }
}
