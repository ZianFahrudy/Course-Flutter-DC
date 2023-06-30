import 'package:event_app/common/utils/palette.dart';
import 'package:event_app/common/utils/typography.dart';
import 'package:event_app/core/constants/api_path.dart';
import 'package:event_app/core/env/env_config.dart';
import 'package:event_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is ProfilMemberSuccess) {
          return Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
            width: double.infinity,
            color: Palette.homeAppBar,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Welcome Back,',
                      style: MyTypography.bodySmall.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      state.response.data.memberName,
                      style: MyTypography.bodyLarge.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 40,
                  height: 40,
                  padding: const EdgeInsets.all(1),
                  decoration: const BoxDecoration(
                    color: Palette.greyAvatar,
                    shape: BoxShape.circle,
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(1),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(36),
                      child: Image.network(
                        '${EnvConfig.getInstance()!.apiBaseUrl!}${ApiPath.imageMember}/${state.response.data.memberAvatar}',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        } else if (state is AuthLoading) {
          return Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
            width: double.infinity,
            color: Palette.homeAppBar,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Welcome Back,',
                      style: MyTypography.bodySmall.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '........',
                      style: MyTypography.bodyLarge.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 40,
                  height: 40,
                  padding: const EdgeInsets.all(1),
                  decoration: const BoxDecoration(
                    color: Palette.greyAvatar,
                    shape: BoxShape.circle,
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(1),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(36),
                      child: Image.network(
                        'https://static.wikia.nocookie.net/naruto/images/2/21/Sasuke_Part_1.png/revision/latest?cb=20170621055519&path-prefix=id',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        } else if (state is AuthFailure) {
          return Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
            width: double.infinity,
            color: Palette.homeAppBar,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Welcome Back,',
                      style: MyTypography.bodySmall.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '........',
                      style: MyTypography.bodyLarge.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 40,
                  height: 40,
                  padding: const EdgeInsets.all(1),
                  decoration: const BoxDecoration(
                    color: Palette.greyAvatar,
                    shape: BoxShape.circle,
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(1),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(36),
                      child: Image.network(
                        'https://static.wikia.nocookie.net/naruto/images/2/21/Sasuke_Part_1.png/revision/latest?cb=20170621055519&path-prefix=id',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}
