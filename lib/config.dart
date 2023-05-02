import 'package:get/get.dart';
import 'controllers/common_controller/app_controller.dart';
export 'package:probot_admin/routes/screen_list.dart';
export 'package:get/get.dart';
export 'controllers/common_controller/app_controller.dart';
export 'package:flutter/material.dart';
export 'package:get_storage/get_storage.dart';
export 'package:image_picker/image_picker.dart';
export 'package:probot_admin/responsive.dart';
export 'package:probot_admin/controllers/index.dart';
export 'package:probot_admin/package_list.dart';

// All extension
export 'package:probot_admin/extensions/text_style_extensions.dart';
export 'package:probot_admin/extensions/widget_extension.dart';
export 'package:probot_admin/extensions/spacing.dart';
export 'package:probot_admin/utils/extensions.dart';

// All common files
export 'package:probot_admin/common/theme/app_theme.dart';
export 'package:probot_admin/common/theme/theme_service.dart';
export 'package:probot_admin/common/theme/app_css.dart';
export 'package:probot_admin/common/config.dart';

// All Screens
export 'package:probot_admin/screens/auth_login_screen/layouts/glass_morphic_border.dart';
export 'package:probot_admin/screens/auth_login_screen/layouts/login_gradient.dart';
export 'package:probot_admin/screens/auth_login_screen/layouts/glass_morphic_layout.dart';
export 'package:probot_admin/screens/auth_login_screen/layouts/validator.dart';
export 'package:probot_admin/screens/subscription_list/layouts/switch_common.dart';
export 'package:probot_admin/screens/subscription_list/layouts/text_field_common.dart';
export 'package:probot_admin/screens/subscription_list/layouts/desktop_switch_common.dart';
export 'package:probot_admin/screens/subscription_list/layouts/desktop_text_field_common.dart';
export 'package:probot_admin/screens/general_setting/layouts/usage_control_desktop.dart';
export 'package:probot_admin/screens/subscription_list/layouts/button_layout.dart';
export 'package:probot_admin/screens/subscription_list/layouts/subscription_list_table.dart';
export 'package:probot_admin/screens/subscription_list/layouts/subscription_widget_class.dart';

export 'package:probot_admin/screens/characters/layouts/character_list_table.dart';
export 'package:probot_admin/screens/characters/layouts/character_widget_class.dart';
export 'package:probot_admin/screens/auth_login_screen/layouts/dark_language_layout.dart';
export 'package:probot_admin/screens/auth_login_screen/layouts/login_layout.dart';
export 'package:probot_admin/screens/auth_login_screen/layouts/dark_mode_layout.dart';
export 'package:probot_admin/screens/auth_login_screen/layouts/language_layout.dart';
export 'package:probot_admin/screens/auth_login_screen/layouts/login_body_layout.dart';
export 'package:probot_admin/screens/auth_login_screen/layouts/login_class.dart';
export 'package:probot_admin/screens/index/layouts/drawer.dart';
export 'package:probot_admin/screens/index/layouts/drawer_list.dart';
export 'package:probot_admin/screens/index/layouts/leading_row.dart';
export 'package:probot_admin/screens/index/layouts/selected_body_layout.dart';
export 'package:probot_admin/screens/user_list/layouts/arrow_back.dart';
export 'package:probot_admin/screens/user_list/layouts/arrow_forward.dart';
export 'package:probot_admin/screens/user_list/layouts/search_action.dart';
export 'package:probot_admin/screens/user_list/layouts/user_list_layout.dart';
export 'package:probot_admin/screens/general_setting/layouts/ad_show_hide.dart';


// All widgets library
export 'package:probot_admin/widgets/button_common.dart';
export 'package:probot_admin/widgets/common_dotted_border.dart';
export 'package:probot_admin/widgets/drag_drop_layout.dart';
export 'package:probot_admin/widgets/image_pick_up.dart';
export 'package:probot_admin/widgets/custom_snack_bar.dart';
export 'package:probot_admin/widgets/common_text_box.dart';
export 'package:probot_admin/widgets/common_button.dart';
export 'package:probot_admin/widgets/text_field_validation.dart';
export 'package:probot_admin/widgets/common_widget_class.dart';
export 'package:probot_admin/widgets/common_switcher.dart';
export 'package:probot_admin/widgets/helper_function.dart';

export 'package:probot_admin/widgets/something_wrong.dart';


// All screens library
export 'package:probot_admin/screens/dashboard/dashboard.dart';
export 'package:probot_admin/screens/user_list/user_list.dart';
export 'package:probot_admin/screens/subscription_list/subscription_list.dart';
export 'package:probot_admin/screens/index/index.dart';

var appCtrl = Get.isRegistered<AppController>()
    ? Get.find<AppController>()
    : Get.put(AppController());