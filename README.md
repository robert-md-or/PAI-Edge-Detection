# 🛰️ Segmentarea Imaginilor bazată pe Contururi
### Prelucrarea și Analiza Imaginilor — Universitatea din Oradea
**Specializarea:** Electronică Aplicată, Anul 3  
**Autor:** Robert Moldovan  
**Imagini:** Fotografie aeriană originală — DJI Neo 2, regiunea Oradea, România

---

## 📋 Descrierea proiectului

Proiect care implementează și compară **5 operatori clasici de detecție a contururilor** aplicați pe imagini aeriene originale capturate cu drona DJI Neo 2 deasupra regiunii Oradea.

Scopul principal este analiza comparativă a performanței fiecărui algoritm în condiții diferite de iluminare:
- 🌙 **Fotografie de noapte** — Primăria Oradea, iluminat artificial, zgomot ISO ridicat
- ☀️ **Fotografie de zi** — Lac și pădure, lumină naturală uniformă, contururi organice
- 🌅 **Fotografie la apus** — Șosea, contrast dramatic cer/pământ, condiții de low-light

---

## 🔬 Metode implementate

| Metodă | Tip operator | Caracteristică principală |
|--------|-------------|--------------------------|
| **Sobel** | Gradient de ordinul 1 | Sensibil la zgomot, rapid |
| **Gaussian + Sobel** | Pre-procesare + gradient | Reduce zgomotul, slăbește contururile |
| **Prewitt** | Gradient de ordinul 1 | Similar Sobel, kernel uniform |
| **Canny (ajustat)** | Multi-etapă | Cel mai robust, parametri optimi per imagine |
| **LoG** | Laplacian de ordinul 2 | Foarte sensibil, detectează orice variație |

---

## 📊 Rezultate cantitative

Densitatea pixelilor de contur detectați (% din totalul imaginii):

| Imagine | Sobel | Gauss+Sobel | Prewitt | Canny | LoG |
|---------|-------|-------------|---------|-------|-----|
| IMG1 Noapte | 3.944% | 1.552% | 3.933% | 2.329% | 6.251% |
| IMG2 Lac | 4.523% | 1.995% | 4.530% | 10.081% | 9.773% |
| IMG3 Șosea | 1.803% | 0.968% | 1.802% | 0.423% | 5.487% |

---

## 🧠 Concluzii principale

- **Gaussian + Sobel** produce întotdeauna cea mai mică densitate — blur-ul elimină atât zgomotul cât și contururile fine
- **Canny ajustat** e cel mai selectiv pe IMG3 (0.4%) — detectează doar contururile cu adevărat semnificative
- **LoG** are cea mai mare densitate în toate cazurile — confirmat ca prea sensibil pentru imagini aeriene fără pre-procesare agresivă
- **Prewitt vs Sobel** — diferențe sub 0.01%, Prewitt ușor mai neted datorită kernelului uniform

---

## 🛠️ Tehnologii folosite

- **MATLAB R2026a** — procesare și vizualizare
- **DJI Neo 2** — capturare imagini aeriene
- **Image Processing Toolbox** — funcții `edge()`, `imgaussfilt()`, `imresize()`

---

## 📁 Structura proiectului

PAI-Edge-Detection/

├── src/

│   └── main.m              # Script principal MATLAB

├── images/

│   ├── input/              # Imagini originale DJI

│   └── output/             # Rezultate generate (PNG 300 DPI)

└── raport/

└── raport_PAI.pdf      # Raport final

---

## ▶️ Rulare

1. Clonează repository-ul
2. Deschide MATLAB și navighează în folderul `src/`
3. Rulează `main.m`
4. Figurile se salvează automat în `images/output/`
