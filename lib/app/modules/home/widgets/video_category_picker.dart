import 'package:flutter/material.dart';
import 'package:mobile/app/core/theme/colors.dart';

enum VideoCategory { exterior, interior, social }

class VideoCategoryPicker extends StatefulWidget {
  const VideoCategoryPicker({
    Key? key,
    required this.onCategoryChanged,
    this.initialValue = VideoCategory.exterior,
  }) : super(key: key);

  final VideoCategory initialValue;
  final void Function(VideoCategory category) onCategoryChanged;

  @override
  State<VideoCategoryPicker> createState() => _VideoCategoryPickerState();
}

class _VideoCategoryPickerState extends State<VideoCategoryPicker> {
  late VideoCategory _selectedCat;

  @override
  void initState() {
    super.initState();
    _selectedCat = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return ChipTheme(
      data: ChipThemeData(selectedColor: kColorChoiceChipSelected),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ChoiceChip(
              label: const Text('Exterior'),
              selected: _selectedCat == VideoCategory.exterior,
              onSelected: (_) {
                _selectCategory(VideoCategory.exterior);
              },
            ),
            ChoiceChip(
              label: const Text('Interior'),
              selected: _selectedCat == VideoCategory.interior,
              onSelected: (_) {
                _selectCategory(VideoCategory.interior);
              },
            ),
            ChoiceChip(
              label: const Text('Social'),
              selected: _selectedCat == VideoCategory.social,
              onSelected: (_) {
                _selectCategory(VideoCategory.social);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _selectCategory(VideoCategory cat) {
    setState(() {
      _selectedCat = cat;
    });
  }
}
