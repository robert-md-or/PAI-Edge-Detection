# 🛰️ Segmentarea Imaginilor bazată pe Contururi
### Prelucrarea și Analiza Imaginilor — Universitatea din Oradea
**Specializarea:** Electronică Aplicată, Anul 3  
**Autor:** Robert Moldovan  
**Imagini:** Fotografie aeriană originală — DJI Neo 2, regiunea Oradea, România

---

## 📋 Obiectivul Proiectului
Acest proiect reprezintă o analiză comparativă a **5 operatori fundamentali de detecție a contururilor**, aplicați pe un set de imagini aeriene originale (Primăria Oradea, peisaj lacustru, șosea la apus). 

Proiectul vizează evaluarea comportamentului acestor algoritmi în condiții variate de iluminare pentru a determina eficiența fiecărei metode în extragerea trăsăturilor geometrice relevante din imaginile brute.

---

## 🚀 Integrare în Sisteme Embedded (Drone)
Acest proiect explorează fundamentele **viziunii artificiale (Computer Vision)**, esențiale pentru dronele moderne:

* **Navigație și Obstacole:** Algoritmii de *edge detection* (ex: Canny) permit dronelor să identifice linii de orizont și structuri, fiind critici pentru evitarea coliziunilor.
* **Procesare de Semnal (DSP):** Matematica din spatele convoluției este fundamentul oricărui sistem electronic de procesare, fiind o competență cheie pentru inginerii electroniști.
* **Hardware Optimization:** Demonstrează înțelegerea necesară pentru a trece de la prototiparea matematică în MATLAB la implementări de nivel jos (C/C++) necesare pe procesoarele de zbor.

---

## 🔬 Metode implementate
1. **Sobel:** Gradient de ordinul 1; rapid, dar sensibil la zgomot.
2. **Gaussian + Sobel:** Pre-procesare (blur); reduce zgomotul, dar atenuează detaliile fine.
3. **Prewitt:** Gradient de ordinul 1; detecție uniformă.
4. **Canny:** Standardul industrial; cel mai robust datorită *hysteresis thresholding*.
5. **LoG:** Laplacian de ordinul 2; foarte sensibil la texturi fine.

---

## 📊 Rezultate Cantitative

| Imagine | Sobel | Gauss+Sobel | Prewitt | Canny | LoG |
|---------|-------|-------------|---------|-------|-----|
| **IMG1 (Noapte)** | 3.944% | 1.552% | 3.933% | 2.329% | 6.251% |
| **IMG2 (Lac)** | 4.523% | 1.995% | 4.530% | 10.081% | 9.773% |
| **IMG3 (Șosea)** | 1.803% | 0.968% | 1.802% | 0.423% | 5.487% |

### Grafic Comparativ: Densitatea pixelilor de contur
```mermaid
graph TD
    A[IMG1 - Noapte] -->|Cea mai mare densitate| LoG(6.251%)
    A -->|Cea mai mică densitate| GaussSobel(1.552%)
    B[IMG2 - Lac] -->|Cea mai mare densitate| Canny(10.081%)
    B -->|Cea mai mică densitate| GaussSobel2(1.995%)
    C[IMG3 - Șosea] -->|Cea mai mare densitate| LoG3(5.487%)
    C -->|Cea mai mică densitate| Canny3(0.423%)
---

## 🛠️ Stack Tehnic
* **Procesare & Analiză:** MATLAB R2026a (Image Processing Toolbox)
* **Hardware Captură:** DJI Neo 2 (Filtre ND/PL Freewell pentru contrast optim)
* **Workflow:** Optimizat pentru experimente de tip *Embedded Vision*

---

## 📁 Structură Repository
* `/src`: Codul sursă MATLAB (`main.m`) — structurat modular pentru testare rapidă.
* `/images`: Folder care conține imaginile sursă (input) și rezultatele procesate (output).
* `/raport`: Documentația completă:
    * `raport_PAI.pdf`: Analiza matematică și concluziile tehnice detaliate.
    * `raport_PAI.docx`: Versiunea editabilă a raportului.
    * `Prezentare_Proiect.pptx`: Suport vizual pentru susținerea proiectului.

---

## ▶️ Instrucțiuni de rulare
1. Clonează repository-ul: `git clone https://github.com/robert-md-or/PAI-Edge-Detection`
2. Deschide MATLAB și navighează în folderul `src/`.
3. Rulează `main.m`. Scriptul va procesa automat setul de date și va genera output-urile în folderul `images/output/`.

---
*Proiect realizat ca parte a pregătirii inginerești în Electronică Aplicată, punând accent pe corelația dintre teoria procesării de semnal și autonomia sistemelor aeriene.*
*Proiect realizat ca parte a formării de inginer electronist, punând accent pe aplicabilitatea practică în domeniul sistemelor aeriene autonome.*
