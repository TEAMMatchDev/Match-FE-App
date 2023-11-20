enum CardBank {
  KakaoBank('카카오뱅크','카카오뱅크', 'ic_kakao.svg', 'ic_card_kakao.svg', '090','카카오뱅크'),
  KB('국민', '국민카드', 'ic_kb.svg', 'ic_card_kb.svg', '381','KB국민'),
  NH('농협','농협카드', 'ic_nh.svg', 'ic_card_nh.svg', '371','농협'),
  Shinhan('신한', '신한카드', 'ic_shinhan.svg','ic_card_shinhan4.svg', '366','신한'),
  Woori('우리', '우리카드','ic_woori.svg', 'ic_card_woori.svg', '041','우리'),
  IBK('기업', '기업카드', 'ic_ibk.svg', 'ic_card_ibk.svg', '999','기업'), ///기업은행 코드 없어서 임시 부여
  Hana('하나', '하나카드', 'ic_hana.svg', 'ic_card_hana.svg', '374','하나'),
  PostOffice('우체국', '우체국카드', 'ic_postoffice.svg', 'ic_card_etc.svg','998','우체국'), ///우체국 코드 없음
  Etc('기타','기타', 'ic_etc.svg', 'ic_card_etc.svg', '','기타'); //나머지 모든 카드 '' 이면 전부 기타카드
  //Hyundai('현대', 'ic_card_hyundai.svg', '367','현대'),
  //MG('MG새마을금고', 'ic_card_mg.svg', '045','MG새마을금고');

  final String name; ///은행사 이름
  final String cardName; ///카드사 이름
  final String icon; ///카드사 아이콘
  final String cardIcon; ///카드 아이콘
  final String code; ///은행 코드
  final String bankName; ///카드정보 등록 시 보일 카드사 이름

  const CardBank(this.name, this.cardName, this.icon, this.cardIcon, this.code, this.bankName);

  /// 이름으로 CardBank enum 찾기
  static CardBank fromName(String cardName) {
    return CardBank.values.firstWhere(
        (card) => cardName.contains(card.name),
      orElse: () => CardBank.Etc,
    );
  }

  /// 코드로 CardBank enum 찾기
  static CardBank fromCode(String code){
    return CardBank.values.firstWhere(
            (card) => code == card.code,
      orElse: () => CardBank.Etc,
    );
  }


}
