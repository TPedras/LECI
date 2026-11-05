a) T
  b) F
  c) T
  d) F
  e) T
  f) F
  g) V
  h) F
  i) F
  j) T
  k) F (Mudou! Falta o maximum-paths para aparecer na routing table com dois caminhos simultâneos)
  l) F
  m) F (Mudou! Devido à alínea 4g remove-private-as, o 65000 não deveria aparecer em R3)
  n) T




a) UPDATE 1 was sent by R2 to R1.
  Resposta: Verdadeiro. O UPDATE 1 tem o atributo LOCAL_PREF (típico de iBGP) e o AS_PATH termina em 400 300, indicando que veio pelo lado do AS 400. Sendo 192.1.2.2 o IP do tunnel criado no R2 na alínea 3o), é o
  R2 que envia este update iBGP para o R1.

  b) UPDATE 2 was sent by R1 to R3.
  Resposta: Falso. O NEXT_HOP no UPDATE 2 é 192.1.3.3, que é o IP da interface f0/0 do R3. Num update eBGP, o Next Hop é o IP do router que envia, logo foi o R3 que enviou para o R1.

  c) There is an iBGP connection between R2 and R7.
  Resposta: Verdadeiro. Na parte 4 das configurações, vemos que foram criados túneis (Tunnel 2) entre R2 e R7, e na configuração BGP de R2 há o comando neighbor 192.2.7.7 remote-as 200 e no R7 neighbor 192.2.7.2
  remote-as 200. Ambos estão no AS 200, logo é uma ligação iBGP.

  d) AS 400 is a non-transit autonomous system.
  Resposta: Falso. O AS_PATH: 400 300 no UPDATE 1 mostra que o AS 400 está a receber as rotas do AS 300 e a anunciá-las ao AS 200, agindo como um AS de trânsito.

  e) The NEXT_HOP attribute of the BGP Updates sent by R1 to R7 is always 192.1.7.1.
  Resposta: Verdadeiro. Na parte 4, R1 tem a configuração neighbor 192.1.7.7 next-hop-self apontada ao R7. A interface Tunnel 1 no R1 (que liga ao R7) tem o IP 192.1.7.1. Devido ao comando next-hop-self, o R1
  forçará que todos os updates enviados para R7 tenham este IP como Next Hop.

  f) In the BGP Updates of the AS 400 network prefixes sent by R5 to R3, the NEXT_HOP attribute is 192.4.5.4.
  Resposta: Falso. Quando R5 (AS 300) anuncia rotas eBGP para R3 (AS 100), o R5 altera o Next Hop para o seu próprio IP na interface que liga a R3. Portanto, o Next Hop será 192.3.5.5 e não o IP do R4.

  g) In a ping from PC6 to PC3, the Echo Request messages are forwarded through ASs 200, 100, 300 and 400, and the Echo Reply messages are forwarded through ASs 400 and 200.
  Resposta: Falso. O PC6 está na rede 200.20.0.0 (AS 200) e o PC3 está na rede 200.40.1.0 (AS 400). Pela topologia, há uma ligação direta entre o AS 200 (R2) e o AS 400 (R4). O tráfego não precisa de dar a volta
  pelo AS 100 e 300; o Request iria pelo caminho mais curto via R2-R4.

  h) In a ping from PC5 to PC2, the Echo Request messages are forwarded through ASs 65000, 200 and 400, and the Echo Reply messages are forwarded through ASs 400, 200 and 65000.
  Resposta: Verdadeiro. O PC5 está no AS 65000 e o PC2 no AS 400. O caminho de ida e de volta atravessará naturalmente o AS 200, que atua como AS de trânsito ligando ambos.

  i) A ping from PC2 to the IP address 192.4.5.5 fails.
  Resposta: Falso. O PC2 (na rede 200.40.0.0/24) envia o pacote para o R4 (seu gateway). O IP 192.4.5.5 pertence à interface f1/0 do R5, que está diretamente ligada ao R4 na mesma sub-rede 192.4.5.0/24. O R4
  conhece essa rede diretamente e R5 também sabe como chegar à rede de PC2 via BGP (R4 anuncia a rede 200.40.0.0 no BGP).

  j) The routing table of R4 can have the following BGP entry: B 200.50.0.0/24 [20/0] via 192.2.4.2
  Resposta: Verdadeiro. A rede 200.50.0.0 pertence ao AS 65000. O R4 (AS 400) aprenderá esta rota via eBGP através do seu vizinho R2 (AS 200) no IP 192.2.4.2. Tratando-se de eBGP, a AD é 20.

  k) The routing table of R5 can have the following BGP entry: B 200.20.0.0/24 [20/0] via 192.3.5.3 e via 192.4.5.4
  Resposta: Verdadeiro. O AS 200 é anunciado quer pelo R3 (via AS 100) quer pelo R4 (via AS 400). Ambas são rotas eBGP para o R5 (AD 20), e tendo caminhos de tamanho idêntico (se assim for anunciado), ambas podem
  surgir na tabela se o multi-path estiver ativo.

  l) The routing table of R1 can have the following BGP entry: B 192.10.1.0/24 [20/2] via 192.1.3.3
  Resposta: Falso. A rede que existe no AS 100 é 200.10.1.0/24 (conforme diagrama e configurações do R9/R3) e não 192.10.1.0/24.

  m) The command show ip bgp in R3 can have the following entry:
  Resposta: Verdadeiro. O R3 está a aprender como chegar à rede 200.50.0.0 (AS 65000) de duas formas:
   1. Pelo R1 (192.1.3.1), passando pelos AS 200 e 65000 (AS_PATH mais curto, por isso está marcada como *> a melhor rota).
   2. Pelo R5 (192.3.5.5), passando pelos AS 300, 400, 200, 65000.

  n) The command show ip bgp in R5 can have the following entry:
  Resposta: Verdadeiro. O R5 aprende a rota 200.20.3.0 de duas maneiras com o mesmo número de saltos de AS (AS_PATH length = 2):
   1. Via R4 (192.4.5.4): caminho 400 200.
   2. Via R3 (192.3.5.3): caminho 100 200.
  O símbolo de origem ? (Incomplete) deve-se ao facto da rota estar a ser injetada através de redistribuição de OSPF no R1 e R2 (como se vê nas configurações redistribute ospf 1).