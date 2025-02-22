import 'package:flutter/material.dart';

// Writer Model
class Writer {
  final String imagePath;
  final String name;
  final String bio;
  final String? family; // Made optional since some writers might not have family info
  final List<String> works;
  final List<String> translations;
  final List<String> retellings;

  Writer({
    required this.imagePath,
    required this.name,
    required this.bio,
    this.family,
    this.works = const [], // Default empty list
    this.translations = const [], // Default empty list
    this.retellings = const [], // Default empty list
  });
}

// Provider State
class WriterProvider extends ChangeNotifier {
  int _selectedIndex = 0;
  
  int get selectedIndex => _selectedIndex;
  
  void setSelectedIndex(int index) {
    if (index >= 0 && index < writers.length) {
      _selectedIndex = index;
      notifyListeners();
    }
  }
  
  final List<Writer> writers = [
    Writer(
      imagePath: 'assets/images/tk.png',
      name: 'ടി.കെ ഉബൈദ്',
      bio: 'ഇസ്‌ലാമിക പണ്ഡിതന്‍, എഴുത്തുകാരന്‍, ഗ്രന്ഥകര്‍ത്താവ്. 1948-ല്‍ പൊന്നാനി താലൂക്കിലെ കാഞ്ഞിരമുക്ക് ഗ്രാമത്തില്‍ ജനിച്ചു. കോക്കൂര്‍ അബ്ദുല്ലക്കുട്ടി മുസ്‌ലിയാരുടെ പുത്രന്‍ ഐ.ടി.സി. മുഹമ്മദ് അബ്ദുല്ല നിസാമിയാണ് പിതാവ്. മാതാവ്, പാനായിക്കുളം പുതിയാപ്പള അബ്ദുറഹ്മാന്‍ മുസ്‌ലിയാരുടെ പുത്രി ആയിശു. ശാന്തപുരം ഇസ്‌ലാമിയാ കോളേജില്‍ വിദ്യാഭ്യാസം പൂര്‍ത്തിയാക്കി. 1972-ല്‍ സന്‍മാര്‍ഗം ദ്വൈവാരികയുടെ സഹപത്രാധിപരായി പത്രപ്രവര്‍ത്തനരംഗത്തു പ്രവേശിച്ചു. 1974-ല്‍ പ്രബോധനം വാരികയില്‍ സഹപത്രാധിപരായി ചേര്‍ന്നു. 1993-94-ല്‍ മാധ്യമം ദിനപത്രത്തിന്റെ കൊച്ചി പതിപ്പില്‍ റസിഡന്റ് എഡിറ്ററായി പ്രവര്‍ത്തിച്ചു. ഇപ്പോള്‍ പ്രബോധനം വാരികയുടെയും മലര്‍വാടി ബാലമാസികയുടെയും പത്രാധിപര്‍. ഐ.പി.എച്ച്. പ്രസിദ്ധീകരിക്കുന്ന ഇസ്‌ലാമിക വിജ്ഞാനകോശത്തിന്റെ അസോസിയേറ്റ് എഡിറ്ററുമാണ്.',
      works: [
        'ഖുര്‍ആന്‍ ബോധനം (ആറു വാല്യം)',
        'അല്ലാഹു',
        'പ്രശ്‌നങ്ങള്‍ വീക്ഷണങ്ങള്‍',
        'ഹദീസ് ബോധനം',
        'മനുഷ്യാ നിന്റെ മനസ്സ്',
        'സ്വാതന്ത്ര്യത്തിന്റെ ഭാരം',
        'ഇസ്‌ലാമിക പ്രവര്‍ത്തനം: ഒരു മുഖവുര',
        'ബാലസാഹിത്യം: ആദം ഹവ്വ',
        'ലോകസുന്ദരന്‍'
      ],
      translations: [
        'ഖുര്‍ആനിലെ നാല് സാങ്കേതിക ശബ്ദങ്ങള്‍',
        'ഖുര്‍ആന്‍ ഭാഷ്യം',
        'തഫ്ഹീമുല്‍ ഖുര്‍ആന്‍ (ആറു വാല്യം)',
        'ഫിഖ്ഹുസ്സുന്നഃ',
        'ഇസ്‌ലാമിക ശരീഅത്തും സാമൂഹ്യ മാറ്റങ്ങളും'
      ],
      retellings: ['കലീലയും ദിംനയും']
    ),
    Writer(
      imagePath: 'assets/images/tka.png',
      name: 'ടി.കെ അബ്ദുല്ല',
      bio: 'പണ്ഡിതന്‍, വാഗ്മി, ജമാഅത്തെ ഇസ്‌ലാമി നേതാവ്. 1929-ല്‍ കോഴിക്കോട് ജില്ലയിലെ ആയഞ്ചേരിയില്‍ ജനിച്ചു. പിതാവ് അറിയപ്പെട്ട പണ്ഡിതനായ തറക്കണ്ടി അബ്ദുര്‍റഹ്മാന്‍ മുസ്‌ലിയാര്‍. നാദാപുരം, മാട്ടൂല്‍ പള്ളിദര്‍സുകള്‍, വാഴക്കാട് ദാറുല്‍ഉലൂം, തിരൂരങ്ങാടി ജുമാമസ്ജിദ്, പുളിക്കല്‍ മദീനത്തുല്‍ ഉലൂം, കാസര്‍ഗോഡ് ആലിയ അറബിക് കോളേജ് എന്നിവിടങ്ങളില്‍ പഠിച്ചു. അറബി, ഉര്‍ദു ഭാഷകളില്‍ നല്ല പരിജ്ഞാനമുണ്ട്. 1950-ല്‍ പ്രബോധനം പ്രതിപക്ഷപത്രത്തില്‍ ചേര്‍ന്നു. 1964-ല്‍ പ്രബോധനം വാരികയുടെ പ്രഥമ പത്രാധിപര്‍. 1994 മുതല്‍ 1995 വരെ പ്രബോധനത്തിന്റെ ചീഫ് എഡിറ്റര്‍. ഐ.പി.എച്ച് പ്രസിദ്ധീകരിക്കുന്ന ഇസ്‌ലാമിക വിജ്ഞാനകോശത്തിന്റെ ചീഫ് എഡിറ്ററാണ്. 1972 മുതല്‍ ജമാഅത്തെ ഇസ്‌ലാമി കേന്ദ്ര മജ്‌ലിസ് ശൂറായില്‍ അംഗമാണ്. 1972-79ലും 1982-84ലും ജമാഅത്തെ ഇസ്‌ലാമി കേരള ഹല്‍ഖാ അമീര്‍. ആള്‍ ഇന്ത്യാ മുസ്‌ലിം പേഴ്‌സനല്‍ ലോ ബോര്‍ഡിന്റെ സ്ഥാപകാംഗമാണ്. ഡല്‍ഹിയിലെ ദഅ്‌വത് ട്രസ്റ്റ്, അലീഗഢിലെ ഇദാറെ തഹ്ഖീഖാത്തെ ഇസ്‌ലാമി, കേരള മജ്‌ലിസുത്തഅ്‌ലീമില്‍ ഇസ്‌ലാമി കോഴിക്കോട്, ഇസ്‌ലാമിക് സര്‍വീസ് ട്രസ്റ്റ് കേരള തുടങ്ങി ഒട്ടേറെ സംരംഭങ്ങളില്‍ പങ്കാളിത്തമുണ്ട്. കുറ്റിയാടി ഇസ്‌ലാമിയാ കോളേജ്, വെള്ളിമാട്കുന്ന് ദഅ്‌വാ കോളേജ്, ശാന്തപുരം അല്‍ജാമിഅ അല്‍ഇസ്‌ലാമിയ്യ എന്നിവിടങ്ങളില്‍ പഠിപ്പിച്ചിട്ടുണ്ട്. മൗലാനാ മൗദൂദിയുടെ തഫ്ഹീമുല്‍ ഖുര്‍ആന്റെ ആദ്യഭാഗ വിവര്‍ത്തകരില്‍ ഒരാളാണ്',
      works: [
        'നാഴികക്കല്ലുകള്‍',
        'ഇഖ്ബാലിനെ കണ്ടെത്തല്‍',
        'നവോത്ഥാന ധര്‍മങ്ങള്‍'
      ],
      family: 'ഭാര്യ: കുഞ്ഞാമിന. മക്കള്‍: ടി.കെ.എം. ഇഖ്ബാല്‍, ടി.കെ. ഫാറൂഖ്, ടി.കെ. സാജിദ'
    ),
    Writer(
      imagePath: 'assets/images/ti.png',
      name: 'ടി. ഇസ്ഹാഖലി മൗലവി',
      bio: 'മതപണ്ഡിതന്‍, ഗ്രന്ഥകാരന്‍, അധ്യാപകന്‍. 1926-ല്‍ പാലക്കാട് ജില്ലയില്‍പെട്ട ആനക്കര പഞ്ചായത്തിലെ പിയൂരില്‍ ജനിച്ചു. പിതാവ്: മൊയ്തീന്‍കുട്ടി. മാതാവ്: ബീവിക്കുട്ടി. അഞ്ചാം ക്ലാസ് വരെ ആനക്കര മാപ്പിള സ്‌കൂളില്‍ പഠിച്ചശേഷം മതപഠനത്തിലേക്ക് തിരിഞ്ഞു. കുമ്പിടി, കുറ്റിപ്പുറം, കൂടല്ലൂര്‍, ആനക്കര, തൊഴുവാനൂര്‍, തിരുവേഗപ്പുറം, ചാവക്കാട്, പുതിയങ്ങാടി എന്നിവിടങ്ങളിലെ പള്ളിദര്‍സുകളില്‍ പഠിച്ചു. അറബി, ഉര്‍ദു ഭാഷകളില്‍ മികച്ച പ്രാവീണ്യമുണ്ടായിരുന്നു. 1948-ല്‍ ജമാഅത്തെ ഇസ്‌ലാമിയുടെ കേരള ഘടകം രൂപവത്കൃതമായത് മുതല്‍ പ്രസ്ഥാനത്തില്‍ അംഗമായി. ജമാഅത്തെ ഇസ്‌ലാമി കേന്ദ്ര പ്രതിനിധിസഭാംഗം, കേരള ശൂറാംഗം എന്നീ നിലകളില്‍ ദീര്‍ഘകാലം പ്രവര്‍ത്തിച്ചു. എടവനക്കാട് ഇര്‍ശാദുല്‍ മുസ്‌ലിമീന്‍, ചേന്ദമംഗല്ലൂര്‍ ഇസ്‌ലാഹിയ്യ കോളേജ്, ശാന്തപുരം ഇസ്‌ലാമിയ്യ കോളേജ് എന്നിവിടങ്ങളില്‍ അധ്യാപകനായും കുറ്റിയാടി ഇസ്‌ലാമിയ്യ കോളേജിലും ശാന്തപുരം ഇസ്‌ലാമിയ്യ കോളേജിലും പ്രിന്‍സിപ്പലായും സേവനമനുഷ്ഠിച്ചിട്ടുണ്ട്. നിരവധി മദ്‌റസ പാഠപുസ്തകങ്ങള്‍ രചിച്ചിട്ടുണ്ട്. അബൂശാകിര്‍ എന്ന തൂലികാനാമത്തില്‍ ദീര്‍ഘകാലം പ്രബോധനം മാസികയിലെ പ്രശ്‌നവും വീക്ഷണവും കര്‍മശാസ്ത്ര പംക്തി കൈകാര്യം ചെയ്തു',
      works: [
        'തഫ്ഹീമുല്‍ ഖുര്‍ആന്‍ ഒന്ന്, രണ്ട് വാല്യം',
        'ഫിഖ്ഹുസ്സുന്നഃ ഒന്ന്, രണ്ട്, മൂന്ന് വാല്യം(വിവ.)',
        'ഹദീസ് ഭാഷ്യം',
        'പ്രാര്‍ഥനകള്‍'
      ],
      family: '1985 നവംബര്‍ 25-നു മരിച്ചു. അഞ്ച് മക്കള്‍.'
    ),
    Writer(
      imagePath: 'assets/images/vk.png',
      name: 'വി.കെ അലി',
      bio: 'മലപ്പുറം ജില്ലയിലെ എടയൂരില്‍ 1948 ല്‍ ജനനം. പിതാവ് വള്ളൂരന്‍ ബാവുട്ടി. മാതാവ് വള്ളൂരന്‍ കുഞ്ഞാച്ചുട്ടി. തിരൂര്‍ക്കാട് ഇലാഹിയ്യ കോളേജ്, ശാന്തപുരം ഇസ്‌ലാമിയ്യ കോളേജ്, ഖത്തറിലെ അല്‍ മഅ്ഹദുദ്ദീനി, ഖത്തര്‍ യൂണിവേഴ്‌സിറ്റി എന്നിവിടങ്ങളില്‍ പഠനം. 1970 മുതല്‍ മൂന്നു വര്‍ഷം പ്രബോധനം വാരികയുടെ സഹപത്രാധിപരായിരുന്നു. ശാന്തപുരം ഇസ്‌ലാമിയ കോളേജിലും ചേന്ദമംഗല്ലൂര്‍ ഇസ്‌ലാഹിയ്യ കോളേജിലും 1980 മുതല്‍ ദീര്‍ഘകാലം ഖത്തറിലെ വഖഫ് മന്ത്രാലയത്തിലും ജോലി ചെയ്തു. ഖത്തറിലെ ഇന്ത്യന്‍ ഇസ്‌ലാമിക് അസോസിയേഷന്‍ പ്രസിഡന്റ്, ശാന്തപുരം അല്‍ജാമിഅ ഡയറക്ടര്‍, കേരള വഖഫ് ബോര്‍ഡ് അംഗം, ഐ.പി.എച്ച് ഡയറക്ടര്‍, ബോധനം ചീഫ് എഡിറ്റര്‍ എന്നീ സ്ഥാനങ്ങള്‍ വഹിച്ചിരുന്നു. ഇപ്പോള്‍ ജമാഅത്തെ ഇസ്‌ലാമി കേന്ദ്ര മജ്‌ലിസ് ശൂറാ അംഗം, സംസ്ഥാന കൂടിയാലോചനാ സമിതി അംഗം, അല്‍ ജാമിഅ അല്‍ ഇസ്‌ലാമിയ വിസിറ്റിംഗ് പ്രൊഫസര്‍, ബൈത്തുസ്സകാത് കേരള ചെയര്‍മാന്‍ എന്നീ ചുമതലകള്‍ വഹിക്കുന്നു. അറബി, ഉര്‍ദു, ഹിന്ദി, ഇംഗ്ലീഷ് ഭാഷകള്‍ അറിയാം.',
      translations: [
        'സൂറത്തുന്നൂര്‍',
        'സൂറത്തുയാസീന്‍',
        'ഇസ്‌ലാമിന് രാഷ്ട്രീയ വ്യാഖ്യാനമോ?',
        'അതികായന്മാരുടെ സംവാദം',
        'ഇസ്‌ലാം രാഷ്ട്രീയം അധികാരം',
        'വിമര്‍ശിക്കപ്പെടുന്ന മൗദൂദി'
      ],
      retellings: ['നബി ചരിത്രം', 'ഖുര്‍ആന്‍ പഠനം'],
      family: 'ഭാര്യ: തങ്കയത്ത് ഇത്തീരുമ്മ മക്കള്‍: മന്‍സൂര്‍, ഹിശാം, നബീല്‍, സുറയ്യ, സല്‍വ\nവിലാസം: സുറയ്യ മന്‍സില്‍, പി.ഒ എടയൂര്‍, വളാഞ്ചേരി, മലപ്പുറം, പിന്‍: 676554'
    ),
    Writer(
      
      name: 'English Translation ',
      bio: 'English Translation Ever since its completion in 1972, Tafheemul quran has been translated into many international languages. In the English language, translation of Tafhim was undertaken twice. It was first translated by Late Chaudhry Muhammad Akbar of Sialkot in whose house Maulana Maududi used to stay whenever he visited Dr. Iqbals home town. His translation was in 5 volumes, last of which was rendered into English by his associate Abdul Aziz Kamal. Chaudhry Muhammad Akbars translation ends at chapter Al-Hajj but was edited and made ready for publication by Mr. A.A Kamal M.A. Despite their pioneering efforts it was felt that their translations were not up to the desired standards. Hence it was decided with the concurrence of Maulana himself to ask Dr. Zafar Ishaq Ansari to undertake a new translation which he had finished up to chapter Al-Nur (as published by MMI, New Delhi). However Dr. Ansari has not only completed the translation of the whole of the Arabic text up to the end but has also revised his own translation done up to the chapter Al-Nur making necessary corrections, amendments and improvements as stated by him in his preface to the one-volume abridged edition. He also translated The Introduction of the Tafseer written by Syed Abul Aala Maududi in Urdu into English. While the translation of the Quranic text is entirely Dr Ansaris effort,(in Towards Understanding the Quran), He has been ably assisted in the explanatory notes by Dr A R Kidwai of the Islamic Foundation.',
      imagePath: 'assets/images/thafeeul quran.jpg',
      
      // family: 'ഭാര്യ: തങ്കയത്ത് ഇത്തീരുമ്മ മക്കള്‍: മന്‍സൂര്‍, ഹിശാം, നബീല്‍, സുറയ്യ, സല്‍വ\nവിലാസം: സുറയ്യ മന്‍സില്‍, പി.ഒ എടയൂര്‍, വളാഞ്ചേരി, മലപ്പുറം, പിന്‍: 676554'
    ),
  ];
}