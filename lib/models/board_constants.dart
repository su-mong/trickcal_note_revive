import 'package:trickcal_note_revive/models/board_type.dart';
import 'package:trickcal_note_revive/models/character_model.dart';
import 'package:trickcal_note_revive/models/character_type.dart';

import 'character_constants.dart';

abstract class BoardConstants {
  static const int goldCrayon1stBoard = 2;
  static const int goldCrayon2ndBoard = 4;
  static const int goldCrayon3rdBoard = 6;

  static const Map<BoardType, Map<CharacterType, List<CharacterModel>>> board1st = {
    BoardType.attack : {
      CharacterType.cool: [
        CoolCharacterConstants.espi,
        CoolCharacterConstants.jade,
        CoolCharacterConstants.aya,
        CoolCharacterConstants.fricle,
        CoolCharacterConstants.meluna,
        CoolCharacterConstants.velvet,
        CoolCharacterConstants.elena,
        CoolCharacterConstants.sylla,
        CoolCharacterConstants.amelia,
      ],
      CharacterType.gloomy: [
        GloomyCharacterConstants.festa,
        GloomyCharacterConstants.silphir,
        GloomyCharacterConstants.levi,
        GloomyCharacterConstants.ashur,
        GloomyCharacterConstants.posher,
        GloomyCharacterConstants.kidian,
        GloomyCharacterConstants.rim,
        GloomyCharacterConstants.kommy,
        GloomyCharacterConstants.rohneMayor,
        GloomyCharacterConstants.xXionx,
      ],
      CharacterType.brisk: [
        BriskCharacterConstants.carren,
        BriskCharacterConstants.beni,
        BriskCharacterConstants.marie,
        BriskCharacterConstants.jubee,
        BriskCharacterConstants.bana,
        BriskCharacterConstants.ui,
        BriskCharacterConstants.speakiMaid,
        BriskCharacterConstants.tig,
        BriskCharacterConstants.rude,
        BriskCharacterConstants.rufo,
        BriskCharacterConstants.canna,
        BriskCharacterConstants.butter,
      ],
      CharacterType.crazy: [
        CrazyCharacterConstants.ifrit,
        CrazyCharacterConstants.maestroMK2,
        CrazyCharacterConstants.mayo,
        CrazyCharacterConstants.chloe,
        CrazyCharacterConstants.ner,
        CrazyCharacterConstants.diana,
        CrazyCharacterConstants.belita,
        CrazyCharacterConstants.shady,
        CrazyCharacterConstants.sist,
      ],
      CharacterType.pure: [
        PureCharacterConstants.mago,
        PureCharacterConstants.gabia,
        PureCharacterConstants.speaki,
        PureCharacterConstants.rohne,
        PureCharacterConstants.bigWood,
        PureCharacterConstants.vivi,
        PureCharacterConstants.naia,
        PureCharacterConstants.daya,
        PureCharacterConstants.erpin,
      ],
    },
    BoardType.physicalDefense : {
      CharacterType.cool: [
        CoolCharacterConstants.lazy,
        CoolCharacterConstants.canta,
        CoolCharacterConstants.barong,
        CoolCharacterConstants.fricle,
        CoolCharacterConstants.meluna,
        CoolCharacterConstants.amelia,
      ],
      CharacterType.gloomy: [
        GloomyCharacterConstants.barie,
      ],
      CharacterType.brisk: [
        BriskCharacterConstants.momo,
      ],
      CharacterType.crazy: [
        CrazyCharacterConstants.mayo,
      ],
      CharacterType.pure: [
        PureCharacterConstants.speaki,
        PureCharacterConstants.bigWood,
        PureCharacterConstants.vivi,
        PureCharacterConstants.sherum,
        PureCharacterConstants.naia,
        PureCharacterConstants.daya,
        PureCharacterConstants.erpin,
      ],
    },
    BoardType.magicalDefense : {
      CharacterType.cool: [
        CoolCharacterConstants.lethe,
        CoolCharacterConstants.canta,
        CoolCharacterConstants.kommySwim,
      ],
      CharacterType.gloomy: [
        GloomyCharacterConstants.orr,
        GloomyCharacterConstants.xXionx,
      ],
      CharacterType.brisk: [
        BriskCharacterConstants.selline,
        BriskCharacterConstants.makasha,
        BriskCharacterConstants.suro,
        BriskCharacterConstants.epica,
      ],
      CharacterType.crazy: [
        CrazyCharacterConstants.leets,
        CrazyCharacterConstants.neti,
        CrazyCharacterConstants.sist,
        CrazyCharacterConstants.renewa,
      ],
      CharacterType.pure: [
        PureCharacterConstants.sherum,
        PureCharacterConstants.haley,
        PureCharacterConstants.kathy,
      ],
    },
    BoardType.fatalBlow : {
      CharacterType.cool: [
        CoolCharacterConstants.eisia,
        CoolCharacterConstants.elena,
        CoolCharacterConstants.sylla,
      ],
      CharacterType.gloomy: [
        GloomyCharacterConstants.barie,
        GloomyCharacterConstants.rohneMayor,
        GloomyCharacterConstants.risty,
      ],
      CharacterType.brisk: [
        BriskCharacterConstants.marie,
        BriskCharacterConstants.vela,
        BriskCharacterConstants.speakiMaid,
        BriskCharacterConstants.tig,
        BriskCharacterConstants.rufo,
        BriskCharacterConstants.butter,
      ],
      CharacterType.crazy: [
        CrazyCharacterConstants.belita,
        CrazyCharacterConstants.rollett,
        CrazyCharacterConstants.pira,
      ],
      CharacterType.pure: [
        PureCharacterConstants.mago,
        PureCharacterConstants.mayoCool,
      ],
    },
    BoardType.fatalDamage : {
      CharacterType.cool: [
        CoolCharacterConstants.ed,
        CoolCharacterConstants.eisia,
      ],
      CharacterType.gloomy: [
        GloomyCharacterConstants.shasha,
        GloomyCharacterConstants.blanchet,
        GloomyCharacterConstants.hilde,
        GloomyCharacterConstants.snorky,
        GloomyCharacterConstants.risty,
      ],
      CharacterType.brisk: [
        BriskCharacterConstants.bana,
        BriskCharacterConstants.momo,
        BriskCharacterConstants.shoupan,
        BriskCharacterConstants.suro,
        BriskCharacterConstants.arco,
      ],
      CharacterType.crazy: [
        CrazyCharacterConstants.elice,
        CrazyCharacterConstants.neti,
        CrazyCharacterConstants.renewa,
      ],
      CharacterType.pure: [
        PureCharacterConstants.mayoCool,
        PureCharacterConstants.opal,
      ],
    },
    BoardType.fatalBlowDefense : {
      CharacterType.cool: [
        CoolCharacterConstants.lethe,
        CoolCharacterConstants.ed,
        CoolCharacterConstants.guin,
        CoolCharacterConstants.picora,
        CoolCharacterConstants.dianaYester,
        CoolCharacterConstants.ricota,
      ],
      CharacterType.gloomy: [
        GloomyCharacterConstants.joanne,
      ],
      CharacterType.brisk: [
        BriskCharacterConstants.epica,
      ],
      CharacterType.crazy: [
        CrazyCharacterConstants.arnet,
        CrazyCharacterConstants.rollett,
        CrazyCharacterConstants.leets,
        CrazyCharacterConstants.rimChaos,
      ],
      CharacterType.pure: [
        PureCharacterConstants.ran,
        PureCharacterConstants.kyarot,
        PureCharacterConstants.laika,
        PureCharacterConstants.haley,
        PureCharacterConstants.opal,
      ],
    },
    BoardType.fatalDamageDefense : {
      CharacterType.cool: [
        CoolCharacterConstants.barong,
        CoolCharacterConstants.kommySwim,
        CoolCharacterConstants.picora,
      ],
      CharacterType.gloomy: [
        GloomyCharacterConstants.shasha,
        GloomyCharacterConstants.blanchet,
        GloomyCharacterConstants.hilde,
        GloomyCharacterConstants.lion,
        GloomyCharacterConstants.snorky,
        GloomyCharacterConstants.joanne,
      ],
      CharacterType.brisk: [
        BriskCharacterConstants.shoupan,
        BriskCharacterConstants.arco,
      ],
      CharacterType.crazy: [
        CrazyCharacterConstants.elice,
        CrazyCharacterConstants.pira,
        CrazyCharacterConstants.polan,
      ],
      CharacterType.pure: [
        PureCharacterConstants.kyarot,
      ],
    },
    BoardType.hp : {
      CharacterType.cool: [
        CoolCharacterConstants.patula,
        CoolCharacterConstants.espi,
        CoolCharacterConstants.guin,
        CoolCharacterConstants.jade,
        CoolCharacterConstants.aya,
        CoolCharacterConstants.dianaYester,
        CoolCharacterConstants.ricota,
        CoolCharacterConstants.velvet,
      ],
      CharacterType.gloomy: [
        GloomyCharacterConstants.chopi,
        GloomyCharacterConstants.veroo,
        GloomyCharacterConstants.festa,
        GloomyCharacterConstants.silphir,
        GloomyCharacterConstants.levi,
        GloomyCharacterConstants.ashur,
        GloomyCharacterConstants.orr,
        GloomyCharacterConstants.posher,
        GloomyCharacterConstants.kidian,
        GloomyCharacterConstants.rim,
        GloomyCharacterConstants.kommy,
        GloomyCharacterConstants.lion,
      ],
      CharacterType.brisk: [
        BriskCharacterConstants.mynx,
        BriskCharacterConstants.taida,
        BriskCharacterConstants.beni,
        BriskCharacterConstants.jubee,
        BriskCharacterConstants.selline,
        BriskCharacterConstants.vela,
        BriskCharacterConstants.ui,
        BriskCharacterConstants.makasha,
        BriskCharacterConstants.rude,
        BriskCharacterConstants.canna,
      ],
      CharacterType.crazy: [
        CrazyCharacterConstants.yumimi,
        CrazyCharacterConstants.maison,
        CrazyCharacterConstants.ifrit,
        CrazyCharacterConstants.maestroMK2,
        CrazyCharacterConstants.chloe,
        CrazyCharacterConstants.ner,
        CrazyCharacterConstants.arnet,
        CrazyCharacterConstants.diana,
        CrazyCharacterConstants.shady,
        CrazyCharacterConstants.rimChaos,
        CrazyCharacterConstants.polan,
      ],
      CharacterType.pure: [
        PureCharacterConstants.cuee,
        PureCharacterConstants.allet,
        PureCharacterConstants.sari,
        PureCharacterConstants.gabia,
        PureCharacterConstants.rohne,
        PureCharacterConstants.ran,
        PureCharacterConstants.laika,
        PureCharacterConstants.kathy,
      ],
    },
  };

  static const Map<BoardType, Map<CharacterType, List<CharacterModel>>> board2nd = {
    BoardType.attack : {
      CharacterType.cool: [],
      CharacterType.gloomy: [],
      CharacterType.brisk: [],
      CharacterType.crazy: [],
      CharacterType.pure: [],
    },
    BoardType.physicalDefense : {
      CharacterType.cool: [],
      CharacterType.gloomy: [],
      CharacterType.brisk: [],
      CharacterType.crazy: [],
      CharacterType.pure: [],
    },
    BoardType.magicalDefense : {
      CharacterType.cool: [],
      CharacterType.gloomy: [],
      CharacterType.brisk: [],
      CharacterType.crazy: [],
      CharacterType.pure: [],
    },
    BoardType.fatalBlow : {
      CharacterType.cool: [],
      CharacterType.gloomy: [],
      CharacterType.brisk: [],
      CharacterType.crazy: [],
      CharacterType.pure: [],
    },
    BoardType.fatalDamage : {
      CharacterType.cool: [],
      CharacterType.gloomy: [],
      CharacterType.brisk: [],
      CharacterType.crazy: [],
      CharacterType.pure: [],
    },
    BoardType.fatalBlowDefense : {
      CharacterType.cool: [],
      CharacterType.gloomy: [],
      CharacterType.brisk: [],
      CharacterType.crazy: [],
      CharacterType.pure: [],
    },
    BoardType.fatalDamageDefense : {
      CharacterType.cool: [],
      CharacterType.gloomy: [],
      CharacterType.brisk: [],
      CharacterType.crazy: [],
      CharacterType.pure: [],
    },
    BoardType.hp : {
      CharacterType.cool: [],
      CharacterType.gloomy: [],
      CharacterType.brisk: [],
      CharacterType.crazy: [],
      CharacterType.pure: [],
    },
  };

  static const Map<BoardType, Map<CharacterType, List<CharacterModel>>> board3rd = {
    BoardType.attack : {
      CharacterType.cool: [],
      CharacterType.gloomy: [],
      CharacterType.brisk: [],
      CharacterType.crazy: [],
      CharacterType.pure: [],
    },
    BoardType.physicalDefense : {
      CharacterType.cool: [],
      CharacterType.gloomy: [],
      CharacterType.brisk: [],
      CharacterType.crazy: [],
      CharacterType.pure: [],
    },
    BoardType.magicalDefense : {
      CharacterType.cool: [],
      CharacterType.gloomy: [],
      CharacterType.brisk: [],
      CharacterType.crazy: [],
      CharacterType.pure: [],
    },
    BoardType.fatalBlow : {
      CharacterType.cool: [],
      CharacterType.gloomy: [],
      CharacterType.brisk: [],
      CharacterType.crazy: [],
      CharacterType.pure: [],
    },
    BoardType.fatalDamage : {
      CharacterType.cool: [],
      CharacterType.gloomy: [],
      CharacterType.brisk: [],
      CharacterType.crazy: [],
      CharacterType.pure: [],
    },
    BoardType.fatalBlowDefense : {
      CharacterType.cool: [],
      CharacterType.gloomy: [],
      CharacterType.brisk: [],
      CharacterType.crazy: [],
      CharacterType.pure: [],
    },
    BoardType.fatalDamageDefense : {
      CharacterType.cool: [],
      CharacterType.gloomy: [],
      CharacterType.brisk: [],
      CharacterType.crazy: [],
      CharacterType.pure: [],
    },
    BoardType.hp : {
      CharacterType.cool: [],
      CharacterType.gloomy: [],
      CharacterType.brisk: [],
      CharacterType.crazy: [],
      CharacterType.pure: [],
    },
  };
}