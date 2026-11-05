Caso 1: Todo o tráfego de saída do AS 200 prefere ir pelo R1 (AS 100)
  O que acontece: 
  Se o PC6 (AS 200) ou o PC5 (AS 65000) quiserem comunicar com o PC4 (AS 300), o tráfego vai sempre sair pelo R1 -> R3, ignorando o caminho R2 -> R4. O R2 fica apenas como um caminho de "backup".
  Por que é que isto é possível? (Onde está na configuração):
  Na Parte 3t, temos a configuração no R1:

   1 R1
   2 router bgp 200
   3 bgp default local-preference 150
  Explicação: O Local-Preference padrão do BGP é 100. Ao alterar o do R1 para 150, o R1 diz a todos os routers internos do AS 200 (R2 e R7 via iBGP) que ele é a "melhor porta de saída". Assim, o R7 enviará o
  tráfego do AS 65000 sempre para o R1.

  ---

  Caso 2: O tráfego de PC6 (AS 200) para redes desconhecidas sai sempre pelo R1
  O que acontece:
  O router R6 (onde o PC6 está ligado) não tem BGP configurado (apenas OSPF). Se o PC6 tentar pingar o PC4, o R6 não sabe as rotas BGP. No entanto, ele encaminha o pacote para o R1 com sucesso, e nunca para o R2
  (a não ser que o R1 falhe).
  Por que é que isto é possível? (Onde está na configuração):
  Na Parte 3r, temos:

   1 R1: default-information originate always metric 1
   2 R2: default-information originate always metric 2
  Explicação: O R1 e o R2 estão a injetar uma Rota por Defeito (0.0.0.0/0) para dentro do OSPF (para o R6 e R7). Como a métrica do R1 é 1 (menor que a métrica 2 do R2), o R6 vai achar que o caminho mais "barato"
  para a Internet é pelo R1.

  ---

  Caso 3: As sessões BGP internas não falham, mesmo passando por R6 (Túneis lógicos)
  O que acontece:
  Os routers R1, R2 e R7 estabelecem vizinhanças iBGP entre si. O tráfego destas vizinhanças passa fisicamente pelo R6. Normalmente, isto causaria problemas de "buraco negro" (Blackhole) porque o R6 não sabe ler
  rotas BGP. No entanto, a comunicação funciona perfeitamente.
  Por que é que isto é possível? (Onde está na configuração):
  Na Parte 3o e Parte 4, foram criados Túneis GRE (Interfaces Tunnel 0, 1 e 2):

   1 R1: int tunnel 1 (tunnel source 200.20.3.1 / dest 200.20.1.7) -> IP 192.1.7.1
   2 R7: int tunnel 1 (tunnel source 200.20.1.7 / dest 200.20.3.1) -> IP 192.1.7.7
   3 R1: neighbor 192.1.7.7 remote-as 200
   4 R1: neighbor 192.1.7.7 next-hop-self
  Explicação: Foi criada uma rede Overlay. As mensagens BGP e o tráfego de dados são encapsulados no R1 e enviados diretamente para o R7. O R6 no meio apenas vê pacotes normais de IP a ir do R1 para o R7 e
  encaminha-os usando o OSPF, sem precisar de saber as rotas da Internet. O next-hop-self garante que R1 e R7 usem os IPs do túnel como próximo salto, forçando o tráfego a entrar no túnel.

  ---

  Caso 4: Ocultação do AS 65000 para a Internet (Remoção do Private AS)
  O que acontece:
  O AS 65000 é um AS Privado (números de 64512 a 65534 não são permitidos na Internet pública). Quando o PC5 comunica com o PC2 (AS 400), o pacote chega ao AS 400, mas se vires a tabela de routing do R4, a rota
  para a rede 200.50.0.0/24 vai mostrar apenas o AS_PATH: 200. O mundo exterior acha que a rede do PC5 pertence ao AS 200.
  Por que é que isto é possível? (Onde está na configuração):
  Na Parte 4g:

   1 R1: neighbor 192.1.3.3 remove-private-as
   2 R2: neighbor 192.2.4.4 remove-private-as
  Explicação: O comando remove-private-as no R1 e R2 "limpa" qualquer número de AS privado do AS_PATH antes de enviar o anúncio para o mundo externo (eBGP).

  ---

  Caso 5: Agregação (Sumarização) de Rotas do AS 100 e AS 400
  O que acontece:
  Se o R5 (AS 300) verificar a sua tabela BGP para saber como chegar ao AS 100, ele não vai ver as redes 200.10.0.0/24 e 200.10.1.0/24 separadas. Ele vai ver apenas uma única rota agregada: 200.10.0.0/23. O mesmo
  acontece para as redes do AS 400.
  Por que é que isto é possível? (Onde está na configuração):
  Na Parte 2k:

   1 R3: aggregate-address 200.10.0.0 255.255.254.0 summary-only
   2 R4: aggregate-address 200.40.0.0 255.255.254.0 summary-only
  Explicação: A opção summary-only suprime as rotas mais específicas (/24) e envia apenas a super-rede (/23), reduzindo o tamanho da tabela de encaminhamento dos vizinhos na Internet.

  ---

  (Bónus) Caso 6: O AS 200 foi impedido de ser Transitário temporariamente, mas depois autorizado
  O que aconteceu (Parte 3v):
  Foi criada uma access-list permit ^$ (que significa "origem local apenas") e aplicada na saída de R1 e R2 (filter-list 1 out). Isto fez com que o AS 200 ficasse "egoísta" e só anunciasse as suas próprias redes.
  Se alguém do AS 100 tentasse chegar ao AS 400 via AS 200, falhava.
  O que indica que voltou ao normal:

   1 R1: no neighbor 192.1.3.3 filter-list 1 out
   2 R2: no neighbor 192.2.4.4 filter-list 1 out
  A remoção do filtro no final permitiu que o AS 200 voltasse a agir como um AS Transitário (Transit AS), permitindo pings entre os PCs externos de um lado ao outro da topologia.