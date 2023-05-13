import 'package:flutter/material.dart';

class ButtonsBottomWidget extends StatelessWidget {
  final Function()? event;
  final Function()? back;

  const ButtonsBottomWidget({Key? key, required this.event, required this.back})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        FloatingActionButton(
          heroTag: UniqueKey(),
          backgroundColor: Colors.grey.shade300,
          onPressed: null,
          child: IconButton(
            color: Colors.green,
            onPressed: event,
            icon: const Icon(Icons.check),
          ),
        ),
        FloatingActionButton(
          heroTag: UniqueKey(),
          backgroundColor: Colors.grey.shade300,
          onPressed: null,
          child: IconButton(
            onPressed: back,
            icon: const Icon(
              Icons.cleaning_services,
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}
