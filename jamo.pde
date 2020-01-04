// 일반 분해
private final static char[] KO_INIT_S =
{
  'ㄱ', 'ㄲ', 'ㄴ', 'ㄷ', 'ㄸ', 'ㄹ', 'ㅁ', 'ㅂ', 'ㅃ', 'ㅅ', 'ㅆ', 'ㅇ', 'ㅈ', 'ㅉ', 'ㅊ',
  'ㅋ', 'ㅌ', 'ㅍ', 'ㅎ' 
}; // 19

private final static char[] KO_INIT_M = 
{
  'ㅏ', 'ㅐ', 'ㅑ', 'ㅒ', 'ㅓ', 'ㅔ', 'ㅕ', 'ㅖ', 'ㅗ', 'ㅘ', 'ㅙ', 'ㅚ', 'ㅛ', 'ㅜ', 'ㅝ',
  'ㅞ', 'ㅟ', 'ㅠ', 'ㅡ', 'ㅢ', 'ㅣ'
}; // 21
private final static char[] KO_INIT_E =
{
  0, 'ㄱ', 'ㄲ', 'ㄳ', 'ㄴ', 'ㄵ', 'ㄶ', 'ㄷ', 'ㄹ', 'ㄺ', 'ㄻ', 'ㄼ', 'ㄽ', 'ㄾ', 'ㄿ',
  'ㅀ', 'ㅁ', 'ㅂ', 'ㅄ', 'ㅅ', 'ㅆ', 'ㅇ', 'ㅈ', 'ㅊ', 'ㅋ', 'ㅌ', 'ㅍ', 'ㅎ'
}; // 28

// 완전 분해
private final static char[][] KO_ATOM_S = 
{
  { 'ㄱ' }, { 'ㄱ', 'ㄱ' }, { 'ㄴ' }, { 'ㄷ' }, { 'ㄷ', 'ㄷ' }, { 'ㄹ' }, { 'ㅁ' },
  { 'ㅂ' }, { 'ㅂ', 'ㅂ' }, { 'ㅅ' }, { 'ㅅ', 'ㅅ' }, { 'ㅇ' }, { 'ㅈ' }, { 'ㅈ', 'ㅈ' }, { 'ㅊ' }, { 'ㅋ' }, { 'ㅌ' },
  { 'ㅍ' }, { 'ㅎ' }
};
private final static char[][] KO_ATOM_M = 
{
  { 'ㅏ' }, { 'ㅐ' }, { 'ㅑ' }, { 'ㅒ' }, { 'ㅓ' }, { 'ㅔ' }, { 'ㅕ' }, { 'ㅖ' },
  { 'ㅗ' }, { 'ㅗ', 'ㅏ' }, { 'ㅗ', 'ㅐ' }, { 'ㅗ', 'ㅣ' }, { 'ㅛ' }, { 'ㅜ' }, { 'ㅜ', 'ㅓ' }, { 'ㅜ', 'ㅔ' },
  { 'ㅜ', 'ㅣ' }, { 'ㅠ' }, { 'ㅡ' }, { 'ㅡ', 'ㅣ' }, { 'ㅣ' } 
};
private final static char[][] KO_ATOM_E = 
{
  {}, { 'ㄱ' }, { 'ㄱ', 'ㄱ' }, { 'ㄱ', 'ㅅ' }, { 'ㄴ' }, { 'ㄴ', 'ㅈ' },
  { 'ㄴ', 'ㅎ' }, { 'ㄷ' }, { 'ㄹ' }, { 'ㄹ', 'ㄱ' }, { 'ㄹ', 'ㅁ' }, { 'ㄹ', 'ㅂ' }, { 'ㄹ', 'ㅅ' }, { 'ㄹ', 'ㅌ' },
  { 'ㄹ', 'ㅍ' }, { 'ㄹ', 'ㅎ' }, { 'ㅁ' }, { 'ㅂ' }, { 'ㅂ', 'ㅅ' }, { 'ㅅ' }, { 'ㅅ', 'ㅅ' }, { 'ㅇ' }, { 'ㅈ' },
  { 'ㅊ' }, { 'ㅋ' }, { 'ㅌ' }, { 'ㅍ' }, { 'ㅎ' } 
};
// 쌍자음이나 이중모음을 분해
private final static char[][] KO_ATOM_P = 
{
  { 'ㄱ' }, { 'ㄱ', 'ㄱ' }, { 'ㄱ', 'ㅅ' }, { 'ㄴ' }, { 'ㄴ', 'ㅈ' },
  { 'ㄴ', 'ㅎ' }, { 'ㄷ' }, { 'ㄸ' }, { 'ㄹ' }, { 'ㄹ', 'ㄱ' }, { 'ㄹ', 'ㅁ' }, { 'ㄹ', 'ㅂ' }, { 'ㄹ', 'ㅅ' },
  { 'ㄹ', 'ㄷ' }, { 'ㄹ', 'ㅍ' }, { 'ㄹ', 'ㅎ' }, { 'ㅁ' }, { 'ㅂ' }, { 'ㅂ', 'ㅂ' }, { 'ㅂ', 'ㅅ' }, { 'ㅅ' },
  { 'ㅅ', 'ㅅ' }, { 'ㅇ' }, { 'ㅈ' }, { 'ㅈ', 'ㅈ' }, { 'ㅊ' }, { 'ㅋ' }, { 'ㅌ' }, { 'ㅍ' }, { 'ㅎ' }, { 'ㅏ' }, { 'ㅐ' },
  { 'ㅑ' }, { 'ㅒ' }, { 'ㅓ' }, { 'ㅔ' }, { 'ㅕ' }, { 'ㅖ' }, { 'ㅗ' }, { 'ㅗ', 'ㅏ' }, { 'ㅗ', 'ㅐ' }, { 'ㅗ', 'ㅣ' },
  { 'ㅛ' }, { 'ㅜ' }, { 'ㅜ', 'ㅓ' }, { 'ㅜ', 'ㅔ' }, { 'ㅜ', 'ㅣ' }, { 'ㅠ' }, { 'ㅡ' }, { 'ㅡ', 'ㅣ' }, { 'ㅣ' }
};

/** 한글부분을 초성으로 교체합니다. */
public static String toKoChosung(String text)
{
  if (text == null) { return null; }
  
  // 한글자가 한글자와 그대로 대응됨.
  // 때문에 기존 텍스트를 토대로 작성된다.
  char[] rv = text.toCharArray();
  char ch;
  
  for (int i = 0 ; i < rv.length ; i++)
  {
    ch = rv[i];
    if (ch >= '가' && ch <= '힣')
    {
      rv[i] = KO_INIT_S[(ch - '가') / 588]; // 21 * 28
    }
  }
  
  return new String(rv);
}

/** 한글부분을 자소로 분리합니다. <br>많다 = [ㅁㅏㄶㄷㅏ] */
public static String toKoJaso(String text)
{
  if (text == null) { return null; }
  // StringBuilder의 capacity가 0으로 등록되는 것 방지.
  if (text.length() == 0) { return ""; }
  
  // 한글자당 최대 3글자가 될 수 있다.
  // 추가 할당 없이 사용하기위해 capacity 를 최대 글자 수 만큼 지정하였다.
  StringBuilder rv = new StringBuilder(text.length() * 3);
  
  for (char ch : text.toCharArray())
  {
    if (ch >= '가' && ch <= '힣')
    {
      // 한글의 시작부분을 구함
      int ce = ch - '가';
      // 초성을 구함
      rv.append(KO_INIT_S[ce / (588)]); // 21 * 28
      // 중성을 구함
      rv.append(KO_INIT_M[(ce = ce % (588)) / 28]); // 21 * 28
       // 종성을 구함
      if ((ce = ce % 28) != 0)
      {
        rv.append(KO_INIT_E[ce]);
      }
    }
    else
    {
      rv.append(ch);
    }
  }
  
  return rv.toString();
}

/** 한글부분을 자소로 완전 분리합니다. <br>많다 = [ㅁㅏㄴㅎㄷㅏ]*/
public static String toKoJasoAtom(String text)
{
  if (text == null) { return null; }
  // StringBuilder의 capacity가 0으로 등록되는 것 방지.
  if (text.length() == 0) { return ""; }
  
  // 한글자당 최대 6글자가 될 수 있다.
  // 추가 할당 없이 사용하기위해 capacity 를 최대 글자 수 만큼 지정하였다.
  StringBuilder rv = new StringBuilder(text.length() * 6);
  
  for (char ch : text.toCharArray())
  {
    if (ch >= '가' && ch <= '힣')
    {
      // 한글의 시작부분을 구함
      int ce = ch - '가';
      // 초성을 구함
      rv.append(KO_ATOM_S[ce / (588)]); // 21 * 28
      // 중성을 구함
      rv.append(KO_ATOM_M[(ce = ce % (588)) / 28]); // 21 * 28
      // 종성을 구함
      if ((ce = ce % 28) != 0)
      {
        rv.append(KO_ATOM_E[ce]);
      }
    }
    // 쌍자음과 이중모음 분리
    else if (ch >= 'ㄱ' && ch <= 'ㅣ')
    {
      rv.append(KO_ATOM_P[ch - 'ㄱ']);
    }
    else
    {
      rv.append(ch);
    }
  }
  
  return rv.toString();
}
