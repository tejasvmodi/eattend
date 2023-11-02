import 'package:design/screens/experts/expert_list.dart';
import 'package:flutter/material.dart';

class AlertBox extends StatelessWidget {
  
  const AlertBox({super.key});

  @override
  Widget build(BuildContext context) {
    return alert_button();
}
}

class alert_button extends StatelessWidget {
  const alert_button({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
            onPressed: () {
             
           
    showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title: const Text("Alert Dialog Box"),
                content: const Text("You have raised a Alert Dialog Box"),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    }, child: const Text("done"),)
                ],
              ),
    );
              },
    
            child: Text('I AM Present',style: TextStyle(fontSize: 15),),
          );
          
  }
}