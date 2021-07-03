import 'package:flutter/material.dart';

class GridBox extends StatefulWidget {
  @override
  GridBoxState createState() => GridBoxState();
}

class GridBoxState extends State<GridBox> {
  @override
  Widget build(BuildContext context) {
    String gridCount = '1';
    final TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: Text('Grid Box')),
      body: Column(
        children: [
          TextFormField(
            controller: controller,
            // onSaved: (value) {
            //   setState(() {
            //     print('Before Count value --> $gridCount');
            //     gridCount = value;
            //     print('Count value --> $gridCount');
            //   });
            // },
          ),
          TextButton(
              onPressed: () {
                setState(() {});
                print('Grid Count --> $gridCount');
                gridCount = controller.text;
                print('New Grid Count --> $gridCount');
              },
              child: Text('Done')),
          controller.text.isEmpty
              ? Container()
              : Expanded(
                  child: GridView.builder(
                    itemCount: int.parse(controller.text),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemBuilder: (context, index) => Card(
                      child: GridTile(
                        footer: Text('Name'),
                        child: Text('Image ${index + 1}'),
                      ),
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
