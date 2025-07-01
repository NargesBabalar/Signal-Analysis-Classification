# 🪄 Audio Classification of Harry Potter Scenes  
_Character, Music, and Scene Type Detection from Movie Audio_

This project focuses on the **analysis, processing, and classification** of audio signals from **Harry Potter** movie scenes.  
We use **machine learning** and **signal processing techniques** to classify audio clips based on:
- Spoken characters  
- Background music presence  
- Scene type (e.g., action, emotional, dialog)

---

## 🛠 Technologies Used

- **Python** (`Librosa`, `NumPy`, `Pandas`)  
- **Machine Learning**: `Scikit-learn`, `TensorFlow` / `PyTorch`  
- **Visualization**: `Matplotlib`, `Seaborn`  
- **Development**: `Jupyter Notebooks`  
- Signal processing & feature extraction pipelines

---

## 🔄 Workflow Summary

### 1️⃣ Audio Preprocessing
- Convert stereo → **mono**
- Resample to **16 kHz**
- **Trim silence**, normalize loudness
- Segment long audio into **fixed-length chunks**

### 2️⃣ Feature Extraction
Extracted using `librosa`:
- **MFCCs** (Mel-Frequency Cepstral Coefficients)  
- **Chroma features**  
- **Spectral Contrast**  
- **Zero-Crossing Rate**  
- **Root Mean Square Energy**

### 3️⃣ Model Building

| Model Type              | Input Format         |
|--------------------------|----------------------|
| **CNN**                 | Spectrogram images   |
| **LSTM**                | MFCC sequences       |
| **SVM / Random Forest** | Statistical features |

### 4️⃣ Evaluation Metrics
- Accuracy  
- Precision / Recall / F1-Score  
- Confusion Matrix  
- ROC-AUC (for binary/multiclass tasks)

---

## 📊 Result Highlights

| Model        | Accuracy | F1-Score | AUC  |
|--------------|----------|----------|------|
| **CNN**      | 91.2%    | 0.90     | 0.94 |
| **LSTM**     | 89.4%    | 0.88     | 0.92 |
| **SVM (MFCC)**| 85.7%   | 0.86     | 0.89 |

---

## 🚀 Potential Improvements

- Fine-tuning on **noisy dialogue** segments  
- Speaker separation via **diarization**  
- Integrate **transformer-based audio encoders** (e.g., `Wav2Vec2`)

---

## ▶️ How to Run

### 1. Clone repository & install requirements
```bash
pip install -r requirements.txt
```

### 2. Extract features
```bash
python utils/extract_features.py --input audio_files/ --output features/
```

### 3. Train a model
```bash
python train.py --model cnn
```

### 4. Evaluate model
```bash
python evaluate.py --model cnn
```

---

## 🙏 Acknowledgements

- Audio clips used under **fair use** for educational and academic purposes only.  
- Inspired by the **wizarding world of Harry Potter**.

> 🧙‍♂️ This project combines magic and machine learning to explore the audio landscape of cinematic storytelling.
