import 'package:flutter/material.dart';

class GlobalAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showProfile;
  final bool showBack;
  final VoidCallback? onBack;

  const GlobalAppBar({
    super.key,
    this.title = 'LAVE',
    this.showProfile = true,
    this.showBack = false,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.2))),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leadingWidth: 70,
        leading: showBack 
          ? IconButton(
              onPressed: () => onBack != null ? onBack!() : Navigator.pop(context),
              icon: const Icon(Icons.arrow_back, color: Colors.black87),
            )
          : (showProfile ? _buildProfileImage() : null),
        title: Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                letterSpacing: 8,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Colors.black87,
              ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search, color: Colors.black87)),
          IconButton(onPressed: () => Navigator.pushNamed(context, '/cart'), icon: const Icon(Icons.shopping_bag_outlined, color: Colors.black87)),
          const SizedBox(width: 8),
        ],
      ),
    );
  }

  Widget _buildProfileImage() {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Center(
        child: Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey.withOpacity(0.4)),
            image: const DecorationImage(
              image: AssetImage('asset/images/profile.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 20);
}
