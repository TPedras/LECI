# Relatório de Implementação: Sistema de Controlo de Acesso via Tons

Este documento detalha as alterações realizadas ao código de base (`micMainOriginal.c`) para cumprir os requisitos do Mini-Projecto de Sensores e Sinais (2025-2026), documentados no ficheiro `SS2526_ProjectoFinal_Stud_V2.pdf`.

## 1. Frequências e Símbolos
Foi adicionada uma secção no início do código para definir os parâmetros dos alunos e as frequências correspondentes a cada símbolo:
* **Turma 5, NMECs: 116113 e 125413**
* **"0" (F0):** Turma * 500 Hz = 2500 Hz
* **"1" (F1):** F0 + 700 + ((soma algarismos % 10) * 20) = 2500 + 700 + (9 * 20) = 3380 Hz
* **"2" (F2):** F1 + 700 + ((soma algarismos % 10) * 20) = 3380 + 700 + 180 = 4260 Hz

Foram também definidas as sequências corretas (`SEQ_ABRIR` e `SEQ_FECHAR`), constituídas por 4 símbolos cada.

## 2. Remoção da Componente DC (DC Offset)
Os microfones analógicos introduzem um offset de tensão constante (DC). Se este offset não for retirado, cria um erro no processamento:
1. **Efeito de Borda (Degrau):** No início da convolução, o valor salta de 0 para o valor do offset de forma abrupta, contendo altas frequências que induzem artificialmente picos na saída do filtro FIR.
2. **Fuga DC:** O filtro FIR pode não atenuar absolutamente os 0 Hz, originando falsas leituras na energia global e ativando deteções fantasma.

**Alteração:** 
Adicionou-se um ciclo `for` para calcular a média de cada novo bloco de áudio lido. Seguidamente, essa média é subtraída a cada amostra do bloco, centrando o sinal em zero antes de este passar pela filtragem.

## 3. Aplicação de Filtros (Convolução)
O código original demonstrava a utilização de um filtro FIR com o auxílio da função `dsps_fir_init_f32()`. No entanto, o guião exige explicitamente que: 
> "A única função específica da biblioteca de DSP da EspressIF-IDF que pode ser usada é a de convolução (`dsps_conv_f32`)."

**Alteração:** 
1. Removeu-se a inicialização de filtros proibida pelo guião.
2. Na tarefa de processamento de áudio, a amostra (limpa do seu valor DC) é processada recorrendo exclusivamente à função `dsps_conv_f32`. 
3. Aplicamos a convolução três vezes seguidas sobre o mesmo bloco de som, testando cada um dos filtros calculados (`h_f0`, `h_f1`, `h_f2`).

## 4. Cálculo de Energia e Limiares
Para determinar a presença de um tom, é necessário saber se a amplitude média do sinal resultante nessa gama de frequências é forte o suficiente.

**Alteração:**
* Calculou-se o valor absoluto médio para o resultado de cada convolução recorrendo a uma estrutura de controlo simples (if-else), em vez de invocar funções de bibliotecas matemáticas complexas. Esta métrica serve como "energia".
* Adicionou-se a constante `SOUND_THRESHOLD` (inicializada a `50.0f`). Se a energia do filtro for inferior a este valor, o som é considerado ruído. 
* O símbolo detetado corresponderá à frequência cujo filtro apresentar a maior energia (e que ultrapasse o limiar definido).

## 5. Máquina de Estados (Lógica de Controlo de Acessos)
No código original, a deteção de sequência e respetiva sinalização não existiam. Concebemos uma lógica que lida com a leitura contínua, prevenindo deteções repetidas.

**Implementação:** 
* **Prevenção de Repetições:** Um símbolo só é validado e guardado se for diferente do último símbolo detetado (`last_symbol`). 
* **Silêncio entre símbolos:** Para permitir a introdução do mesmo dígito sequencialmente (ex: "0" seguido de "0"), o sistema conta blocos consecutivos onde apenas se deteta ruído (silêncio). Após um curto período sem tom (~300 ms), o `last_symbol` sofre reset para `-1`.
* **Verificação da Sequência:** A comparação entre a sequência introduzida e as sequências corretas é efetuada num simples ciclo `for` que valida elemento a elemento as combinações para "Abrir" ou "Fechar".
* **Timeout de Sequência:** Adicionou-se um mecanismo de segurança em que, se houver um silêncio muito prolongado (> 4 segundos), a contagem da sequência sofre reset, evitando que o sistema fique bloqueado a meio de uma password esquecida.

## 6. Controlo do LED
A indicação física do estado da porta exigia a configuração de um LED.
* Conforme indicado no guião, utilizou-se o pino `GPIO11`. O pino foi inicializado como saída na função principal (`app_main`).
* **Comportamentos implementados:**
  * Sequência de "Abrir" -> LED Ligado (Porta aberta).
  * Sequência de "Fechar" -> LED Desligado (Porta fechada).
  * Sequência errada -> Um ciclo que faz o LED piscar rapidamente durante cerca de 5 segundos, sinalizando o erro, seguindo-se um reset à máquina de estados.