import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final Function(bool)? onThemeChanged;

  const HomeScreen({super.key, this.onThemeChanged});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final isMobile = width < 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Center(
              child: Switch(
                value: isDarkMode,
                onChanged: (value) {
                  onThemeChanged?.call(value);
                },
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width > 600 ? 40.0 : 16.0,
              vertical: width > 600 ? 30.0 : 16.0,
            ),
            child: isMobile
                ? _buildMobileLayout(context)
                : _buildTabletLayout(context),
          ),
        ),
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Here lesson 14',
            style: Theme.of(context).textTheme.headlineLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          const Icon(
            Icons.arrow_downward_sharp,
            size: 40,
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/list');
            },
            icon: const Icon(
              Icons.touch_app_outlined,
              size: 60,
              color: Colors.amber,
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.arrow_forward_outlined, size: 40),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/cartoon');
                },
                icon: const Icon(
                  Icons.movie_creation_outlined,
                  size: 60,
                  color: Colors.red,
                ),
              ),
              const Icon(Icons.arrow_back_outlined, size: 40),
              Expanded(
                child: Text(
                  'Here lesson 15',
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.arrow_forward_outlined, size: 40),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/counter');
                },
                icon: const Icon(
                  Icons.control_point_duplicate_rounded,
                  size: 60,
                  color: Colors.red,
                ),
              ),
              const Icon(Icons.arrow_back_outlined, size: 40),
              Expanded(
                child: Text(
                  'Here lesson 16',
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.arrow_forward_outlined, size: 40),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/tasks');
                },
                icon: const Icon(
                  Icons.control_point_duplicate_rounded,
                  size: 60,
                  color: Colors.red,
                ),
              ),
              const Icon(Icons.arrow_back_outlined, size: 40),
              Expanded(
                child: Text(
                  'Here lesson 17',
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/guitar');
                },
                icon: const Icon(Icons.my_library_music, size: 50),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/details');
                },
                icon: const Icon(Icons.details, size: 50),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/settings',
                    arguments: 'From Home Screen',
                  );
                },
                icon: const Icon(Icons.settings, size: 50),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTabletLayout(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            'Here lesson 14',
            style: Theme.of(context)
                .textTheme
                .headlineLarge
                ?.copyWith(fontSize: 40),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          const Icon(Icons.arrow_downward_sharp, size: 50),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/list');
            },
            icon: const Icon(
              Icons.touch_app_outlined,
              size: 80,
              color: Colors.amber,
            ),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.arrow_forward_outlined, size: 50),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/cartoon');
                },
                icon: const Icon(
                  Icons.movie_creation_outlined,
                  size: 80,
                  color: Colors.red,
                ),
              ),
              const Icon(Icons.arrow_back_outlined, size: 50),
              Text(
                'Here lesson 15',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontSize: 20),
              ),
              const SizedBox(width: 40),
              const Icon(Icons.arrow_forward_outlined, size: 50),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/counter');
                },
                icon: const Icon(
                  Icons.control_point_duplicate_rounded,
                  size: 80,
                  color: Colors.red,
                ),
              ),
              const Icon(Icons.arrow_back_outlined, size: 50),
              Text(
                'Here lesson 16',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontSize: 20),
              ),
            ],
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.arrow_forward_outlined, size: 50),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/tasks');
                },
                icon: const Icon(
                  Icons.control_point_duplicate_rounded,
                  size: 80,
                  color: Colors.red,
                ),
              ),
              const Icon(Icons.arrow_back_outlined, size: 50),
              Text(
                'Here lesson 17',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontSize: 20),
              ),
            ],
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _FeatureButton(
                icon: Icons.my_library_music,
                label: 'Music',
                onPressed: () {
                  Navigator.pushNamed(context, '/guitar');
                },
              ),
              _FeatureButton(
                icon: Icons.details,
                label: 'Details',
                onPressed: () {
                  Navigator.pushNamed(context, '/details');
                },
              ),
              _FeatureButton(
                icon: Icons.settings,
                label: 'Settings',
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/settings',
                    arguments: 'From Home Screen',
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _FeatureButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const _FeatureButton({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(icon, size: 60),
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
