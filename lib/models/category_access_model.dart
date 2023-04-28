

class CategoryAccessModel {
  bool? isCodeGenerator,isCategorySuggestion;
  bool? isImageGeneratorShow;
  bool? isTextCompletionShow;
  bool? isTheme,isRTL;
  bool? isAddShow,
      isRazorPay,
      isStripe,
      isPaypal,
      isInApp,
      isChatHistory,
      isGuestLoginEnable,
      isGoogleAdmobEnable;

  CategoryAccessModel(
      {
      this.isCodeGenerator,
      this.isImageGeneratorShow,
      this.isTextCompletionShow,
      this.isAddShow,
      this.isPaypal,
      this.isRTL,
      this.isCategorySuggestion,
      this.isInApp,
      this.isRazorPay,
      this.isStripe,
      this.isTheme,
      this.isChatHistory,
      this.isGuestLoginEnable,
      this.isGoogleAdmobEnable});

  CategoryAccessModel.fromJson(Map<String, dynamic> json) {
    isCodeGenerator = json['isCodeGenerator'] ?? true;
    isImageGeneratorShow = json['isImageGeneratorShow'] ?? true;
    isTextCompletionShow = json['isTextCompletionShow'] ?? true;
    isCategorySuggestion = json['isCategorySuggestion'] ?? true;
    isRTL = json['isRTL'] ?? false;
    isChatHistory = json['isChatHistory'] ?? true;
    isAddShow = json['isAddShow'] ?? true;
    isRazorPay = json['isRazorPay'] ?? true;
    isPaypal = json['isPayPal'] ?? true;
    isStripe = json['isStripe'] ?? true;
    isInApp = json['isInApp'] ?? true;
    isTheme = json['isTheme'] ?? false;
    isGuestLoginEnable = json['isGuestLoginEnable'] ?? true;
    isGoogleAdmobEnable = json['isGoogleAdmobEnable'] ?? true;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isCodeGenerator'] = isCodeGenerator;
    data['isImageGeneratorShow'] = isImageGeneratorShow;
    data['isTextCompletionShow'] = isTextCompletionShow;
    data['isCategorySuggestion'] = isCategorySuggestion;
    data['isAddShow'] = isAddShow;
    data['isStripe'] = isStripe;
    data['isPayPal'] = isPaypal;
    data['isRazorPay'] = isRazorPay;
    data['isChatHistory'] = isChatHistory;
    data['isInApp'] = isInApp;
    data['isGuestLoginEnable'] = isGuestLoginEnable;
    data['isGoogleAdmobEnable'] = isGoogleAdmobEnable;

    return data;
  }
}
