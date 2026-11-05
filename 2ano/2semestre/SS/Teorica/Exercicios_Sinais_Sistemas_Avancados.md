# Exercícios de Sinais e Sistemas (Nível Avançado/Exame)

Este documento contém exercícios focados em interpretação, análise de sistemas e raciocínio lógico, assumindo que as fórmulas base estão disponíveis para consulta.

---

### Exercício 1: Geometria e Raízes Complexas
**Pergunta:** Determine todas as raízes de $z^3 = -i$ e represente-as no plano complexo. Qual é a área do polígono formado por estas raízes?

**Resposta:** As raízes são $z_k = e^{j(\frac{-\pi/2 + 2k\pi}{3})}$ para $k=0,1,2$, resultando em: $z_0 = e^{-j\pi/6}$, $z_1 = e^{j\pi/2}$ (que é $i$), e $z_2 = e^{j7\pi/6}$.

**Explicação:** Usando a fórmula de De Moivre, as raízes de qualquer número complexo formam sempre um polígono regular inscrito numa circunferência de raio $\sqrt[n]{|z|}$. Neste caso, as raízes formam um triângulo equilátero. A área pode ser calculada dividindo o polígono em triângulos isósceles ou usando a geometria do triângulo equilátero inscrito num círculo de raio 1.

---

### Exercício 2: Convolução de Sinais de Duração Infinita
**Pergunta:** Um sistema LTI tem uma resposta impulsional $h[n] = (0.5)^n u[n]$. Se a entrada for um degrau unitário $x[n] = u[n]$, qual será o valor da saída $y[n]$ quando $n \to \infty$?

**Resposta:** $y[\infty] = 2$.

**Explicação:** Aplicando a soma da série geométrica resultante da convolução: $y[n] = \sum_{k=0}^{n} (0.5)^k$. Quando $n$ tende para infinito, a série converge para $\frac{1}{1 - 0.5} = 2$. Fisicamente, o sistema estabiliza num valor de ganho DC igual ao somatório de todos os coeficientes da sua resposta impulsional.

---

### Exercício 3: Design de Filtros e Inversão Espectral
**Pergunta:** Tens um filtro passa-baixo com um kernel $h_{LP} = [0.1, 0.2, 0.4, 0.2, 0.1]$. Queres criar um filtro **rejeita-banda** (notch). É possível fazê-lo usando apenas a técnica de inversão espectral ($\delta[n] - h[n]$)?

**Resposta:** Não diretamente.

**Explicação:** A inversão espectral transforma um passa-baixo num **passa-alto**. Para criar um rejeita-banda, seria necessário subtrair um filtro passa-banda de um impulso (sinal passa-tudo), ou combinar um passa-baixo e um passa-alto com frequências de corte diferentes. A inversão espectral apenas "inverte" o espectro em torno do eixo da amplitude.

---

### Exercício 4: Resolução Espectral e Aliasing
**Pergunta:** Um sinal contém duas frequências: $100\text{ Hz}$ e $105\text{ Hz}$. Estás a amostrar a $f_s = 500\text{ Hz}$. Qual é o número mínimo de amostras $N$ que a tua DFT deve ter para que consigas ver dois picos distintos no espectro, sem que eles se fundam num só?

**Resposta:** $N \ge 100$ amostras.

**Explicação:** A resolução da DFT é dada por $\Delta f = f_s / N$. Para distinguir duas frequências separadas por $5\text{ Hz}$, a resolução deve ser, no mínimo, de $5\text{ Hz}$ por "bin". Logo, $5 = 500 / N \implies N = 100$. Se $N$ for menor, os dois picos aparecerão como um único borrão no espectro.

---

### Exercício 5: Estabilidade de Sistemas Reais (IIR)
**Pergunta:** Um sistema é definido por $y[n] = 1.2y[n-1] + x[n]$. Este sistema é estável? O que aconteceria à saída se aplicasses um impulso unitário $\delta[n]$?

**Resposta:** O sistema é instável. A saída cresceria infinitamente.

**Explicação:** Nos filtros IIR, a estabilidade requer que os coeficientes de recursão (polos) estejam dentro do círculo unitário ($|a| < 1$). Como $1.2 > 1$, o sistema tem um polo instável. A resposta ao impulso seria a sequência $1, 1.2, 1.44, 1.72, \dots$, divergindo para infinito.

---

### Exercício 6: Cascatas de Sistemas e Decibéis
**Pergunta:** Tens dois sistemas em série (cascata). $H_1(s)$ tem uma atenuação de $-3\text{ dB}$ na frequência $f_c$. $H_2(s)$ é idêntico a $H_1(s)$. Qual é a atenuação total em dB na frequência $f_c$ para o sistema combinado? E qual a relação de amplitude linear final?

**Resposta:** $-6\text{ dB}$ de atenuação; Amplitude linear $\approx 0.5$.

**Explicação:** Sistemas em série multiplicam os ganhos lineares, o que corresponde à **soma dos ganhos em dB**. Assim, $-3\text{ dB} + (-3\text{ dB}) = -6\text{ dB}$. Em termos lineares, se cada filtro reduz a amplitude para $0.707$ ($1/\sqrt{2}$), o total é $0.707 \times 0.707 = 0.5$ (o sinal fica com metade da amplitude original).
