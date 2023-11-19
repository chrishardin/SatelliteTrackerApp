import 'package:flutter/material.dart';

class EditableListTile extends StatefulWidget {
  IconData icon;
  String label;
  String value;
  final bool isPassword;

  EditableListTile({
    Key? key,
    required this.icon,
    required this.label,
    required this.value,
    this.isPassword = false,
  }) : super(key: key);
  @override
  _EditableListTileState createState() => _EditableListTileState();
}

class _EditableListTileState extends State<EditableListTile> {
  bool _isEditing = false;
  late TextEditingController _controller;
  late FocusNode _focusNode;

// Initialize the controller and focus node when the widget is created
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
    _focusNode = FocusNode();
  }

// Clean up the controller and focus node when the widget is disposed
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

// Update the text field state when the widget changes
  @override
  void didUpdateWidget(EditableListTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value && !_isEditing) {
      _controller.text = widget.value;
    }
  }

// Handle save button tap
  void _handleSave() {
    setState(() {
      _isEditing = false; // Exit edit mode
    });
  }

// Show the text field or text view based on whether or not the user is editing
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(widget.icon, size: 30),
      title: Text(widget.label),
      subtitle: _isEditing
          ? TextField(
              controller: _controller,
              focusNode: _focusNode,
              autofocus: true,
              onSubmitted: (newValue) => _handleSave(),
              obscureText: widget.isPassword,
            )
          : Text(widget.isPassword ? '••••••••' : _controller.text),
      trailing: IconButton(
        icon: Icon(_isEditing ? Icons.check : Icons.edit),
        onPressed: () {
          if (_isEditing) {
            _handleSave();
          } else {
            setState(() {
              _isEditing = true;
              _focusNode.requestFocus();
              _controller.selection = TextSelection(
                  baseOffset: 0, extentOffset: _controller.text.length);
            });
          }
        },
      ),
      onTap: () {
        // Enter edit mode when the ListTile is tapped.
        setState(() {
          _isEditing = true;
          _focusNode.requestFocus();
          _controller.selection = TextSelection(
              baseOffset: 0, extentOffset: _controller.text.length);
        });
      },
      shape: const Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
    );
  }
}

class ProfileEditPage extends StatelessWidget {
  final Function(String) changeView;

  ProfileEditPage({Key? key, required this.changeView}) : super(key: key);

  Widget _buildSaveButton() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: () => print('TODO: Save changes'),
        child: const Text('Save Changes'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          EditableListTile(
              icon: Icons.person, label: 'Name', value: 'John Doe'),
          EditableListTile(
              icon: Icons.email, label: 'Email', value: 'john_doe@email.com'),
          EditableListTile(
              icon: Icons.lock,
              label: 'Password',
              value: '********',
              isPassword: true),
          _buildSaveButton(),
          ElevatedButton(
              onPressed: () => changeView('settings'),
              child: const Text('Back')),
        ],
      ),
    );
  }
}
