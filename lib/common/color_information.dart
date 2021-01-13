import 'package:checoloresono/models/region.dart';
import 'package:checoloresono/models/title_paragraph.dart';

class ColorInformation {
  final Region region;
  final TitleParagraph titleParagraph;

  ColorInformation({
    this.region,
    this.titleParagraph,
  });

  String check() {
    switch (titleParagraph) {
      case TitleParagraph.BARERISTORAZIONE:
        switch (region) {
          case Region.ARANCIONE:
            return 'I ristoranti e le altre attività di ristorazione, compresi bar, pasticcerie e gelaterie, sono aperti esclusivamente per la vendita da asporto, consentita dalle ore 5 alle ore 22, nonché per la consegna a domicilio che è consentita senza limiti di orario.';
          case Region.ROSSO:
            return 'Sono consentite solo le attività di consegna al domicilio, senza alcuna limitazione, oltre al servizio d\'asporto che si può effettuare solo però tra le ore 5 e le 22, cioè nel rispetto del coprifuoco. La prefettura di Verona ha dato indicazione che l\'asporto in zona rossa sia possibile solo all\'interno del proprio Comune.';
          case Region.GIALLO:
            return 'I bar, ristoranti, pasticcerie, gelaterie, etc. possono riaprire ed effettuare il servizio al tavolo fino alle ore 18. Restano poi ovviamente consentiti il servizio d\'asporto tra le ore 5 e le 22, così come il servizio di consegna a domicilio senza alcuna limitazione d\'orario. Si può andare dunque nei locali dove si vuole all\'interno della propria Regione, consumare seduti al tavolo fino alle 18 ed acquistare prodotti d\'asporto tra le 5 e le 22, mentre è sempre possibile farsi consegnare prodotti a domicilio.';
          default:
            return 'Error';
        }
        break;
      case TitleParagraph.COPRIFUOCO:
        switch (region) {
          case Region.ARANCIONE:
            return 'Dalle ore 22 alle 5 del mattino vige come in tutte le aree di rischio la norma del coprifuoco, con divieto di circolazione nelle ore serali e notturne salvo che per motivi di lavoro, necessità o salute.';
          case Region.ROSSO:
            return 'È confermato e sussiste sempre dalle ore 22 fino alle 5 del mattino seguente.';
          case Region.GIALLO:
            return 'Dalle ore 22 alle 5 del mattino dopo è vietato circolare in strada salvo che per lavoro, necessità o salute.';
          default:
            return 'Error';
        }
        break;
      case TitleParagraph.NEGOZI:
        switch (region) {
          case Region.ARANCIONE:
            return 'Gli esercizi commerciali sono tutti aperti, non sono infatti previste limitazioni alle categorie di beni vendibili. Nelle giornate festive e prefestive sono però chiusi gli esercizi commerciali presenti all\'interno dei centri commerciali e dei mercati, ad eccezione delle farmacie, parafarmacie, presidi sanitari, punti vendita di generi alimentari, tabacchi ed edicole.';
          case Region.ROSSO:
            return 'Sono tutti chiusi salvo quelli indicati dall\'allegato 23 del DPCM 3 dicembre, tra i quali oltre a supermercati, farmacie, tabacchi, edicole, vanno ricordati i vivai, i negozi di articoli sportivi e quelli di vestiti per bambini e, ancora, le librerie.';
          case Region.GIALLO:
            return 'Gli esercizi commerciali sono tutti aperti e raggiungibili da chiunque e ovunque all\'interno della propria Regione.';
          default:
            return 'Error';
        }
        break;
      case TitleParagraph.SERVIZIALLAPERSONA:
        switch (region) {
          case Region.ARANCIONE:
            return 'Sono aperti centri estetici, centri benessere, al pari di barbieri e parrucchieri.';
          case Region.ROSSO:
            return 'Sono chiusi centri estetici e centri benessere, ma sono aperti barbieri e parrucchieri.';
          case Region.GIALLO:
            return 'Sono aperti anche i centri estetici ed i centri benessere al pari di parrucchieri e barbieri.';
          default:
            return 'Error';
        }
        break;
      case TitleParagraph.SPORTS:
        switch (region) {
          case Region.ARANCIONE:
            return 'L\'attività motoria può essere svolta dalle 5 del mattino alle ore 22 della sera, così come quella sportiva a livello individuale. In merito all\'attività sportiva individuale, il governo ha chiarito in apposita FAQ che è consentito spostarsi anche in un altro Comune per svolgere qui tale attività non sospesa, qualora sia indisponibile il luogo dove compierla all\'interno del proprio Comune. È il caso del tennis: se non avete un campo da tennis nel vostro Comune, potete andare in quello a voi più vicino che vi consenta di disporre di un campo da tennis e praticare l\'attività sportiva ammessa dalla normativa.';
          case Region.ROSSO:
            return 'L\'attività motoria è possibile solo «in prossimità della propria abitazione», mentre l\'attività sportiva è consentita «esclusivamente nell\'ambito del territorio del proprio Comune, in forma individuale e all\'aperto, mantenendo la distanza interpersonale di due metri». Chi pratica attività sportiva individuale che implichi in se stessa uno spostamento (corsa o bicicletta ad esempio), può anche attaversare il confine comunale e transitare in un altro Comune, purché lo spostamento resti finalizzato esclusivamente allo svolgimento dell\'atttività sportiva individuale e si concluda poi nel Comune di partenza.';
          case Region.GIALLO:
            return 'L\'unica esplicita limitazione per lo svolgimento di tali attività è quella del rispetto degli orari di coprifuoco tra le ore 22 e le 5 del mattino dopo. Bisogna quindi fare attività motoria o sportiva dopo le 5 ed entro le 22, per la prima indossando la mascherina e mantenendo un metro di distanza dagli altri, per fare attività sportiva invece la distanza da tenere è di due metri ma non è obbligatoria la mascherina.';
          default:
            return 'Error';
        }
        break;
      case TitleParagraph.VISITAACASA:
        switch (region) {
          case Region.ARANCIONE:
            return 'È sempre possibile fare visita a qualcuno in un\'abitazione privata situata all\'interno del proprio Comune, nel solo rispetto degli orari di coprifuoco e senza bisogno di deroghe alcune. Non sarà però consentito in zona arancione spostarsi per fare visita a parenti o amici se questi si trovino al di fuori dal proprio Comune. Viceversa, come detto, all\'interno del proprio Comune gli spostamenti sono liberi ed è quindi ammesso fare visita a chi si vuole ed in quanti si vuole, anche più di due persone possono spostarsi e più volte nello stesso giorno, nonché verso differenti abitazioni private, sempre però nel rispetto degli orari di coprifuoco.';
          case Region.ROSSO:
            return 'Le visite in casa saranno consentite nel rispetto del coprifuoco e nel limite di due persone; non si conteggiano i figli minori di 14 anni e le persone disabili o non autosufficienti con loro conviventi.';
          case Region.GIALLO:
            return 'In zona gialla non vi è bisogno di alcuna deroga per fare visita a casa di parenti o amici, essendo libera la mobilità nell\'intera propria Regione. Se i parenti o amici sono fuori Regione, non vi è però alcuna deroga che consenta di fare loro visita a casa. Dunque, dentro la propria Regione ci si può spostare in quanti si vuole ed andare a trovare chi si vuole nel rispetto solo degli orari di coprifuoco, ma non si può uscire dalla propria Regione per andare a trovare un parente o un amico, anche se questi abitino in un\'altra Regione zona gialla.';
          default:
            return 'Error';
        }
        break;
      case TitleParagraph.SPOSTAMENTI:
        switch (region) {
          case Region.ARANCIONE:
            return 'La mobilità è limitata a livello intercomunale, dunque non ci si può spostare tra Comuni diversi anche se interni alla propria stessa Regione, salvo che ricorrano motivi di lavoro, necessità, salute, di studio, oppure anche per svolgere attività o fruire di servizi non sospesi e però non disponibili nel proprio Comune. Di converso, gli spostamenti all\'interno del proprio Comune sono liberi e non devono essere motivati, tra le 5 del mattino e le 22 della sera.';
          case Region.ROSSO:
            return 'Divieto di mobilità già all\'interno del proprio Comune, salvo che per motivi di lavoro, necessità e salute. Non ci si può quindi spostare, salvo le medesime motivazioni, anche tra Comuni diversi o tra Regioni diverse.';
          case Region.GIALLO:
            return 'Ci si può spostare liberamente all\'interno dell\'intera propria Regione, quindi anche tra Comuni diversi, senza necessità di presentare alcuna autocertificazione, sempre però nel rispetto degli orari di coprifuoco. Vige però anche in zona gialla dal 7 e fino al 15 gennaio 2021, come appena specificato, il divieto di uscire dalla propria Regione, salvo che per motivi di lavoro, necessità e salute.';
          default:
            return 'Error';
        }
        break;
      default:
    }
    return 'Error complete';
  }
}
