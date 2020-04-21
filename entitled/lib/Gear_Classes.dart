import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Gear {
  List<Results> results;
  Gear({this.results});

  Gear.fromJson(Map<String, dynamic> json) {
    if (json['Results'] != null) {
      results = new List<Results>();
      json['Results'].forEach((v) {
        results.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.results != null) {
      data['Results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  int iD;
  String icon;
  String name;
  String url;

  Results({
    this.iD,
    this.icon,
    this.name,
    this.url,
  });

  Results.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    icon = json['Icon'];
    name = json['Name'];
    url = json['Url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['Icon'] = this.icon;
    data['Name'] = this.name;
    data['Url'] = this.url;
    return data;
  }
}

class SelectedClass {
  String Class;

  SelectedClass(choice) {
    switch (choice) {
      case "Paladin":
        {
          Class = "PLD";
          return;
        }
      case 'Warrior':
        {
          Class = "WAR";
          return;
        }
      case 'Dark Knight':
        {
          Class = "DRK";
          return;
        }
      case 'Gunbreaker':
        {
          Class = "GNB";
          return;
        }
      case 'White Mage':
        {
          Class = "WHM";
          return;
        }
      case 'Scholar':
        {
          Class = "SCH";
          return;
        }
      case 'Astrologian':
        {
          Class = "AST";
          return;
        }
      case 'Dragoon':
        {
          Class = "DRG";
          return;
        }
      case 'Monk':
        {
          Class = "MNK";
          return;
        }
      case 'Ninja':
        {
          Class = "NIN";
          return;
        }
      case 'Samurai':
        {
          Class = "SAM";
          return;
        }
      case 'Bard':
        {
          Class = "BRD";
          return;
        }
      case 'Machinist':
        {
          Class = "MCH";
          return;
        }
      case 'Dancer':
        {
          Class = "DNC";
          return;
        }
      case 'Summoner':
        {
          Class = "SMN";
          return;
        }
      case 'Black Mage':
        {
          Class = "BLM";
          return;
        }
      case 'Red Mage':
        {
          Class = "RDM";
          return;
        }
      case 'Blue Mage':
        {
          Class = "BLU";
          return;
        }
      default:
        {
          print("INVALID DATA");
          return;
        }
    }
  }
}

class SelectedGearPiece {
  String GearPiece;

  SelectedGearPiece(choice) {
    switch (choice) {
      case 'Weapon':
        {
          GearPiece = 'MainHand';
          return;
        }
      case 'Off Hand':
        {
          GearPiece = 'OffHand';
          return;
        }
      case 'Head':
        {
          GearPiece = 'Head';
          return;
        }
      case 'Chest':
        {
          GearPiece = 'Body';
          return;
        }
      case 'Hands':
        {
          GearPiece = 'Gloves';
          return;
        }
      case 'Belt':
        {
          GearPiece = 'Waist';
          return;
        }
      case 'Legs':
        {
          GearPiece = 'Legs';
          return;
        }
      case 'Feet':
        {
          GearPiece = 'Feet';
          return;
        }
      case 'Earrings':
        {
          GearPiece = 'Ears';
          return;
        }
      case 'Necklace':
        {
          GearPiece = 'Neck';
          return;
        }
      case 'Bracelet':
        {
          GearPiece = 'Wrists';
          return;
        }
      case 'Ring':
        {
          GearPiece = 'FingerL';
          return;
        }
      default:
        {
          print("INVALID DATA");
          return;
        }
    }
  }
}

class ItemData {
  int block;
  int blockRate;
  int canBeHq;
  ClassJobCategory classJobCategory;
  int damageMag;
  int damagePhys;
  int defenseMag;
  int defensePhys;
  int delayMs;
  EquipSlotCategory equipSlotCategory;
  int iD;
  String icon;
  int isAdvancedMeldingPermitted;
  int isCrestWorthy;
  int isDyeable;
  int isGlamourous;
  int isIndisposable;
  int isUnique;
  int isUntradable;
  ItemUICategory itemUICategory;
  int levelEquip;
  int levelItem;
  int materiaSlotCount;
  String name;
  Stats stats;

  ItemData(
      {this.block,
      this.blockRate,
      this.canBeHq,
      this.classJobCategory,
      this.damageMag,
      this.damagePhys,
      this.defenseMag,
      this.defensePhys,
      this.delayMs,
      this.equipSlotCategory,
      this.iD,
      this.icon,
      this.isAdvancedMeldingPermitted,
      this.isCrestWorthy,
      this.isDyeable,
      this.isGlamourous,
      this.isIndisposable,
      this.isUnique,
      this.isUntradable,
      this.itemUICategory,
      this.levelEquip,
      this.levelItem,
      this.materiaSlotCount,
      this.name,
      this.stats});

  ItemData.fromJson(Map<String, dynamic> json) {
    block = json['Block'];
    blockRate = json['BlockRate'];
    canBeHq = json['CanBeHq'];
    classJobCategory = json['ClassJobCategory'] != null
        ? new ClassJobCategory.fromJson(json['ClassJobCategory'])
        : null;
    damageMag = json['DamageMag'];
    damagePhys = json['DamagePhys'];
    defenseMag = json['DefenseMag'];
    defensePhys = json['DefensePhys'];
    delayMs = json['DelayMs'];
    equipSlotCategory = json['EquipSlotCategory'] != null
        ? new EquipSlotCategory.fromJson(json['EquipSlotCategory'])
        : null;
    iD = json['ID'];
    icon = json['Icon'];
    isAdvancedMeldingPermitted = json['IsAdvancedMeldingPermitted'];
    isCrestWorthy = json['IsCrestWorthy'];
    isDyeable = json['IsDyeable'];
    isGlamourous = json['IsGlamourous'];
    isIndisposable = json['IsIndisposable'];
    isUnique = json['IsUnique'];
    isUntradable = json['IsUntradable'];
    itemUICategory = json['ItemUICategory'] != null
        ? new ItemUICategory.fromJson(json['ItemUICategory'])
        : null;
    levelEquip = json['LevelEquip'];
    levelItem = json['LevelItem'];
    materiaSlotCount = json['MateriaSlotCount'];
    name = json['Name'];
    stats = json['Stats'] != null ? new Stats.fromJson(json['Stats']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Block'] = this.block;
    data['BlockRate'] = this.blockRate;
    data['CanBeHq'] = this.canBeHq;
    if (this.classJobCategory != null) {
      data['ClassJobCategory'] = this.classJobCategory.toJson();
    }
    data['DamageMag'] = this.damageMag;
    data['DamagePhys'] = this.damagePhys;
    data['DefenseMag'] = this.defenseMag;
    data['DefensePhys'] = this.defensePhys;
    data['DelayMs'] = this.delayMs;
    if (this.equipSlotCategory != null) {
      data['EquipSlotCategory'] = this.equipSlotCategory.toJson();
    }
    data['ID'] = this.iD;
    data['Icon'] = this.icon;
    data['IsAdvancedMeldingPermitted'] = this.isAdvancedMeldingPermitted;
    data['IsCrestWorthy'] = this.isCrestWorthy;
    data['IsDyeable'] = this.isDyeable;
    data['IsGlamourous'] = this.isGlamourous;
    data['IsIndisposable'] = this.isIndisposable;
    data['IsUnique'] = this.isUnique;
    data['IsUntradable'] = this.isUntradable;
    if (this.itemUICategory != null) {
      data['ItemUICategory'] = this.itemUICategory.toJson();
    }
    data['LevelEquip'] = this.levelEquip;
    data['LevelItem'] = this.levelItem;
    data['MateriaSlotCount'] = this.materiaSlotCount;
    data['Name'] = this.name;
    if (this.stats != null) {
      data['Stats'] = this.stats.toJson();
    }
    return data;
  }
}

class ClassJobCategory {
  int aCN;
  int aDV;
  int aLC;
  int aRC;
  int aRM;
  int aST;
  int bLM;
  int bLU;
  int bRD;
  int bSM;
  int bTN;
  int cNJ;
  int cRP;
  int cUL;
  int dNC;
  int dRG;
  int dRK;
  int fSH;
  int gLA;
  int gNB;
  int gSM;
  int iD;
  int lNC;
  int lTW;
  int mCH;
  int mIN;
  int mNK;
  int mRD;
  int nIN;
  String name;
  String nameDe;
  String nameEn;
  String nameFr;
  String nameJa;
  int pGL;
  int pLD;
  int rDM;
  int rOG;
  int sAM;
  int sCH;
  int sMN;
  int tHM;
  int wAR;
  int wHM;
  int wVR;

  ClassJobCategory(
      {this.aCN,
      this.aDV,
      this.aLC,
      this.aRC,
      this.aRM,
      this.aST,
      this.bLM,
      this.bLU,
      this.bRD,
      this.bSM,
      this.bTN,
      this.cNJ,
      this.cRP,
      this.cUL,
      this.dNC,
      this.dRG,
      this.dRK,
      this.fSH,
      this.gLA,
      this.gNB,
      this.gSM,
      this.iD,
      this.lNC,
      this.lTW,
      this.mCH,
      this.mIN,
      this.mNK,
      this.mRD,
      this.nIN,
      this.name,
      this.nameDe,
      this.nameEn,
      this.nameFr,
      this.nameJa,
      this.pGL,
      this.pLD,
      this.rDM,
      this.rOG,
      this.sAM,
      this.sCH,
      this.sMN,
      this.tHM,
      this.wAR,
      this.wHM,
      this.wVR});

  ClassJobCategory.fromJson(Map<String, dynamic> json) {
    aCN = json['ACN'];
    aDV = json['ADV'];
    aLC = json['ALC'];
    aRC = json['ARC'];
    aRM = json['ARM'];
    aST = json['AST'];
    bLM = json['BLM'];
    bLU = json['BLU'];
    bRD = json['BRD'];
    bSM = json['BSM'];
    bTN = json['BTN'];
    cNJ = json['CNJ'];
    cRP = json['CRP'];
    cUL = json['CUL'];
    dNC = json['DNC'];
    dRG = json['DRG'];
    dRK = json['DRK'];
    fSH = json['FSH'];
    gLA = json['GLA'];
    gNB = json['GNB'];
    gSM = json['GSM'];
    iD = json['ID'];
    lNC = json['LNC'];
    lTW = json['LTW'];
    mCH = json['MCH'];
    mIN = json['MIN'];
    mNK = json['MNK'];
    mRD = json['MRD'];
    nIN = json['NIN'];
    name = json['Name'];
    nameDe = json['Name_de'];
    nameEn = json['Name_en'];
    nameFr = json['Name_fr'];
    nameJa = json['Name_ja'];
    pGL = json['PGL'];
    pLD = json['PLD'];
    rDM = json['RDM'];
    rOG = json['ROG'];
    sAM = json['SAM'];
    sCH = json['SCH'];
    sMN = json['SMN'];
    tHM = json['THM'];
    wAR = json['WAR'];
    wHM = json['WHM'];
    wVR = json['WVR'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ACN'] = this.aCN;
    data['ADV'] = this.aDV;
    data['ALC'] = this.aLC;
    data['ARC'] = this.aRC;
    data['ARM'] = this.aRM;
    data['AST'] = this.aST;
    data['BLM'] = this.bLM;
    data['BLU'] = this.bLU;
    data['BRD'] = this.bRD;
    data['BSM'] = this.bSM;
    data['BTN'] = this.bTN;
    data['CNJ'] = this.cNJ;
    data['CRP'] = this.cRP;
    data['CUL'] = this.cUL;
    data['DNC'] = this.dNC;
    data['DRG'] = this.dRG;
    data['DRK'] = this.dRK;
    data['FSH'] = this.fSH;
    data['GLA'] = this.gLA;
    data['GNB'] = this.gNB;
    data['GSM'] = this.gSM;
    data['ID'] = this.iD;
    data['LNC'] = this.lNC;
    data['LTW'] = this.lTW;
    data['MCH'] = this.mCH;
    data['MIN'] = this.mIN;
    data['MNK'] = this.mNK;
    data['MRD'] = this.mRD;
    data['NIN'] = this.nIN;
    data['Name'] = this.name;
    data['Name_de'] = this.nameDe;
    data['Name_en'] = this.nameEn;
    data['Name_fr'] = this.nameFr;
    data['Name_ja'] = this.nameJa;
    data['PGL'] = this.pGL;
    data['PLD'] = this.pLD;
    data['RDM'] = this.rDM;
    data['ROG'] = this.rOG;
    data['SAM'] = this.sAM;
    data['SCH'] = this.sCH;
    data['SMN'] = this.sMN;
    data['THM'] = this.tHM;
    data['WAR'] = this.wAR;
    data['WHM'] = this.wHM;
    data['WVR'] = this.wVR;
    return data;
  }
}

class EquipSlotCategory {
  int body;
  int ears;
  int feet;
  int fingerL;
  int fingerR;
  int gloves;
  int head;
  int iD;
  int legs;
  int mainHand;
  int neck;
  int offHand;
  int soulCrystal;
  int waist;
  int wrists;

  EquipSlotCategory(
      {this.body,
      this.ears,
      this.feet,
      this.fingerL,
      this.fingerR,
      this.gloves,
      this.head,
      this.iD,
      this.legs,
      this.mainHand,
      this.neck,
      this.offHand,
      this.soulCrystal,
      this.waist,
      this.wrists});

  EquipSlotCategory.fromJson(Map<String, dynamic> json) {
    if (json['Body'] != "-1") {
      body = json['Body'];
    } else {
      body = 0;
    }
    if (json['Ears'] != "-1") {
      ears = json['Ears'];
    } else {
      ears = 0;
    }
    if (json['Feet'] != "-1") {
      feet = json['Feet'];
    } else {
      feet = 0;
    }
    if (json['FingerL'] != "-1") {
      fingerL = json['FingerL'];
    } else {
      fingerL = 0;
    }
    if (json['FingerR'] != "-1") {
      fingerR = json['FingerR'];
    } else {
      fingerR = 0;
    }
    if (json['Gloves'] != "-1") {
      gloves = json['Gloves'];
    } else {
      gloves = 0;
    }
    if (json['Head'] != "-1") {
      head = json['Head'];
    } else {
      head = 0;
    }
    iD = json['ID'];
    if (json['Legs'] != "-1") {
      legs = json['Legs'];
    } else {
      legs = 0;
    }
    if (json['MainHand'] != "-1") {
      mainHand = json['MainHand'];
    } else {
      mainHand = 0;
    }
    if (json['Neck'] != "-1") {
      neck = json['Neck'];
    } else {
      neck = 0;
    }
    if (json['OffHand'] != "-1") {
      offHand = json['OffHand'];
    } else {
      offHand = 0;
    }
    if (json['SoulCrystal'] != "-1") {
      soulCrystal = json['SoulCrystal'];
    } else {
      soulCrystal = 0;
    }
    if (json['Waist'] != "-1") {
      waist = json['Waist'];
    } else {
      waist = 0;
    }
    if (json['Wrists'] != "-1") {
      wrists = json['Wrists'];
    } else {
      wrists = 0;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Body'] = this.body;
    data['Ears'] = this.ears;
    data['Feet'] = this.feet;
    data['FingerL'] = this.fingerL;
    data['FingerR'] = this.fingerR;
    data['Gloves'] = this.gloves;
    data['Head'] = this.head;
    data['ID'] = this.iD;
    data['Legs'] = this.legs;
    data['MainHand'] = this.mainHand;
    data['Neck'] = this.neck;
    data['OffHand'] = this.offHand;
    data['SoulCrystal'] = this.soulCrystal;
    data['Waist'] = this.waist;
    data['Wrists'] = this.wrists;
    return data;
  }
}

class ItemUICategory {
  int iD;
  String icon;
  int iconID;
  String name;
  String nameDe;
  String nameEn;
  String nameFr;
  String nameJa;
  int orderMajor;
  int orderMinor;

  ItemUICategory(
      {this.iD,
      this.icon,
      this.iconID,
      this.name,
      this.nameDe,
      this.nameEn,
      this.nameFr,
      this.nameJa,
      this.orderMajor,
      this.orderMinor});

  ItemUICategory.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    icon = json['Icon'];
    iconID = json['IconID'];
    name = json['Name'];
    nameDe = json['Name_de'];
    nameEn = json['Name_en'];
    nameFr = json['Name_fr'];
    nameJa = json['Name_ja'];
    orderMajor = json['OrderMajor'];
    orderMinor = json['OrderMinor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['Icon'] = this.icon;
    data['IconID'] = this.iconID;
    data['Name'] = this.name;
    data['Name_de'] = this.nameDe;
    data['Name_en'] = this.nameEn;
    data['Name_fr'] = this.nameFr;
    data['Name_ja'] = this.nameJa;
    data['OrderMajor'] = this.orderMajor;
    data['OrderMinor'] = this.orderMinor;
    return data;
  }
}

class Stats {
  Stat vitality;
  Stat strength;
  Stat dexterity;
  Stat intelligence;
  Stat mind;
  Stat criticalHit;
  Stat determination;
  Stat directHitRate;
  Stat skillSpeed;
  Stat spellSpeed;
  Stat tenacity;
  Stat piety;

  Stats(
      {this.criticalHit,
      this.directHitRate,
      this.strength,
      this.vitality,
      this.dexterity,
      this.intelligence,
      this.mind,
      this.determination,
      this.skillSpeed,
      this.spellSpeed,
      this.tenacity,
      this.piety});

  Stats.fromJson(Map<String, dynamic> json) {
    vitality =
        json['Vitality'] != null ? new Stat.fromJson(json['Vitality']) : null;
    strength =
        json['Strength'] != null ? new Stat.fromJson(json['Strength']) : null;
    dexterity =
        json['Dexterity'] != null ? new Stat.fromJson(json['Dexterity']) : null;
    intelligence = json['Intelligence'] != null
        ? new Stat.fromJson(json['Intelligence'])
        : null;
    mind = json['Mind'] != null ? new Stat.fromJson(json['Mind']) : null;
    criticalHit = json['CriticalHit'] != null
        ? new Stat.fromJson(json['CriticalHit'])
        : null;
    determination = json['Determination'] != null
        ? new Stat.fromJson(json['Determination'])
        : null;
    directHitRate = json['DirectHitRate'] != null
        ? new Stat.fromJson(json['DirectHitRate'])
        : null;
    skillSpeed = json['SkillSpeed'] != null
        ? new Stat.fromJson(json['SkillSpeed'])
        : null;
    spellSpeed = json['SpellSpeed'] != null
        ? new Stat.fromJson(json['SpellSpeed'])
        : null;
    tenacity =
        json['Tenacity'] != null ? new Stat.fromJson(json['Tenacity']) : null;
    piety = json['Piety'] != null ? new Stat.fromJson(json['Piety']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.criticalHit != null) {
      data['CriticalHit'] = this.criticalHit.toJson();
    }
    if (this.directHitRate != null) {
      data['DirectHitRate'] = this.directHitRate.toJson();
    }
    if (this.strength != null) {
      data['Strength'] = this.strength.toJson();
    }
    if (this.vitality != null) {
      data['Vitality'] = this.vitality.toJson();
    }
    if (this.dexterity != null) {
      data['Dexterity'] = this.dexterity.toJson();
    }
    if (this.intelligence != null) {
      data['Intelligence'] = this.intelligence.toJson();
    }
    if (this.mind != null) {
      data['Mind'] = this.mind.toJson();
    }
    if (this.determination != null) {
      data['Determination'] = this.determination.toJson();
    }
    if (this.skillSpeed != null) {
      data['SkillSpeed'] = this.skillSpeed.toJson();
    }
    if (this.spellSpeed != null) {
      data['SpellSpeed'] = this.spellSpeed.toJson();
    }
    if (this.tenacity != null) {
      data['Tenacity'] = this.tenacity.toJson();
    }
    if (this.piety != null) {
      data['Piety'] = this.piety.toJson();
    }
    return data;
  }
}

class Stat {
  int iD;
  int nQ;

  Stat({this.iD, this.nQ});

  Stat.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    nQ = json['NQ'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['NQ'] = this.nQ;
    return data;
  }
}

Widget buildDamageParameter(ItemData data) {
  if (data.block != 0) {
    return Text(
      "Block Strength",
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
    );
  } else if (data.defensePhys != 0) {
    return Text(
      "Defense",
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
    );
  } else if (data.damagePhys > data.damageMag) {
    return Text(
      "Physical Strength",
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
    );
  } else {
    return Text(
      "Magic Damage",
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
    );
  }
}

Widget buildDamageParameterStat(ItemData data) {
  if (data.block != 0) {
    return Text(
      "${data.block}",
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
    );
  } else if (data.defensePhys != 0) {
    return Text(
      "${data.defensePhys}",
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
    );
  } else if (data.damagePhys > data.damageMag) {
    return Text(
      "${data.damagePhys}",
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
    );
  } else {
    return Text(
      "${data.damageMag}",
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
    );
  }
}

Widget buildDefenseParameter(ItemData data) {
  if (data.blockRate != 0) {
    return Text(
      "Block Rate",
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
    );
  } else if (data.defenseMag != 0) {
    return Text(
      "Magic Defense",
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
    );
  } else {
    return Text(
      "Delay",
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
    );
  }
}

Widget buildDefenseParameterStat(ItemData data) {
  if (data.blockRate != 0) {
    return Text(
      "${data.blockRate}",
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
    );
  } else if (data.defenseMag != 0) {
    return Text(
      "${data.defenseMag}",
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
    );
  } else {
    return Text(
      "${data.delayMs / 1000.0}",
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
    );
  }
}

String buildMainStat(ItemData data, String counted) {
  if(data.stats != null) {
    if (data.stats.strength != null && !counted.contains("Strength")) {
      counted = "Strength";
      return "Strength +${data.stats.strength.nQ}";
    } else if (data.stats.dexterity != null && !counted.contains("Dexterity")) {
      counted = "Dexterity";
      return "Dexterity +${data.stats.dexterity.nQ}";
    } else
    if (data.stats.intelligence != null && !counted.contains("Intelligence")) {
      counted = "Intelligence";
      return "Intelligence +${data.stats.intelligence.nQ}";
    } else if (data.stats.mind != null && !counted.contains("Mind")) {
      counted = "Mind";
      return "Mind +${data.stats.mind.nQ}";
    } else if (data.stats.vitality != null && !counted.contains("Vitality")) {
      counted = "Vitality";
      return "Vitality +${data.stats.vitality.nQ}";
    } else {
      return "";
    }
  }else{
    return "";
  }
}

String buildSubStat(ItemData data, String counted) {
  if(data.stats != null) {
    if (data.stats.criticalHit != null && !counted.contains("Critical Hit")) {
      counted = "Critical Hit";
      return "Critical Hit +${data.stats.criticalHit.nQ}";
    } else if (data.stats.determination != null &&
        !counted.contains("Determination")) {
      counted = "Determination";
      return "Determination +${data.stats.determination.nQ}";
    } else if (data.stats.directHitRate != null &&
        !counted.contains("Direct Hit Rate")) {
      counted = "Direct Hit Rate";
      return "Direct Hit Rate +${data.stats.directHitRate.nQ}";
    } else if (data.stats.skillSpeed != null &&
        !counted.contains("Skill Speed")) {
      counted = "Skill Speed";
      return "Skill Speed +${data.stats.skillSpeed.nQ}";
    } else if (data.stats.spellSpeed != null &&
        !counted.contains("Spell Speed")) {
      counted = "Spell Speed";
      return "Spell Speed +${data.stats.spellSpeed.nQ}";
    } else if (data.stats.tenacity != null && !counted.contains("Tenacity")) {
      counted = "Tenacity";
      return "Tenacity +${data.stats.tenacity.nQ}";
    } else if (data.stats.piety != null && !counted.contains("Piety")) {
      counted = "Piety";
      return "Piety +${data.stats.piety.nQ}";
    } else {
      return "";
    }
  }else{
    return "";
  }
}
