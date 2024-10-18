import 'package:flutter/material.dart';

class GenderInput extends StatefulWidget {
  const GenderInput({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  State<GenderInput> createState() {
    return _GenderInputState();
  }
}

class _GenderInputState extends State<GenderInput> {
  @override
  void initState() {
    super.initState();
    widget.controller.text = 'Male';
  }

  //Show Dialog to select Gender
  Future<void> _showOptionsDialog() async {
    final selected = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          elevation: 8,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
            side: BorderSide(width: 1),
          ),
          child: Container(
            width: 200,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: const Offset(3, 5),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: const Text(
                    'Male',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(
                      context,
                      'Male',
                    );
                  },
                ),
                ListTile(
                  title: const Text(
                    'Female',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context, 'Female');
                  },
                ),
                ListTile(
                  title: const Text(
                    'NA',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context, 'NA');
                  },
                ),
              ],
            ),
          ),
        );
      },
    );

    if (selected != null) {
      setState(() {
        widget.controller.text = selected;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 75,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color.fromARGB(146, 222, 221, 221),
      ),
      padding: const EdgeInsets.only(left: 12, top: 4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Gender',
            style: TextStyle(
              color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
              fontSize: 12,
            ),
          ),
          const SizedBox(
            height: 0,
          ),
          TextFormField(
            controller: widget.controller,
            onTap: _showOptionsDialog,
            readOnly: true,
            decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.only(
                left: 12,
                bottom: 20,
                top: 4,
                right: 6,
              ),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
            ),
          ),
        ],
      ),
    );
  }
}
