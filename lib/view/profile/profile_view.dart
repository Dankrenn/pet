import 'package:flutter/material.dart';
import 'package:pet/utils/app_theme.dart';
import 'package:pet/view/profile/pet_cart_widget.dart';
import 'package:pet/view_models/profile_model.dart';
import 'package:pet/view_models/settings_model.dart';
import 'package:provider/provider.dart';
import '../help_widgets/my_button.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileModel(),
      child: const _ProfileScreen(),
    );
  }
}

class _ProfileScreen extends StatelessWidget {
  const _ProfileScreen();

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ProfileModel>(context);
    final theme = Provider.of<SettingsModel>(context).theme;
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Профиль",
          style: textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: colorScheme.onPrimary,
          ),
        ),
        centerTitle: true,
        backgroundColor: colorScheme.primary,
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: colorScheme.onPrimary),
            onPressed: () => model.goSetting(context),
          ),
          IconButton(
            icon: Icon(Icons.logout, color: colorScheme.onPrimary),
            onPressed: () => model.logout(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 24),
            _buildUserAvatar(context),
            const SizedBox(height: 24),
            _buildUserInfo(context),
            const SizedBox(height: 24),
            _buildAddPetButton(context),
            const SizedBox(height: 32),
            _buildPetsSection(context),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}


  Widget _buildUserAvatar(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: colorScheme.primary.withOpacity(0.2),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: CircleAvatar(
        radius: 64,
        backgroundColor: colorScheme.primary.withOpacity(0.1),
        child: Icon(
          Icons.person,
          size: 64,
          color: colorScheme.primary,
        ),
      ),
    );
  }

  Widget _buildUserInfo(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colorScheme.surfaceVariant.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            'Иван Иванов',
            style: textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'user@example.com',
            style: textTheme.bodyLarge?.copyWith(
              color: colorScheme.onSurface.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddPetButton(BuildContext context) {
  final model = Provider.of<ProfileModel>(context);
    return SizedBox(
      width: double.infinity,
      child: MyButton(
        text: "Добавить питомца",
        callback: () => model.goAddPet(context),
        elevation: 1,
      ),
    );
  }

  Widget _buildPetsSection(BuildContext context) {
    final model = Provider.of<ProfileModel>(context);
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Мои питомцы',
          style: textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 16),
        _buildPetsList(model),
      ],
    );
  }

  Widget _buildPetsList(ProfileModel model) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: 200,
        maxHeight: 400,
      ),
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: model.pets.length,
        itemBuilder: (context, index) => PetCard(pet: model.pets[index]),
        separatorBuilder: (context, index) => const SizedBox(height: 12),
      ),
    );
  }