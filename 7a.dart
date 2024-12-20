import 'package:flutter/material.dart';

void main() {   
  runApp(MyApp()); 
}

// Main App Widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {     
    return MaterialApp(
      title: 'Simple Form App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyFormPage(),
    );
  }
}

// Form Page Widget
class MyFormPage extends StatefulWidget {
  @override
  _MyFormPageState createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {   
  final _formKey = GlobalKey<FormState>(); // Form Key to validate form
  final TextEditingController _nameController = TextEditingController();   
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Form App'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[

              // Name Input Field
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Enter Your Name', 
                  border: OutlineInputBorder(),
                ),
                validator: (value) {                   
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }                   
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Email Input Field
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Enter Your Email', 
                  border: OutlineInputBorder(),
                ),
                validator: (value) {                   
                  if (value == null || value.isEmpty) {                     
                    return 'Please enter your email';
                  } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                      .hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }                   
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Password Input Field
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Enter Your Password', 
                  border: OutlineInputBorder(),
                ),
                validator: (value) {                   
                  if (value == null || value.isEmpty) {                     
                    return 'Please enter your password';                   
                  } else if (value.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }                   
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Submit Button
              ElevatedButton(
                onPressed: () {                   
                  if (_formKey.currentState!.validate()) { 
                    // If form is valid, print the data                   
                    print('Name: ${_nameController.text}');                     
                    print('Email: ${_emailController.text}');                     
                    print('Password: ${_passwordController.text}');
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
