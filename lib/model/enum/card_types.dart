enum CardBank {
  Hana('하나', 'ic_card_hana.svg', '374','하나'),
  Hyundai('현대', 'ic_card_hyundai.svg', '367','현대'),
  KakaoBank('카카오뱅크', 'ic_card_kakao.svg', '090','카카오뱅크'),
  KB('국민', 'ic_card_kb.svg', '381','KB국민'),
  MG('MG새마을금고', 'ic_card_mg.svg', '045','MG새마을금고'),
  Shinhan('신한', 'ic_card_shinhan.svg', '366','신한'),
  Woori('우리', 'ic_card_woori.svg', '041','우리'),
  NH('농협', 'ic_card_nh.svg', '371','농협'),
  Etc('기타', 'ic_card_etc.svg', '','기타'); //나머지 모든 카드 '' 이면 전부 기타카드

  final String name;
  final String icon;
  final String code;
  final String cardName;

  const CardBank(this.name, this.icon, this.code, this.cardName);

  /// 이름으로 CardBank enum 찾기
  static CardBank fromName(String cardName) {
    return CardBank.values.firstWhere(
        (card) => cardName.contains(card.name),
      orElse: () => CardBank.Etc,
    );
  }

  /// 코드로 CardBank
  static CardBank fromCode(String code){
    return CardBank.values.firstWhere(
            (card) => code == card.code,
      orElse: () => CardBank.Etc,
    );
  }


}
