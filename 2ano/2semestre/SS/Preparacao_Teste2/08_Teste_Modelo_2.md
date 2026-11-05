# Teste Modelo 2 (Preparação) - Sensores e Sinais

**Duração:** 90 minutos
**Cotação Parte 1:** Resposta certa: +1/2 val; Resposta errada: -1/6 val.

---

## Parte 1 (Escolha Múltipla)

**1. Em metrologia, a gama (range) de um instrumento de medição define-se como:**
a. O valor máximo absoluto que o instrumento pode ler sem se danificar.
b. O intervalo de valores para os quais o erro do instrumento está dentro de limites definidos.
c. A diferença entre o valor máximo e o valor mínimo da escala.
d. A menor alteração da grandeza medida que o instrumento deteta.

<details>
<summary><b>Resolução</b></summary>
<b>Resposta Correta: b</b>. O intervalo de valores para os quais o seu erro está dentro de limites definidos. A diferença entre o máximo e o mínimo é o <i>span</i>, e a menor alteração é a <i>resolução</i>.
</details>

**2. Um sistema de medição apresenta boa repetibilidade mas fraca exatidão. Isto significa que:**
a. As medições estão muito dispersas, mas a média coincide com o valor real.
b. As medições estão muito próximas umas das outras, mas longe do valor real.
c. O erro sistemático é nulo, mas o erro aleatório é elevado.
d. O instrumento necessita de uma resolução superior.

<details>
<summary><b>Resolução</b></summary>
<b>Resposta Correta: b</b>. Boa repetibilidade significa baixa dispersão (baixo erro aleatório), mas fraca exatidão significa que a leitura está deslocada do valor real (alto erro sistemático).
</details>

**3. De acordo com as regras do Sistema Internacional (SI), qual das seguintes escritas está incorreta?**
a. $10\text{ kg}$
b. $5\text{ m/s}^2$
c. $20\text{ m/s/s}$
d. $15\text{ N}\cdot\text{m}$

<details>
<summary><b>Resolução</b></summary>
<b>Resposta Correta: c</b>. Nunca se deve colocar, após uma barra de divisão, um sinal de divisão ou multiplicação a menos que se usem parêntesis. A notação correta é $m/s^2$ ou $m\cdot s^{-2}$.
</details>

**4. A constante de tempo ($\tau$) de um sensor de 1ª ordem indica o tempo necessário para a saída atingir:**
a. 50% do valor final após um degrau.
b. 63,2% do valor final após um degrau.
c. 95% do valor final após um degrau.
d. 100% do valor final.

<details>
<summary><b>Resolução</b></summary>
<b>Resposta Correta: b</b>. A constante de tempo ($\tau$) corresponde sempre a 63,2% do valor final da resposta ao degrau de um sistema de 1ª ordem.
</details>

**5. O fator de crista (CF) de um sinal define-se como a razão entre:**
a. O valor de pico e o valor RMS.
b. O valor RMS e o valor médio.
c. A amplitude total (span) e a resolução.
d. A potência do sinal e a potência do ruído.

<details>
<summary><b>Resolução</b></summary>
<b>Resposta Correta: a</b>. O Fator de Crista (Crest Factor) define-se como $CF = \frac{V_{peak}}{V_{RMS}}$.
</details>

**6. O ruído térmico (Johnson-Nyquist) num sensor é caracterizado por ser:**
a. Dominante em baixas frequências (ruído $1/f$).
b. Proporcional à raiz quadrada da temperatura absoluta e da largura de banda.
c. Dependente apenas da corrente média que atravessa o dispositivo.
d. Eliminável através de calibração de dois pontos.

<details>
<summary><b>Resolução</b></summary>
<b>Resposta Correta: b</b>. O ruído térmico é dado por $V_{n,rms} = \sqrt{4k_B T R \Delta f}$, dependendo assim da temperatura absoluta e da largura de banda.
</details>

**7. Num ADC de 12 bits com uma gama de entrada de $0$ a $3,3\text{ V}$, o valor do LSB é aproximadamente:**
a. $0,8\text{ mV}$
b. $1,2\text{ mV}$
c. $3,3\text{ mV}$
d. $0,25\text{ mV}$

<details>
<summary><b>Resolução</b></summary>
<b>Resposta Correta: a</b>. $LSB = \frac{3.3}{2^{12} - 1} = \frac{3.3}{4095} \approx 0.000805 \text{ V} = 0.805 \text{ mV}$.
</details>

**8. A relação teórica ideal entre o número de bits ($N$) de um ADC e a sua SNR de quantização é:**
a. $SNR(dB) \approx 6,02N + 1,76$
b. $SNR(dB) \approx 20\log_{10}(N)$
c. $SNR(dB) \approx 1,76N + 6,02$
d. $SNR(dB) \approx 2^N$

<details>
<summary><b>Resolução</b></summary>
<b>Resposta Correta: a</b>. Esta é a fórmula fundamental teórica para o SNR limitado pelo erro de quantização de um ADC ideal alimentado por uma sinusoide de escala total.
</details>

**9. Qual a arquitetura de ADC mais adequada para aplicações de altíssima velocidade (e.g., $1\text{ GHz}$), apesar da resolução limitada?**
a. Aproximações Sucessivas (SAR).
b. Sigma-Delta ($\Sigma\Delta$).
c. Flash.
d. Dual-Slope.

<details>
<summary><b>Resolução</b></summary>
<b>Resposta Correta: c</b>. A arquitetura Flash é a mais rápida (atraso de 1 único comparador) mas tem baixa resolução pelo grande número de comparadores necessários ($2^N - 1$).
</details>

**10. A técnica de sobreamostragem (oversampling) aliada à decimação permite:**
a. Aumentar a largura de banda do sinal medido além da frequência de Nyquist.
b. Melhorar a relação Sinal/Ruído (SNR) e aumentar a resolução efetiva (ENOB).
c. Eliminar a necessidade de qualquer filtro analógico à entrada.
d. Reduzir o consumo de energia para níveis ultra-baixos.

<details>
<summary><b>Resolução</b></summary>
<b>Resposta Correta: b</b>. A sobreamostragem espalha a potência do ruído de quantização por uma banda mais larga, permitindo que a filtragem e decimação subsequentes removam parte desse ruído, melhorando a SNR e o ENOB.
</details>

**11. Um sistema LTI com função de transferência racional é causal se e só se:**
a. A sua Região de Convergência (ROC) incluir o círculo unitário.
b. A sua Região de Convergência (ROC) for o exterior de um círculo definido pelo polo mais externo.
c. Todos os seus zeros estiverem dentro do círculo unitário.
d. Tiver uma resposta impulsional de duração infinita (IIR).

<details>
<summary><b>Resolução</b></summary>
<b>Resposta Correta: b</b>. Num sistema causal, a ROC estende-se para o exterior do polo de maior magnitude. (A opção 'a' refere-se à estabilidade).
</details>

**12. A Transformada Z do sinal $x[n] = a^n u[n]$ é $X(z) = \frac{z}{z-a}$. Para que o sinal seja causal, a ROC deve ser:**
a. $|z| < |a|$
b. $|z| > |a|$
c. Todo o plano $z$, exceto $z=a$.
d. Uma coroa circular entre dois polos.

<details>
<summary><b>Resolução</b></summary>
<b>Resposta Correta: b</b>. Sendo o sinal de lado direito (causal), a ROC tem de ser para o exterior do polo de maior magnitude.
</details>

**13. No plano Z, a frequência de Nyquist ($f_s/2$) corresponde ao ponto:**
a. $z = 1$
b. $z = j$
c. $z = -1$
d. $z = 0$

<details>
<summary><b>Resolução</b></summary>
<b>Resposta Correta: c</b>. A frequência de Nyquist corresponde a $\theta = \pi$ radianos. O ponto $z = e^{j\pi}$ corresponde a $-1$.
</details>

**14. Ao colocar um zero sobre o círculo unitário ($|z|=1$) num filtro digital, garantimos que:**
a. O filtro terá ganho unitário nessa frequência.
b. O filtro terá um nulo perfeito (ganho zero) nessa frequência.
c. O sistema será instável nessa frequência.
d. A fase será linear em todo o espetro.

<details>
<summary><b>Resolução</b></summary>
<b>Resposta Correta: b</b>. A distância de um ponto no círculo unitário a um zero sobre o mesmo círculo unitário pode ser nula, o que faz com que a magnitude da resposta em frequência ($H(e^{j\omega})$) seja exatamente zero na frequência desse ângulo.
</details>

**15. Qual das seguintes afirmações sobre o Filtro de Média Móvel (Moving Average) é FALSA?**
a. É um filtro extremamente rápido e eficiente computacionalmente na sua forma recursiva.
b. Possui uma atenuação (roll-off) lenta no domínio da frequência.
c. Apresenta uma resposta ao degrau pobre, introduzindo grande distorção de overshoot (sobre-elevação).
d. É o filtro ótimo para atenuar ruído aleatório mantendo a rapidez na resposta ao degrau.

<details>
<summary><b>Resolução</b></summary>
<b>Resposta Correta: c</b>. A Média Móvel tem uma excelente resposta ao degrau no domínio do tempo, não introduzindo *overshoot*, sendo essa uma das suas maiores vantagens.
</details>

**16. A técnica de Inversão Espectral permite transformar um filtro Passa-Baixo num filtro:**
a. Passa-Alto.
b. Passa-Banda.
c. Rejeita-Banda.
d. Derivador.

<details>
<summary><b>Resolução</b></summary>
<b>Resposta Correta: a</b>. A Inversão Espectral ("top-for-bottom") converte um passa-baixo num passa-alto subtraindo a saída do passa-baixo ao sinal original (impulso centrado - núcleo do filtro).
</details>

**17. Num filtro Windowed-Sinc, a largura da banda de transição ($BW$) está relacionada com o comprimento do núcleo ($M$) pela aproximação:**
a. $M \approx 4 / BW$
b. $M \approx BW \times f_s$
c. $M \approx 1 / \sqrt{BW}$
d. $M \approx 6,02 \times BW$

<details>
<summary><b>Resolução</b></summary>
<b>Resposta Correta: a</b>. Esta é a regra de bolso para estimar a ordem do filtro FIR necessária para alcançar uma determinada banda de transição normalizada ($BW$).
</details>

**18. Qual das seguintes janelas oferece a maior atenuação na banda de rejeição?**
a. Retangular.
b. Hamming.
c. Blackman.
d. Bartlett (Triangular).

<details>
<summary><b>Resolução</b></summary>
<b>Resposta Correta: c</b>. A janela de Blackman atinge atenuações de cerca de -74 dB na banda de rejeição, superando os -53 dB da Hamming e os -21 dB da retangular.
</details>

**19. Um filtro IIR (Infinite Impulse Response) caracteriza-se por:**
a. Utilizar apenas amostras anteriores da entrada para calcular a saída.
b. Ser sempre intrinsecamente estável.
c. Utilizar recursão (coeficientes de realimentação de amostras anteriores da própria saída).
d. Ter uma resposta impulsional que se anula definitivamente após $M$ amostras.

<details>
<summary><b>Resolução</b></summary>
<b>Resposta Correta: c</b>. A recursão (feedback) no cálculo de $y[n]$ a partir de $y[n-k]$ cria uma resposta impulsional que decai exponencialmente mas nunca atinge totalmente o zero (duração infinita).
</details>

**20. Para um filtro passante de banda estreita (ressonador) baseado num par de polos complexos conjugados $p = r e^{\pm j\theta}$, aumentar o raio $r$ (aproximando-o de 1) resulta em:**
a. Uma largura de banda mais larga.
b. Uma largura de banda mais estreita (maior seletividade).
c. Uma resposta mais rápida no domínio do tempo (menor resíduo).
d. Um ganho nulo na frequência de ressonância.

<details>
<summary><b>Resolução</b></summary>
<b>Resposta Correta: b</b>. Quando $r \to 1$, o polo aproxima-se do círculo unitário, o que aumenta o fator Q (fator de qualidade), gerando uma ressonância mais aguda/estreita e com maior atraso e oscilação residual no tempo.
</details>

---

## Parte 2 (Desenvolvimento)

**Exercício 1: Metrologia, Sensores e ADC**
Considere um sistema projetado para medir a força exercida num pedal (célula de carga). A gama de força vai de $0\text{ N}$ a $500\text{ N}$, produzindo uma saída no circuito analógico de condicionamento entre $0\text{ V}$ e $2\text{ V}$. 
O ADC a usar tem **10 bits** de resolução e uma tensão de referência $V_{ref} = 3.3\text{ V}$ (assuma a gama de entrada do ADC de $0$ a $3.3\text{ V}$).

**a)** Qual a resolução do ADC em volt (valor do LSB)? 
**b)** Se ligarmos o condicionamento de sinal diretamente ao ADC (sinal máximo $2\text{ V}$ e $V_{ref} = 3.3\text{ V}$), qual será a resolução efetiva da leitura em força (Newtons por LSB)? 
**c)** Considere que, devido ao ambiente fabril, a célula de carga sofre um erro aleatório (desvio padrão) térmico $\sigma_1 = 0.5\text{ N}$ e o ruído do amplificador é $\sigma_2 = 0.3\text{ N}$. Assumindo o erro de quantização do ADC ($\sigma_q = \frac{LSB}{\sqrt{12}}$ em equivalente de força) como terceira fonte de erro, calcule a incerteza total do sistema ($\sigma_{total}$) usando o método de orçamento de erro (RSS). 

<details>
<summary><b>Resolução</b></summary>

**a. Resolução em Volts (LSB):**
$N = 10 \text{ bits} \implies 2^{10} = 1024 \text{ níveis}$.
$LSB = \frac{V_{ref}}{2^{N}-1} = \frac{3.3}{1023} \approx 3.226 \text{ mV}$.

**b. Resolução em Força (N/LSB):**
Primeiro, calculamos a sensibilidade do sistema analógico:
$S = \frac{\Delta V}{\Delta F} = \frac{2 - 0}{500 - 0} = \frac{2}{500} = 0.004 \text{ V/N} = 4 \text{ mV/N}$.
A resolução do sistema em Newtons é o quanto um degrau do ADC (LSB) representa fisicamente:
$\Delta F_{min} = \frac{LSB}{S} = \frac{3.226 \text{ mV}}{4 \text{ mV/N}} \approx 0.806 \text{ N/LSB}$.

**c. Orçamento de Erro (RSS):**
O ruído de quantização em Newtons (desvio padrão da distribuição uniforme) é:
$\sigma_q = \frac{\Delta F_{min}}{\sqrt{12}} = \frac{0.806}{\sqrt{12}} \approx \frac{0.806}{3.464} \approx 0.233 \text{ N}$.
As outras fontes são $\sigma_1 = 0.5 \text{ N}$ e $\sigma_2 = 0.3 \text{ N}$.
A incerteza combinada (RSS) é:
$\sigma_{total} = \sqrt{\sigma_1^2 + \sigma_2^2 + \sigma_q^2} = \sqrt{0.5^2 + 0.3^2 + 0.233^2} = \sqrt{0.25 + 0.09 + 0.054} = \sqrt{0.394} \approx 0.628 \text{ N}$.
</details>

---

**Exercício 2: Projeto de Filtro IIR por Colocação de Polos e Zeros**
Pretende-se isolar (deixar passar) o sinal de vibração de um motor a operar num regime estrito de $1200\text{ RPM}$ ($20\text{ Hz}$). O sistema tem uma frequência de amostragem de $f_s = 200\text{ Hz}$. Para o efeito, vai ser projetado um **filtro passa-banda de 2ª Ordem (Ressoador)** através da colocação de polos e zeros.

**a)** Quais os pontos no plano Z (raio e ângulo) onde deve colocar os dois Zeros deste filtro para garantir que as componentes contínuas (DC) e as frequências máximas admitidas pelo teorema de Nyquist são totalmente rejeitadas?
**b)** Calcule o ângulo $\theta$ (em radianos) onde devem ser posicionados os polos complexos conjugados para amplificar a componente de $20\text{ Hz}$.
**c)** Determine o raio $r$ dos polos para que a largura da banda passante a $-3\text{ dB}$ (BW) seja de $4\text{ Hz}$. Use a aproximação $BW_{Hz} \approx \frac{(1-r)f_s}{\pi}$.
**d)** Escreva a expressão da função de transferência $H(z)$ omitindo o valor da constante $K$.

<details>
<summary><b>Resolução</b></summary>

**a. Zeros:**
Para atenuar DC (frequência 0 Hz), coloca-se um zero na parte real positiva em $z=1$ ($\theta = 0$).
Para atenuar a frequência de Nyquist ($f_s/2 = 100 \text{ Hz}$), coloca-se um zero na parte real negativa em $z=-1$ ($\theta = \pi$).
Portanto, os zeros são: $z_1 = 1$ e $z_2 = -1$.

**b. Ângulo dos Polos:**
O ângulo no plano Z é proporcional à frequência: $\theta = 2\pi \frac{f_0}{f_s}$.
$\theta = 2\pi \frac{20}{200} = 2\pi(0.1) = 0.2\pi \text{ rad} = \frac{\pi}{5} \text{ rad}$ (ou $36^\circ$).

**c. Raio dos Polos (r):**
Sabemos que $BW \approx \frac{(1-r)f_s}{\pi}$.
Substituindo com $BW = 4 \text{ Hz}$ e $f_s = 200 \text{ Hz}$:
$4 = \frac{(1-r) \times 200}{\pi} \implies 4\pi = 200(1-r) \implies 1-r = \frac{4\pi}{200} = \frac{\pi}{50}$.
Como $\pi \approx 3.1415$, temos $1-r \approx \frac{3.1415}{50} \approx 0.0628$.
Assim, $r \approx 1 - 0.0628 = 0.9372$.

**d. Função de Transferência H(z):**
A fórmula genérica é $H(z) = K \frac{(z - z_1)(z - z_2)}{(z - p_1)(z - p_2)}$.
Temos os zeros $z_1=1$ e $z_2=-1$. O numerador é $(z-1)(z+1) = z^2 - 1$.
Temos os polos em $p_{1,2} = r e^{\pm j\theta} = 0.9372 e^{\pm j0.2\pi}$.
A equação expandida do denominador para um par conjugado é $z^2 - 2r\cos(\theta)z + r^2$.
$H(z) = K \frac{z^2 - 1}{(z - 0.9372 e^{j0.2\pi})(z - 0.9372 e^{-j0.2\pi})}$.
(Alternativamente, escrito com potências negativas: $H(z) = K \frac{1 - z^{-2}}{1 - 2(0.9372)\cos(0.2\pi)z^{-1} + 0.9372^2 z^{-2}}$).
</details>
