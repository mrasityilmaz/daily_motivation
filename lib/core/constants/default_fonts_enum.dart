enum DefaultFontsEnum {
  abrilFatface('Abril Fatface'),
  alegreya('Alegreya'),
  alegreyaSans('Alegreya Sans'),
  alfaSlabOne('Alfa Slab One'),
  allison('Allison', maxFontSize: 46, minFontSize: 18),
  architectsDaughter('Architects Daughter'),
  archivoNarrow('Archivo Narrow'),
  audiowide('Audiowide'),
  bangers('Bangers'),
  bebasNeue('Bebas Neue'),
  bitter('Bitter'),
  blackOpsOne('Black Ops One'),
  bungeeShade('Bungee Shade'),

  bungeeSpice('Bungee Spice'),
  cabinSketch('Cabin Sketch'),
  calistoga('Calistoga'),

  caprasimo('Caprasimo'),
  cardo('Cardo'),
  caveat('Caveat'),
  chivo('Chivo'),
  cinzel('Cinzel'),
  comfortaa('Comfortaa'),
  cormorant('Cormorant'),
  courgette('Courgette'),
  dmSans('DM Sans'),
  ebGaramond('EB Garamond'),
  eczar('Eczar'),
  electrolize('Electrolize'),
  exo2('Exo 2'),
  firaSans('Fira Sans'),
  fjallaOne('Fjalla One'),
  forum('Forum'),
  fraunces('Fraunces'),
  greatVibes('Great Vibes'),
  heebo('Heebo'),
  ibmPlexSans('IBM Plex Sans'),
  inconsolata('Inconsolata'),
  indieFlower('Indie Flower'),
  inknutAntiqua('Inknut Antiqua'),
  inter('Inter'),
  italianno('Italianno'),
  josefinSans('Josefin Sans'),
  kanit('Kanit'),
  karla('Karla'),
  kaushanScript('Kaushan Script'),
  lato('Lato'),
  libreBaskerville('Libre Baskerville'),
  libreFranklin('Libre Franklin'),
  lilitaOne('Lilita One'),
  lobster('Lobster'),
  lora('Lora'),
  manrope('Manrope'),
  merriweather('Merriweather'),
  montserrat('Montserrat'),
  neuton('Neuton'),
  niconne('Niconne'),
  norican('Norican'),
  notoSansMono('Noto Sans Mono'),
  nunito('Nunito'),

  openSans('Open Sans'),
  orbitron('Orbitron'),

  oswald('Oswald'),
  outfit('Outfit'),
  pacifico('Pacifico'),
  pathwayGothicOne('Pathway Gothic One'),
  permanentMarker('Permanent Marker'),
  playfairDisplay('Playfair Display'),
  plusJakartaSans('Plus Jakarta Sans'),
  poppins('Poppins'),
  prompt('Prompt'),
  prozaLibre('Proza Libre'),
  ptSans('PT Sans'),
  ptSerif('PT Serif'),
  rajdhani('Rajdhani'),
  raleWay('Raleway'),
  rancho('Rancho'),
  roboto('Roboto'),
  rockSalt('Rock Salt'),
  ropaSans('Ropa Sans'),
  rubik('Rubik'),
  russoOne('Russo One'),
  sacramento('Sacramento'),
  slabo27px('Slabo 27px'),
  spaceGrotesk('Space Grotesk'),
  spaceMono('Space Mono'),
  spectral('Spectral'),
  splineSans('Spline Sans'),
  squadaOne('Squada One'),
  staatliches('Staatliches'),
  sueEllenFrancisco('Sue Ellen Francisco'),
  syne('Syne'),

  teko('Teko'),
  tektur('Tektur'),
  ubuntu('Ubuntu'),
  vt323('VT323'),
  workSans('Work Sans'),
  yanoneKaffeesatz('Yanone Kaffeesatz'),
  yellowtail('Yellowtail'),
  ;

  const DefaultFontsEnum(this.fontFamily, {this.maxFontSize = 30, this.minFontSize = 9});
  final String fontFamily;
  final double maxFontSize;
  final double minFontSize;
}
