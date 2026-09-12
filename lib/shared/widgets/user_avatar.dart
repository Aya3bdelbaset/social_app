import 'package:flutter/material.dart';
import '../../core/constants/app_assets.dart';
import '../../core/constants/app_sizes.dart';
import '../../core/theme/app_colors.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    super.key,
    this.imageUrl,
    this.assetPath,
    this.size = AppSizes.avatarMedium,
    this.borderWidth = 0,
    this.borderColor,
    this.onTap,
  });

  final String? imageUrl;
  final String? assetPath;

  final double size;

  final double borderWidth;
  final Color? borderColor;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final avatar = Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: borderWidth > 0
            ? Border.all(
                width: borderWidth,
                color: borderColor ?? AppColors.primary,
              )
            : null,
      ),
      child: ClipOval(
        child: _buildImage(),
      ),
    );

    if (onTap == null) {
      return avatar;
    }

    return GestureDetector(
      onTap: onTap,
      child: avatar,
    );
  }

  Widget _buildImage() {
    if (imageUrl != null && imageUrl!.isNotEmpty) {
      return Image.network(
        imageUrl!,
        width: size,
        height: size,
        fit: BoxFit.cover,
        errorBuilder: (_, _, _) {
          return _placeholder();
        },
      );
    }

    if (assetPath != null && assetPath!.isNotEmpty) {
      return Image.asset(
        assetPath!,
        width: size,
        height: size,
        fit: BoxFit.cover,
        errorBuilder: (_, _, _) {
          return _placeholder();
        },
      );
    }

    return _placeholder();
  }

  Widget _placeholder() {
    return Image.asset(
      AppAssets.placeholderAvatar,
      width: size,
      height: size,
      fit: BoxFit.cover,
      errorBuilder: (_, _, _) {
        return Container(
          color: AppColors.inputBackground,
          child: Icon(
            Icons.person,
            size: size * 0.5,
            color: AppColors.textSecondary,
          ),
        );
      },
    );
  }
}