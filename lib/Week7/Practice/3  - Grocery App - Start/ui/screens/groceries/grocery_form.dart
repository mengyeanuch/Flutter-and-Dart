// ---------------------------------------------
// Create a new statefull widget : GroceryForm
// ---------------------------------------------

// The form shall be composed of 2 text fields:
// -	Name of the grocery item
//-	Quantity (number only)

// ⚠️  For now we don’t select the grocery type, we assume it’s always food

// The form shall be composed of 2 buttons:
//-	Cancel button
// -	Add item button
import 'package:flutter/material.dart';
import '../../../models/grocery.dart';

class GroceryForm extends StatefulWidget {
  const GroceryForm({super.key});

  @override
  State<GroceryForm> createState() => _GroceryFormState();
}

class _GroceryFormState extends State<GroceryForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  @override
  void dispose() {
    _nameController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  void _reset(){
    _nameController.clear();
    _quantityController.clear();
  }

  @override
  Widget build(BuildContext context) {

   return Padding(
      padding: EdgeInsets.fromLTRB(
        16,
        16,
        16,
        MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Add a new item',
                    style: TextStyle(
                      fontSize: 20,

                    ),
                  ),
                ]
                    
              ),
            ),
            
            TextField(
              controller: _nameController,
              maxLength: 50,
              decoration: const InputDecoration(labelText: 'Name'),
            ),

            const SizedBox(height: 10),

            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _quantityController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Quantity'),
                  ),
                ),

              ],
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: _reset, child: const Text("Reset")),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    final grocery = GroceryItem(
                      id: DateTime.now().toString(),
                      name: _nameController.text,
                      quantity: int.parse(_quantityController.text),
                      category: GroceryCategory.fruit,
                    );
                    Navigator.pop(context,grocery);
                  },
                  child: const Text("Add Item"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
