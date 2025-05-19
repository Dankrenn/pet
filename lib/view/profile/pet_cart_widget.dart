import 'package:flutter/material.dart';
import 'package:pet/data/pet.dart';
import 'package:pet/view_models/profile_model.dart';
import 'package:pet/view_models/settings_model.dart';
import 'package:provider/provider.dart';

class PetCard extends StatelessWidget {
  final Pet pet;

  const PetCard({super.key, required this.pet});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Provider.of<SettingsModel>(context).theme.colorScheme;

    return Card(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: Provider.of<ProfileModel>(context)
              .getPetGradient(colorScheme, pet.type),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: _PetCardContent(pet: pet),
        ),
      ),
    );
  }
}

class _PetCardContent extends StatelessWidget {
  final Pet pet;

  const _PetCardContent({required this.pet});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _PetInfoRow(pet: pet),
        const SizedBox(height: 12),
        _VaccinationsList(pet: pet),
      ],
    );
  }
}

class _PetInfoRow extends StatelessWidget {
  final Pet pet;

  const _PetInfoRow({required this.pet});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final model = Provider.of<ProfileModel>(context);

    return Row(
      children: [
        _PetAvatar(pet: pet),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              pet.name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: colorScheme.onPrimary,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '${pet.type}, ${pet.breed}',
              style: TextStyle(
                color: colorScheme.onPrimary,
              ),
            ),
            const SizedBox(height: 4),
            _PetInfoItem(
              icon: Icons.cake,
              text: '${pet.age} ${model.getAgeWord(pet.age)}',
            ),
            _PetInfoItem(
              icon: pet.gender == 'Мужской' ? Icons.male : Icons.female,
              text: pet.gender,
            ),
            _PetInfoItem(
              icon: Icons.palette,
              text: pet.color,
            ),
          ],
        ),
      ],
    );
  }
}

class _PetAvatar extends StatelessWidget {
  final Pet pet;

  const _PetAvatar({required this.pet});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: 80,
      height: 80,
      child: ClipOval(
        child: pet.imageUrl.isNotEmpty
            ? Image.network(
          pet.imageUrl,
          fit: BoxFit.cover,
        )
            : _DefaultPetIcon(pet: pet),
      ),
    );
  }
}

class _DefaultPetIcon extends StatelessWidget {
  final Pet pet;

  const _DefaultPetIcon({required this.pet});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Center(
      child: Icon(
        pet.type == 'Собака' ? Icons.pets : Icons.no_accounts,
        size: 40,
        color: colorScheme.onPrimaryContainer,
      ),
    );
  }
}

class _PetInfoItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const _PetInfoItem({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Icon(icon, size: 16, color: colorScheme.onPrimary),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(color: colorScheme.onPrimary),
          ),
        ],
      ),
    );
  }
}

class _VaccinationsList extends StatelessWidget {
  final Pet pet;

  const _VaccinationsList({required this.pet});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Прививки:',
          style: TextStyle(fontSize: 18, color: colorScheme.onPrimary),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: pet.vaccinations.length,
            itemBuilder: (context, index) => _VaccinationChip(
              vaccine: pet.vaccinations[index],
            ),
          ),
        ),
      ],
    );
  }
}

class _VaccinationChip extends StatelessWidget {
  final String vaccine;

  const _VaccinationChip({Key? key, required this.vaccine}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Chip(
        label: Text(vaccine),
        backgroundColor: colorScheme.primaryContainer,
        labelStyle: TextStyle(
          color: colorScheme.surface,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        side: BorderSide.none,
      ),
    );
  }
}
