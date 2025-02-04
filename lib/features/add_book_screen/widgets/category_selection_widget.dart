import 'package:flutter/material.dart';

class CategoryCheckboxList extends StatefulWidget {
  final List<String> categories;
  final Function(List<String>) onSelectionChanged;

  const CategoryCheckboxList(
      {super.key, required this.categories, required this.onSelectionChanged});

  @override
  State<CategoryCheckboxList> createState() => _CategoryCheckboxListState();
}

class _CategoryCheckboxListState extends State<CategoryCheckboxList> {
  List<String> selectedCategories = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 8, vertical: 5), // Minimal padding
      child: GridView.builder(
        shrinkWrap: true,
        physics:
            NeverScrollableScrollPhysics(), // Disable scrolling inside list
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // 3 checkboxes per row
          mainAxisSpacing: 5, // Minimal spacing between rows
          crossAxisSpacing: 5, // Minimal spacing between columns
          childAspectRatio: 3, // Adjust ratio to prevent text wrapping
        ),
        itemCount: widget.categories.length,
        itemBuilder: (context, index) {
          String category = widget.categories[index];
          bool isSelected = selectedCategories.contains(category);

          return GestureDetector(
            onTap: () {
              setState(() {
                if (isSelected) {
                  selectedCategories.remove(category);
                } else {
                  selectedCategories.add(category);
                }
                widget.onSelectionChanged(selectedCategories);
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: 6, vertical: 2), // Small padding
              decoration: BoxDecoration(
                color: isSelected
                    ? Colors.grey.withOpacity(0.3)
                    : Colors.transparent,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    value: isSelected,
                    onChanged: (bool? checked) {
                      setState(() {
                        if (checked == true) {
                          selectedCategories.add(category);
                        } else {
                          selectedCategories.remove(category);
                        }
                        widget.onSelectionChanged(selectedCategories);
                      });
                    },
                    visualDensity:
                        VisualDensity.compact, // Reduces checkbox size
                  ),
                  Expanded(
                    child: Text(
                      category,
                      overflow:
                          TextOverflow.ellipsis, // Prevents text from wrapping
                      style: TextStyle(fontSize: 14, color: Colors.white60),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
