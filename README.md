# 🛰️ Segmentarea Imaginilor bazată pe Contururi
### Prelucrarea și Analiza Imaginilor — Universitatea din Oradea
**Specializarea:** Electronică Aplicată, Anul 3  
**Autor:** Robert Moldovan  
**Imagini:** Fotografie aeriană originală — DJI Neo 2, regiunea Oradea, România

---

## 📋 Obiectivul Proiectului
Acest proiect reprezintă o analiză comparativă a **5 operatori fundamentali de detecție a contururilor**, aplicați pe un set de imagini aeriene originale (Primăria Oradea, peisaj lacustru, șosea la apus). 

Proiectul vizează evaluarea comportamentului acestor algoritmi în condiții variate de iluminare (noapte cu ISO ridicat, lumină naturală, contrast dramatic) pentru a determina eficiența fiecărei metode în extragerea trăsăturilor geometrice și a contururilor relevante din imaginile brute.

---

## 🚀 Integrare în Sisteme Embedded și Drone
Dincolo de cerințele academice, acest proiect explorează fundamentele **viziunii artificiale (Computer Vision)**, domeniu vital pentru ingineria sistemelor autonome:

* **Importanța în Drone:** Sistemele de navigație aeriană (precum drona DJI Neo 2 utilizată aici) utilizează algoritmi de *edge detection* în timp real pentru a identifica liniile de orizont, structurile arhitecturale și obstacolele, fiind esențiali pentru procesele de stabilizare optică și evitare a coliziunilor.
* **Procesare de Semnal (DSP):** Matematica din spatele convoluției — inima acestor algoritmi — este aceeași cu cea folosită în filtrarea semnalelor radio și în sistemele moderne de comunicații, fiind o competență de bază pentru orice inginer electronist.
* **De la MATLAB la C++:** Acest proiect demonstrează tranziția de la prototiparea matematică (MATLAB) la logica necesară implementării în cod de nivel jos (C/C++) ce rulează pe hardware-ul dedicat sistemelor embedded.

---

## 🔬 Metode implementate și Teorie
Am implementat și analizat 5 operatori, fiecare având un comportament specific:
1. **Sobel:** Gradient de ordinul 1; rapid, dar sensibil la zgomotul din imagini.
2. **Gaussian + Sobel:** Combină pre-procesarea (blur) cu gradientul; reduce zgomotul, dar tinde să atenueze detaliile fine.
3. **Prewitt:** Gradient de ordinul 1; oferă o detecție uniformă datorită kernelului simplu.
4. **Canny:** Standardul de aur; utilizează *hysteresis thresholding* pentru rezultate robuste, fiind cel mai echilibrat algoritm pentru condiții dificile.
5. **LoG (Laplacian of Gaussian):** Operator de ordinul 2; foarte sensibil, ideal pentru detalii dar susceptibil la detecții false în imagini cu textură bogată.

---

## 📊 Rezultate cantitative (Densitatea pixelilor de contur)

| Imagine | Sobel | Gauss+Sobel | Prewitt | Canny | LoG |
|---------|-------|-------------|---------|-------|-----|
| **IMG1 (Noapte)** | 3.944% | 1.552% | 3.933% | 2.329% | 6.251% |
| **IMG2 (Lac)** | 4.523% | 1.995% | 4.530% | 10.081% | 9.773% |
| **IMG3 (Șosea)** | 1.803% | 0.968% | 1.802% | 0.423% | 5.487% |

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
