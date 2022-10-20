import 'package:flutter/material.dart';
import 'empleado.dart';
import 'empleadoBloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageSate createState() => _HomePageSate();
}

class _HomePageSate extends State<HomePage> {
  final EmpleadoBloc _empleadoBloc = EmpleadoBloc();

  showAlertDialog(BuildContext context) {
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {},
    );

    AlertDialog alert = AlertDialog(
      title: Text("Prueba"),
      content: Text("This is alert dialog."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _empleadoBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App empleado"),
      ),
      body: Container(
        child: StreamBuilder<List<Empleado>>(
          stream: _empleadoBloc.empleadoListStrem,
          builder:
              (BuildContext context, AsyncSnapshot<List<Empleado>> snapshot) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          "${snapshot.data![index].id}",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "${snapshot.data![index].nombre}",
                              style: TextStyle(fontSize: 18.0),
                            ),
                            Text(
                              " ${snapshot.data![index].salario}",
                              style: TextStyle(fontSize: 16.0),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: IconButton(
                          icon: Icon(Icons.thumb_up),
                          color: Colors.green,
                          onPressed: () {
                            final snackBar = SnackBar(
                              content: const Text('Yay! A SnackBar!'),
                              action: SnackBarAction(
                                label: 'Undo',
                                onPressed: () {
                                  // Some code to undo the change.
                                },
                              ),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SecondScreen()),
                            );
                          },
                        ),
                      ),
                      Container(
                        //SECON ICON
                        child: Image(
                          image: NetworkImage(
                              "https://play-lh.googleusercontent.com/5e7z5YCt7fplN4qndpYzpJjYmuzM2WSrfs35KxnEw-Ku1sClHRWHoIDSw3a3YS5WpGcI"),
                          height: 70,
                        ),
                      ),
                      Container(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.redAccent,
                          valueColor: AlwaysStoppedAnimation(Colors.green),
                          strokeWidth: 10,
                        ),
                      )
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAlertDialog(context);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
// 1.
  final List<Appliance> appliances = [
    Appliance('TV'),
    Appliance('Fan'),
    Appliance('Refrigerator'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Second Screen"),
        ),
        body: ListView.builder(
          itemCount: appliances.length,
          itemBuilder: (context, index) {
            return SwitchListTile(
              // 2.
              title: Text('${appliances[index].name}'),
              // 3.
              value: appliances[index].isOn,
              // 4.
              onChanged: (bool value) {
                /*setState(() {
                      appliances[index].isOn = value;
                    });*/
              },
            );
          },
        ));
  }
}

class Appliance {
  String name;
  bool isOn;
  Appliance(this.name, {this.isOn = false});
}
