import 'package:flutter/material.dart';
import 'package:pet/view_models/add_pet_model.dart';
import 'package:provider/provider.dart';
import '../help_widgets/my_button.dart';

class AddPetView extends StatelessWidget {
  const AddPetView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AddPetModel(),
      child: const _AddPetScreen(),
    );
  }
}

class _AddPetScreen extends StatelessWidget {
  const _AddPetScreen();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Добавить питомца',
          style: textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: colorScheme.onPrimary,
          ),
        ),
        centerTitle: true,
        backgroundColor: colorScheme.primary,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: colorScheme.onPrimary),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const _PetAvatarSection(),
            const SizedBox(height: 24),
            _buildPetForm(context),
            const SizedBox(height: 32),
            _buildSaveButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildPetForm(BuildContext context) {
    final model = Provider.of<AddPetModel>(context);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Column(
      children: [
        _buildTextField(
          context,
          label: 'Имя питомца',
          value: model.name,
          onChanged: (value) => model.setName(value ?? ''),
          icon: Icons.pets,
        ),
        const SizedBox(height: 16),
        _buildDropdownField(
          context,
          label: 'Вид животного',
          value: model.type,
          items: const ['Кошка', 'Собака', 'Попугай', 'Хомяк', 'Другое'],
          onChanged: (value) => model.setType(value ?? 'Кошка'),
          icon: Icons.category,
        ),
        const SizedBox(height: 16),
        _buildTextField(
          context,
          label: 'Порода',
          value: model.breed,
          onChanged: (value) => model.setBreed(value ?? ''),
          icon: Icons.emoji_nature,
        ),
        const SizedBox(height: 16),
        _buildSliderField(
          context,
          label: 'Возраст',
          value: model.age.toDouble(),
          min: 1,
          max: 30,
          onChanged: (value) => model.setAge(value.toInt()),
          icon: Icons.cake,
        ),
        const SizedBox(height: 16),
        _buildDropdownField(
          context,
          label: 'Пол',
          value: model.gender,
          items: const ['Мужской', 'Женский'],
          onChanged: (value) => model.setGender(value ?? 'Мужской'),
          icon: Icons.male,
        ),
        const SizedBox(height: 16),
        _buildTextField(
          context,
          label: 'Окрас',
          value: model.color,
          onChanged: (value) => model.setColor(value ?? ''),
          icon: Icons.palette,
        ),
        const SizedBox(height: 16),
        _buildVaccinationsField(context),
      ],
    );
  }

  Widget _buildTextField(
      BuildContext context, {
        required String label,
        required String value,
        required Function(String) onChanged,
        required IconData icon,
      }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return TextField(
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: colorScheme.primary),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorScheme.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorScheme.primary, width: 2),
        ),
      ),
      onChanged: onChanged,
      controller: TextEditingController(text: value),
    );
  }

  Widget _buildDropdownField(
      BuildContext context, {
        required String label,
        required String value,
        required List<String> items,
        required Function(String?) onChanged,
        required IconData icon,
      }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return InputDecorator(
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: colorScheme.primary),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isDense: true,
          isExpanded: true,
          items: items.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  Widget _buildSliderField(
      BuildContext context, {
        required String label,
        required double value,
        required double min,
        required double max,
        required Function(double) onChanged,
        required IconData icon,
      }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            label,
            style: textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurface.withOpacity(0.6),
            ),
          ),
        ),
        Row(
          children: [
            Icon(icon, color: colorScheme.primary),
            const SizedBox(width: 12),
            Expanded(
              child: Slider(
                value: value,
                min: min,
                max: max,
                divisions: (max - min).toInt(),
                label: value.toInt().toString(),
                onChanged: onChanged,
                activeColor: colorScheme.primary,
                inactiveColor: colorScheme.primary.withOpacity(0.3),
              ),
            ),
            Container(
              width: 40,
              alignment: Alignment.center,
              child: Text(
                value.toInt().toString(),
                style: textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildVaccinationsField(BuildContext context) {
    final model = Provider.of<AddPetModel>(context);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Прививки',
          style: textTheme.bodySmall?.copyWith(
            color: colorScheme.onSurface.withOpacity(0.6),
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: model.vaccinations.map((vaccine) {
            return Chip(
              label: Text(vaccine),
              deleteIcon: Icon(Icons.close, size: 18),
              onDeleted: () => model.removeVaccination(vaccine),
              backgroundColor: colorScheme.primaryContainer,
              labelStyle: TextStyle(color: colorScheme.onPrimaryContainer),
            );
          }).toList(),
        ),
        const SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            hintText: 'Добавить прививку...',
            suffixIcon: IconButton(
              icon: Icon(Icons.add, color: colorScheme.primary),
              onPressed: () {
                final controller = TextEditingController();
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Добавить прививку'),
                    content: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        hintText: 'Название прививки',
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('Отмена'),
                      ),
                      TextButton(
                        onPressed: () {
                          if (controller.text.isNotEmpty) {
                            model.addVaccination(controller.text);
                            Navigator.pop(context);
                          }
                        },
                        child: Text('Добавить'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSaveButton(BuildContext context) {
    final model = Provider.of<AddPetModel>(context);

    return SizedBox(
      width: double.infinity,
      child: MyButton(
        text: "Сохранить",
        callback: () async {
          try {
            await model.savePet(context);
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(e.toString())),
            );
          }
        },
        elevation: 2,
      ),
    );
  }
}

class _PetAvatarSection extends StatelessWidget {
  const _PetAvatarSection();

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AddPetModel>(context);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            // Заглушка для загрузки изображения
            model.setImageUrl('https://example.com/pet_image.jpg');
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Фото добавлено')),
            );
          },
          child: Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colorScheme.primary.withOpacity(0.1),
              border: Border.all(
                color: colorScheme.primary.withOpacity(0.3),
                width: 2,
              ),
            ),
            child: model.imageUrl.isEmpty
                ? Icon(
              Icons.add_a_photo,
              size: 40,
              color: colorScheme.primary,
            )
                : ClipOval(
              child: Image.network(
                model.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Добавить фото',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colorScheme.primary,
          ),
        ),
      ],
    );
  }
}