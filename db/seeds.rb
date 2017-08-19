users = %w(arnaud berenger danny elie samuel sofiane)

puts 'Creating users'
database_users = users.map do |u|
  puts "    #{u}"
  user = User.new(
      username: u,
      email: "#{u}@lets-dev.fr",
      password: "#{u}@lets-dev.fr",
      password_confirmation: "#{u}@lets-dev.fr",
      confirmed_at: Time.now)
  user.skip_confirmation!
  user.save
  user
end

puts 'Creating current desk'
current_desk = Desk.create(started_at: Time.now - 6.months, ended_at: Time.now + 6.months)
puts "Adding #{database_users.last.username} to current desk"
DeskUserMembership.create(desk: current_desk, user: database_users.last)

Language.create(name: 'Ruby')
LanguageSet.create(name: 'Ruby Set')
LanguageSetMembership.create(language: Language.first, language_set: LanguageSet.first)
3.times do
  Challenge.create(
      language_set: LanguageSet.first,
      title: 'Random Challenge',
      subject: '# Dolet et aera est inluxisse

## Deformes clarus

Lorem markdownum longius conplevit dixit: magica praesignis stipata nova. Nunc
coniunx multae, abit sinusque gentes, et finge pectoraque vigili. Vel Cyllene
maduit, hos optas Iano: Romane quas credensque studium cum solet Oceanum
praemia. Quod summe erat, silvisque superque et ei ipsa mihi dat?

## Vocem ipso caligine e quaeque Argus res

Et venerit superata collo sustinet et Ilus ferre ossa tenebat attenuatus novum
solent et crepitantibus aequora? Tristes domus per viridesque utque; Actaeon
vestigia, Cinyran domus furens arcem potentem.

1. Tyrrhenus omnes
2. Unda ite verbaque nobilitas parenti vimque Paeana
3. Aris sed bello parentem debuerant deae
4. Pictis merito
5. Remis nunc tui
6. Deus condidit adgreditur deducat illic habens

## Duplici regia

Esse frena vitale, formas ille *amorem vacuum* moves praesignis **nacta**,
Saeculaque relictas, tinctam [retractant](http://dulcia.com/locaipsae.aspx)
faucibus nova cedere. Nam Iove nisi nivea locuta formamque sit vox sensimus hic
vulnere Pyrrhus testatum poscimus, ille fulget. Cladis ut memores haec enim
facundia, lumina iam praelata, videre. Procul tenet nec mirum blandis receptus
factus et Aesarei umbrosa, plaustrum dictaque tene laticem, cupiasque cohors,
et. Tulit constitit medio supplex per; et satis, tumulati Pharosque sumpta.

    var transferShift = gateway(3, 38);
    simmPartyDos(dvEdutainment.dram(5, metafile_lossless) + processor_grep_wrap,
            hashtagMemory);
    if (lionCarrierBit) {
        optical.emoticon(hard_topology_youtube, uatRadcabHsf - apache, 2);
        fiber_png_lion = engineExcelFile;
        drive_page(core(searchForumBin, 4), soft, 93 + 3);
    }
    var rayGraphicRw = nybble_personal;
    var dIo = card.compilerInternicTerminal.packet(bash, autoresponder,
            routerDomainTrackback(userCpsBoot, loginSwitchCisc, shell)) -
            apiAdslVlb;

## Vidit et uno fugientia oblitus

Sollertia in licet arbor expalluit: asello. Illi erat; perdidit [excussa
sinit](http://www.mons.io/declinat.html), adit tamen undis, **viae** nullius
dant latet edideras supponas. Capillos telis nunc, quibusque, clipeo haesit,
terras ardua: et Alcathoi fingit! Nil alarum sermone illis habenas, inde lora
est perdidit; sub. Inde *currum et male* questi freta vellem tollens scilicet
comantur per adgreditur [carpens](http://temptatis.com/)!

Et virgo: fortiter **mihi spargit nidor** mihi sepulcro, ne vidi robora,
[columbas](http://tu.io/illistradat.html). Micant clauditur superi tu nuper
frustra occulte praevia perpetuum turpes
[quoniam](http://mycenae.com/virgaque-in). [Huic
questus](http://ambiguumpetis.com/collo), et simulat humus cervi natalibus quo
inque steterant Achaemenias puerum. Modo ignibus verus mirum mihi, poenae
formosa subdita incepto hunc requiret isdem; nunc auctor sint? Agrosque rigidis
vel.',
      starts_at: Time.now - 1.month,
      ends_at: Time.now + 1.month
  )
end

Team.create(name: "Let's Dev Team !")
TeamUserMembership.create(user: database_users.first, team: Team.first, role: :admin)
TeamUserMembership.create(user: database_users.last, team: Team.first, role: :admin)

c = Challenge.first
c.update(ends_at: Time.now - 1.day)
ChallengeRatingCriterium.create(challenge: c, name: 'First criteria', description: 'The first one')
ChallengeRatingCriterium.create(challenge: c, name: 'Second criteria', description: 'The second one')

TeamChallengeMembership.create(team: Team.first, challenge: c)

JuryChallengeMembershipRequest.create(challenge: c, user: database_users.last, status: :accepted)
