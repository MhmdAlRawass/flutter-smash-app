import 'package:flutter/material.dart';

class GenderFieldUser extends StatefulWidget {
  const GenderFieldUser({
    super.key,
  });

  @override
  State<GenderFieldUser> createState() => _GenderFieldUserState();
}

class _GenderFieldUserState extends State<GenderFieldUser> {
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.text = 'Male';
  }

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
      controller.text = selected;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).colorScheme.onPrimary,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 2,
          ),
        ],
      ),
      alignment: Alignment.center,
      height: 70,
      child: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8, right: 8),
        child: TextFormField(
          decoration: InputDecoration(
            prefixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 12,
                  ),
                  child: Icon(
                    Icons.male,
                    size: 28,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Container(
                  height: double.infinity,
                  width: 0.5,
                  color: Colors.grey,
                  margin: const EdgeInsets.only(right: 12),
                ),
              ],
            ),
            labelText: 'Gender',
            disabledBorder: InputBorder.none,
            border: InputBorder.none,
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
          controller: controller,
          readOnly: true,
          onTap: () {
            _showOptionsDialog();
          },
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
